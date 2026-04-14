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
