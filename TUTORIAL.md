# EMC Midterm Preparation -- Tutorial

## What is this?

A Dockerized Claude Code environment for preparing for the first EMC
(Electromagnetic Compatibility) midterm at NTUST. Claude Code runs inside
a container with full shell access (`--dangerously-skip-permissions`) but
as a non-root user with no sudo. It reads your lecture slides and generates
study materials automatically.

## Project Structure

```
FirstMidterm/
├── Dockerfile              # Debian + Node.js + Claude Code image
├── Makefile                # Build, run, verify, cleanup commands
├── .env                    # API key, model, ntfy topic (DO NOT commit)
├── .dockerignore           # Keeps build context small
├── TUTORIAL.md             # This file
│
├── WorkingDir/             # <-- This is what Claude sees as /workspace
│   ├── CLAUDE.md           # Instructions Claude reads on startup (6 tasks)
│   ├── LectureSlides/      # Your lecture PDFs
│   │   ├── chap1.pdf
│   │   ├── chap2.pdf
│   │   ├── chap3.pdf
│   │   └── chap4.pdf
│   └── .claude/            # Claude Code project config
│       ├── settings.json   # Statusline + stop hook registration
│       ├── statusline-command.sh  # Context window progress bar
│       └── hooks/
│           └── stop-notify.sh     # Sends ntfy.sh notification on session end
│
└── .claude/                # (Legacy, inert -- config moved to WorkingDir)
```

### Key concept: only `WorkingDir/` is mounted

The Docker container mounts `WorkingDir/` as `/workspace`. Claude Code
cannot see the Dockerfile, Makefile, or .env -- only the lecture slides,
CLAUDE.md, and its own config. This is intentional for isolation.

## Prerequisites

- **Docker** installed and running (via Docker Desktop / WSL2)
- **Anthropic API key** from [console.anthropic.com](https://console.anthropic.com)
- (Optional) **ntfy.sh** app on your phone for push notifications

## Quick Start

### 1. Configure your API key

Edit `.env` and replace the placeholder with your real key:

```bash
ANTHROPIC_API_KEY=sk-ant-your-real-key-here
ANTHROPIC_MODEL=claude-sonnet-4-6
NTFY_TOPIC=your-unique-topic-name
```

### 2. Build the Docker image

```bash
make build
```

This builds a Debian image with Node.js, Claude Code, pandoc, and LaTeX
(~5-10 min first time due to texlive packages, ~700MB image).

### 3. Verify everything

```bash
make verify
```

Checks: image exists, .env present, CLAUDE.md exists, LectureSlides/ found,
Claude Code version, ntfy.sh connectivity.

### 4. Launch Claude Code

```bash
make claude
```

Or use the smart shortcut (starts if not running, attaches if running):

```bash
make cc YES=1
```

Claude will read `CLAUDE.md` and begin working through 6 tasks:
1. Extract knowledge from each chapter PDF into `knowledge/` markdown files
2. Verify all extracted equations against original PDFs (re-reads each page)
3. Create concise study notes in `notes/study-notes.md`
4. Identify exam-likely examples in `notes/exam-examples.md`
5. Generate practice test questions in `notes/practice-questions.md`
6. Export all markdown files to PDF via pandoc (with rendered LaTeX equations)

### 5. Attach a second session (optional)

While Claude is working, open a new terminal:

```bash
make claude-attach
```

This opens another Claude Code session in the same container.

## All Commands

| Command             | Description                                    |
|---------------------|------------------------------------------------|
| `make help`         | Show all available commands                    |
| `make build`        | Build the Docker image                         |
| `make update-claude`| Rebuild image with latest Claude Code (no cache)|
| `make claude`       | Launch Claude Code (with confirmation prompt)  |
| `make cc`           | Smart open: start or attach automatically      |
| `make cc YES=1`     | Same, skip confirmation                        |
| `make claude-attach`| Attach to running container                    |
| `make start`        | Open a plain bash shell in the container       |
| `make verify`       | Run all setup checks                           |
| `make stop`         | Stop the running container                     |
| `make clean`        | Remove container and image                     |

## Notifications

When a Claude session ends, the stop hook (`stop-notify.sh`) sends a push
notification via [ntfy.sh](https://ntfy.sh) with a short summary of what
was accomplished (task + last message, max 200 chars).

To receive notifications:
1. Install the ntfy app ([Android](https://play.google.com/store/apps/details?id=io.heckel.ntfy) / [iOS](https://apps.apple.com/app/ntfy/id1625396347))
2. Subscribe to your topic (the value of `NTFY_TOPIC` in `.env`)
3. Run `make verify` to test that notifications arrive

## Security Notes

- Claude runs as user `claude` (non-root, no sudo)
- No Docker socket is mounted (no container escape possible)
- `.env` with your API key is never sent to Docker build context
- `--dangerously-skip-permissions` gives Claude full shell access
  **inside the container only** -- set a spending limit at
  [console.anthropic.com](https://console.anthropic.com)

## Output Files

After Claude finishes, `WorkingDir/` will contain:

```
WorkingDir/
├── knowledge/              # Detailed knowledge per chapter
│   ├── chap1.md ... chap4.md
│   └── equation-corrections.md   # Log of any equation fixes
├── notes/
│   ├── study-notes.md      # Concise study notes
│   ├── exam-examples.md    # Likely exam problems
│   └── practice-questions.md  # Practice test with answers
└── pdf/                    # Rendered PDFs with LaTeX equations
    ├── chap1-knowledge.pdf
    ├── study-notes.pdf
    ├── exam-examples.pdf
    └── practice-questions.pdf
```

Every equation includes a source citation like *(chap2.pdf, p.15)* so you
can cross-reference the original slides. The `.md` files render nicely in
Obsidian; the `.pdf` files have fully rendered LaTeX equations.

## Troubleshooting

**"ANTHROPIC_API_KEY not set"** -- Make sure `.env` exists and has your key.
Run `make env-setup` if starting fresh.

**Claude can't read PDFs** -- Claude Code has native PDF reading (multimodal).
If it tries `pymupdf` and fails, it will `pip install` it automatically.
Make sure the PDF files are fully downloaded (not iCloud placeholders).

**ntfy notification not arriving** -- Run `make verify` to test connectivity.
Check that `NTFY_TOPIC` in `.env` matches your phone subscription.

**Image build fails** -- Try `make update-claude` to rebuild without cache.
Check your internet connection (needs npm, nodesource, debian repos).

**PDF export fails with LaTeX error** -- Usually a malformed equation. Claude
will fix and retry automatically. If it persists, check `knowledge/equation-corrections.md`
for flagged equations.
