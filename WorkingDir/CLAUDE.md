<<<<<<< HEAD
# EMC First Midterm -- Study Notes Generator

## Source material
Lecture slides: `LectureSlides/chap1.pdf` through `chap4.pdf`.

## Output rules
- Output reads like class notes taken by a diligent student. Never mention AI, agents, or automation.
- Target audience: university student with EM fields + intro radio-wave background. Still, give a brief intro before each new topic -- don't assume EMC-specific knowledge.
- Slides are the single source of truth. Don't invent or infer beyond them. Flag ambiguity with `<!-- VERIFY -->`.
- Every equation needs a source citation: *(chapX.pdf, p.Y)*.

---

## Execution model (CRITICAL)

Prior runs blew the context window because full-page slide images were loaded into chat. This workflow is **text-first, image-never-in-context, session-per-chapter**:

1. **Never paste a PDF page image into chat.** Use `pdftotext -layout LectureSlides/chapN.pdf -` to get the text. Use `pdfinfo LectureSlides/chapN.pdf` for page counts.
2. **Each task below runs in a fresh Claude session** (invoked by the Makefile with `claude -p`). You will see only the task at hand, this `CLAUDE.md`, and whatever files already exist on disk. There is no cross-task memory -- write everything the next task needs into files.
3. **If a figure is genuinely needed** (a diagram truly cannot be described in text): extract exactly that one page, crop tightly, save to `figures/`, and do **not** keep the image in context. Pipeline:
   ```bash
   pdftoppm -r 120 -f P -l P LectureSlides/chapN.pdf /tmp/pg -png
   convert /tmp/pg-*.png -crop WIDTHxHEIGHT+X+Y figures/chapN-topic.png
   rm /tmp/pg-*.png
   ```
   Then reference the saved PNG in markdown as `![caption](figures/chapN-topic.png)`. Never re-open the cropped PNG in chat.
4. **Avoid `extract_slides_as_images` (the MCP server) unless `pdftotext` truly fails for that page.** Text extraction is pre-installed (`poppler-utils`) and costs ~0 tokens compared to images.

---

## Tasks

The Makefile runs each task as a separate `claude -p` invocation with a fresh context. Tasks are listed here for reference -- the Makefile targets (`extract-chap-N`, `verify-equations`, `synthesize`, `pdfs`) point back to these sections.

### Task 1: Per-chapter knowledge extraction

Invoked once per chapter: `make extract-chap-1`, `make extract-chap-2`, etc. The prompt tells you which chapter to process.

For chapter N:
- Run `pdftotext -layout LectureSlides/chapN.pdf knowledge/chapN.raw.txt` (or pipe to stdout and read).
- Work from that text. Preserve all equations as LaTeX (`$...$` inline, `$$...$$` display).
- Every equation in `knowledge/chapN.md` must carry `*(chapN.pdf, p.Y)*`.
- Describe diagrams in words. Only extract a cropped PNG if the diagram is essential and words won't do (typical target: 0-3 figures per chapter).
- Output: `knowledge/chapN.md` plus any PNGs in `figures/chapN-*.png`.
- Delete `knowledge/chapN.raw.txt` on completion if you created one.
- Do **not** read other chapters. Do **not** touch other `knowledge/chap*.md` files.

### Task 2: Equation verification

Invoked once: `make verify-equations`. Fresh session.

- Read all four `knowledge/chap*.md` files.
- For each equation, spot-check against the source using `pdftotext -layout -f P -l P LectureSlides/chapN.pdf -` for the cited page.
- Fix transcription errors in place. Flag unclear ones with `<!-- VERIFY -->`.
- Append to `knowledge/equation-corrections.md`: one section per chapter, listing corrections (or "no errors found").
- Do not extract images. Text is sufficient for equation checking.

### Task 3: Study notes

Invoked once: `make synthesize` (which also runs Tasks 4 and 5). Fresh session, **text only** -- no PDFs, no images re-extracted. All figures are already on disk from Task 1.

- Read all `knowledge/chap*.md` files.
- Produce `notes/study-notes.md`: concise, clear explanations per concept. Brief intro per topic. Reference existing figures by path (`![...](figures/...)`). Every equation cited.

### Task 4: Exam prep examples

Same session as Task 3. Produce `notes/exam-examples.md`:
- Example problems from the knowledge files suitable for a closed-book test
- Key formulas with citations
- Hand-solvable computational examples

### Task 5: Practice questions

Same session as Task 3. Produce `notes/practice-questions.md` organized by chapter. Mix of: conceptual, short calculation, true/false with explanation, multiple choice. Answers in separate section at bottom. Each question references chapter/page.

### Task 6: Export to PDF

Invoked once: `make pdfs`. This is pure `pandoc` -- no Claude reasoning required. The Makefile runs it directly. Engine: **always lualatex** (handles Unicode natively).

Reference command for each markdown file:
```bash
mkdir -p pdf figures
pandoc FILE.md -o pdf/OUTPUT.pdf \
  --pdf-engine=lualatex \
  --template=templates/notes-template.tex \
  -V title="DOCUMENT TITLE"
```

Convert all `knowledge/*.md` and `notes/*.md` to `pdf/`. If a LaTeX error occurs, fix markdown syntax (see Unicode rules below) and retry.

---

## Template design (templates/notes-template.tex)

The template already exists -- do **not** recreate it. Key decisions baked in:

- **Page:** A4, margins `tmargin=0.75in lmargin=0.80in rmargin=1.2in bmargin=1in` (wider right margin for reader annotations).
- **Packages:** `amsmath`, `amssymb`, `booktabs`, `longtable`+`array`+`calc` (required for pandoc markdown tables), `graphicx`, `hyperref`, `enumitem`, `fancyhdr`.
- **Section headings:** `titlesec` with `nobottomtitles*` -- prevents a heading from sitting alone at the bottom of a page.
- **Math line-breaking:** `\relpenalty=9999` and `\binoppenalty=9999` -- keeps inline math expressions on one line.
- **Widow/orphan lines:** `\widowpenalty=10000` and `\clubpenalty=10000`.
- **Header/footer:** left = document title (`$title$`), right = `EMC -- NTUST`, centre = page number.
- **Title block:** centred `\LARGE\bfseries` title with double rule underneath; no date or author.
- **Images:** default width `0.85\linewidth`, aspect ratio preserved.

### Degree signs and Unicode in markdown
- Inside math: use `^\circ` -- e.g. `$90^\circ$`.
- Outside math: use `$^\circ$` -- e.g. `a 90$^\circ$ bend`.
- Never use the literal degree character -- lualatex's default Latin Modern font drops it silently.
- Do **not** use `$^\circ$` inside an already-open math span -- that nests dollar signs and breaks LaTeX.

## Equation format
```
$$E = \frac{V}{d}$$
*(chap1.pdf, p.12)*
```
Inline: $\varepsilon = \varepsilon_0 \varepsilon_r$ *(chap2.pdf, p.3)*
=======
# EMC First Midterm -- Study Assistant

## Role
You are helping a student prepare for the first midterm exam in an
Electromagnetic Compatibility (EMC) course at NTUST (National Taiwan
University of Science and Technology).

## Materials
Lecture slides are in `LectureSlides/`:
- chap1.pdf through chap4.pdf

## Tasks
Complete these tasks in order:

### Task 1: Knowledge Extraction
Read each PDF and convert into detailed knowledge markdown files
(e.g., `knowledge/chap1.md` through `knowledge/chap4.md`).
- Preserve information about diagrams and figures (describe what they show)
- Preserve all equations using LaTeX notation (`$...$` for inline,
  `$$...$$` for display)
- **Behind every equation, add a citation** in the format:
  *(chap2.pdf, p.15)* so the student can find the original immediately
- Include slide/page references for every concept

### Task 2: Equation Verification
After finishing Task 1, re-read each PDF page-by-page and verify every
extracted equation against the original slide:
- Compare each LaTeX equation to the original visually
- Fix any transcription errors (wrong symbols, missing terms, sign errors)
- If an equation is ambiguous or partially visible on the slide, flag it
  with a note like: `<!-- VERIFY: equation unclear on slide -->`
- Log all corrections made in `knowledge/equation-corrections.md`

### Task 3: Concise Study Notes
Create `notes/study-notes.md` with brief, clear explanations of each
concept from the lectures. Target audience: a university student who
has already studied electromagnetic fields and introduction to radio
waves. Keep it simple and to the point.
- Every equation mentioned must include its citation: *(chapX.pdf, p.Y)*

### Task 4: Exam Preparation Examples
Create `notes/exam-examples.md` identifying:
- Example problems from the slides that could appear on a closed-book test
- Key formulas and concepts likely to be tested (with citations)
- Simple computational examples a student should be able to solve by hand
- This is a closed-book midterm at NTUST, so difficulty should be reasonable

### Task 5: Practice Test Questions
Create `notes/practice-questions.md` with practice questions organized
by chapter. Include a mix of:
- Conceptual questions (explain X, compare Y and Z)
- Short calculations
- True/false with explanation
- Multiple choice
Include answers in a separate section at the bottom.
Each question should reference which chapter/page it relates to.

### Task 6: Export to PDF
After all markdown files are complete, convert them to PDF using pandoc:
```bash
pandoc knowledge/chap1.md -o pdf/chap1-knowledge.pdf --pdf-engine=pdflatex
pandoc notes/study-notes.md -o pdf/study-notes.pdf --pdf-engine=pdflatex
pandoc notes/exam-examples.md -o pdf/exam-examples.pdf --pdf-engine=pdflatex
pandoc notes/practice-questions.md -o pdf/practice-questions.pdf --pdf-engine=pdflatex
```
Create the `pdf/` directory first. Pandoc and LaTeX are pre-installed in
this container. If a conversion fails due to a LaTeX error, fix the
equation syntax and retry.

## Equation Format

Every equation in every output file MUST follow this pattern:

```markdown
The electric field intensity is given by:

$$E = \frac{V}{d}$$
*(chap1.pdf, p.12)*
```

Or inline: The permittivity $\varepsilon = \varepsilon_0 \varepsilon_r$
*(chap2.pdf, p.3)* relates...

**Never write an equation without its source citation.**

## Guidelines
- **Always cite** which chapter and page/slide a concept comes from
  so the student can easily find it in the original material
- **Lecture slides are the single source of truth.** Do NOT invent,
  add, or infer information beyond what is in the slides. If something
  is ambiguous, note the ambiguity rather than guessing.
- Work only with the provided slides -- no external sources
- Use Python (available in container) for any numerical verification
  if needed -- install libraries via pip as needed
- Pandoc + texlive are pre-installed for PDF export
>>>>>>> c5b0b435f3af3f08f08cea2c9c10c79f92a8dbe0
