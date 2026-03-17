---
description: "Resume vs. CV strategy: CV is the authoritative source of truth; resume can be tailored to each job posting."
name: "CV/Resume Strategy"
---

# CV vs. Resume Strategy

## Core Principle

- **CV (`src/kassabian_marvin_cv.tex`)** is the source of truth and must remain authentic.
  - Document actual experience, skills, and accomplishments as they happened.
  - Small exaggerations are acceptable (better framing, selective emphasis), but no invented projects, employers, dates, or skills.
  - Serves as the authoritative reference pool for any resume tailoring.

- **Resume (`src/kassabian_marvin_resume.tex`)** can be tailored to each job posting.
  - Select, reorder, and reframe content from the CV to maximize alignment with the target role.
  - Can include skills, technologies, or brief experience bullets that are *plausibly* supported by the CV but not explicitly listed (e.g., "Angular" or "Java" if the CV demonstrates nearby full-stack work without naming them directly).
  - May omit authentic experience if it doesn't serve the target role.
  - Must not invent facts (projects, dates, employers, metrics) that are entirely absent from the CV.

## Workflow

1. When tailoring a resume for a job posting:
   - Create a job-specific branch: `docs/YYYYMMDD-company-position`
   - Consult the CV first to identify what is authentically available.
   - Update only `src/kassabian_marvin_resume.tex`.
   - Do not modify the CV for job tailoring.

2. When adding new authentic experience:
   - Update both `src/kassabian_marvin_cv.tex` and any active tailored resumes, or note that old branches will have stale resume content.
   - CV updates should reflect verified experience first.

3. Before committing resume edits:
   - Verify that every claim is either verbatim from the CV or a defensible reframing supported by CV content.
   - Note any gaps that remain unfilled by the CV.

## Rationale

- Keeps the CV clean and verifiable for reference checks or follow-up conversations.
- Allows resume optimization without ethical compromise or inconsistency risk.
- Maintains a clear audit trail of what is sourced fact vs. job-specific emphasis.
