---
description: "Keep a factual career master, write a candid academic CV, and tailor resumes to job postings."
name: "CV/Resume Strategy"
---

# CV vs. Resume Strategy

## Core Principle

- **Career master (`src/kassabian_marvin_career_master.tex`)** is the authoritative source of experience, skills, and accomplishments. Keep it factual.
  - Document actual experience, skills, and accomplishments as they happened.
  - Do not invent projects, employers, dates, skills, metrics, or responsibilities.
  - Serves as the reference pool for both the graduate-school CV and tailored resumes.

- **CV (`src/kassabian_marvin_cv.tex`)** is a concise, candid document for academic applications.
  - Select relevant material from the career master and describe it plainly.
  - Keep claims proportional to the work performed; avoid marketing language and unsupported framing.

- **Resume (`src/kassabian_marvin_resume.tex`)** can be tailored to each job posting.
  - Select, reorder, and reframe content from the career master to fit the target role.
  - Can include skills, technologies, or brief experience bullets that are *plausibly* supported by the career master but not explicitly listed (e.g., "Angular" or "Java" if the record demonstrates nearby full-stack work without naming them directly).
  - May omit authentic experience if it doesn't serve the target role.
  - Must not invent facts (projects, dates, employers, metrics) that are entirely absent from the career master.

## Workflow

1. When tailoring a resume for a job posting:
   - Create a job-specific branch: `docs/YYYYMMDD-company-position`
   - Consult the career master first to identify what is authentically available.
   - Update only `src/kassabian_marvin_resume.tex`.
   - Do not modify the CV for job tailoring.

2. When adding new authentic experience:
   - Update `src/kassabian_marvin_career_master.tex` first, then update the CV and any active tailored resumes as appropriate.
   - Keep the CV grounded in the career master.

3. Before committing resume edits:
   - Verify that every claim is either verbatim from the career master or a defensible reframing supported by it.
   - Note any gaps that remain unfilled by the career master.

## Rationale

- Keeps the career master comprehensive while allowing the CV to remain concise and appropriate for academic applications.
- Allows resume optimization without ethical compromise or inconsistency risk.
- Maintains a clear audit trail of what is sourced fact vs. job-specific emphasis.
