---
description: "Prepare a job-specific branch, score the current resume against a job posting, improve it using facts from the CV, and report remaining gaps"
name: "tailor-resume-to-job"
argument-hint: "Optional: target role, company, or emphasis areas"
tools: [read, edit, execute, agent]
---

Tailor the resume to a specific job posting.

Primary files:
- Resume target: `src/kassabian_marvin_resume.tex`
- Source pool: `src/kassabian_marvin_cv.tex`

## Role split

This prompt uses sub-agents for all scoring passes so each reviewer has genuine context isolation — no chat history, no prior assumptions about the candidate.
- **Orchestrator (you):** job posting resolution, branch management, reading files, editing the resume, extracting plain text for sub-agents.
- **Scoring sub-agents:** evaluate only what they are explicitly given. Never score the resume yourself.

Job posting input sources (use in this order):
1. If the user pasted job description text in the request, use that text.
2. If the user attached a file, use the attachment content.
3. If neither is provided, use the currently focused file in the editor.

Primary goals:
- Ensure resume tailoring happens on a job-specific git branch rather than `main` or an unrelated branch.
- Score the current resume against the job before editing.
- Improve the resume using only information already present in the CV.
- Maximize the match for the target role without inventing experience.
- Report what is still missing after the update.

Workflow:

1. Determine the job posting source.
- Identify whether the job posting came from pasted text, an attachment, or the focused file.
- If the source is missing, empty, or clearly not a job posting, stop and ask for the correct content.

2. Prepare the git branch before editing.
- Run `git branch --show-current` in the terminal to get the exact current branch name.
- Run `git status --short` to check for uncommitted changes before touching any files.
- If the current branch is `main`, `master`, or clearly unrelated to the target job posting, create and switch to a new branch from the current `HEAD` before editing.
- Use the branch pattern `<category>/YYYYMMDD-company-position`.
- Default the category to `docs` unless the user explicitly prefers a different category.
- Build the `YYYYMMDD-company-position` portion from the job posting metadata when available:
  - date: use the date from the filename if available; otherwise use today's date
  - company: use a kebab-case company name from the job posting
  - position: use a kebab-case role title from the job posting
- Example: `docs/20260316-deloitte-senior-full-stack-engineer-platforms`
- Keep the branch name lowercase, ASCII, and hyphen-separated.
- Derive the expected branch slug from the posting metadata before deciding whether the current branch is acceptable.
- Reuse the current branch only if its suffix exactly matches the expected `YYYYMMDD-company-position` slug.
- Treat any branch with a different date, company, or role slug as the wrong branch, even if it is another resume-tailoring branch.
- If the current branch has the right company but a shortened or altered role slug, treat it as the wrong branch and create the exact expected branch name instead.
- If there are uncommitted changes that would make branch creation or safe resume editing ambiguous, stop and briefly ask the user how to proceed rather than guessing.

3. Read the current materials.
- Read the full current resume from `src/kassabian_marvin_resume.tex`.
- Read the full CV from `src/kassabian_marvin_cv.tex`.
- Treat the CV as the authoritative pool of facts you may use to strengthen the resume.

4. Score the current resume before editing (sub-agent).

   Before editing anything, extract a plain-text version of the resume by stripping LaTeX commands (remove `\command{...}`, `\begin{...}`, `\end{...}`, `%` comment lines, and preamble lines — preserve all visible text: titles, dates, bullets, section headers).

   Spawn a sub-agent with **only** the following context — nothing else:

   > You are a hiring manager and technical recruiter evaluating a candidate for the role described below. You have no prior knowledge of this candidate.
   > Score this resume as an advocate for the hiring company: How well does this candidate appear to fit the role?
   >
   > Job posting:
   > `{paste the full job posting text here}`
   >
   > Resume:
   > `{paste the extracted plain-text resume here}`
   >
  > 1. Assign a **pre-edit match score (1.0–10.0)** from the company's perspective. Use exactly one decimal place (for example, `8.4`).
   > 2. Provide 2–3 sentences of justification grounded only in evidence present in the resume.
   > 3. List the main reasons the score is not higher (missing signals, weak alignment, unclear fit).

  Collect and record the sub-agent's full response as the **pre-edit score**.

5. Update the resume.
- Edit `src/kassabian_marvin_resume.tex` in place.
- Preserve valid LaTeX syntax, the existing document structure, and the overall concise resume format.
- Prefer targeted improvements to summary, skills, and bullets over expanding the resume unnecessarily.
- Pull supporting details from `src/kassabian_marvin_cv.tex` when they improve alignment with the job posting.
- Reorder, tighten, or replace bullets when needed to better match the role.
- Keep the resume truthful and concise.

6. Constrain the edits.
- Do not invent skills, tools, responsibilities, metrics, employers, dates, or achievements.
- Do not add facts that are absent from both the current resume and the CV.
- Do not degrade readability by stuffing keywords.
- Do not rewrite the CV; only update the resume.
- Keep the resume appropriate for a one-page to short resume style unless the existing file clearly uses a different standard.

7. Re-score after editing (sub-agent).

   Extract a fresh plain-text version of the updated resume using the same LaTeX-stripping approach as step 4.

   Spawn a new sub-agent with **only** the following context — nothing else:

   > You are a hiring manager and technical recruiter evaluating a candidate for the role described below. You have no prior knowledge of this candidate.
   > Score this resume as an advocate for the hiring company: How well does this candidate appear to fit the role?
   >
   > Job posting:
   > `{paste the full job posting text here}`
   >
   > Resume:
   > `{paste the extracted plain-text updated resume here}`
   >
  > 1. Assign a **post-edit match score (1.0–10.0)** from the company's perspective. Use exactly one decimal place (for example, `9.2`).
   > 2. Provide 2–3 sentences of justification grounded only in evidence present in the resume.
   > 3. Briefly explain what signals stand out positively for this role.

   Collect and record the sub-agent's full response as the **post-edit score**.

8. Report remaining gaps.
- List the most important missing qualifications, experiences, or signals that still prevent a higher score.
- Separate true missing experience from information that may exist in the CV but should not be added because it would weaken the resume or be too tangential.

Output format:
- Always update `src/kassabian_marvin_resume.tex` in place.
- Do not print the full revised resume in chat.
- Return a concise final response that includes:
  - the branch used or created
  - the pre-edit score as a decimal
  - the post-edit score as a decimal
  - a short summary of what changed
  - the remaining gaps that still limit the score
- Preserve the decimal score format exactly as returned by the scoring sub-agents; do not round or convert scores to integers.

Rules:
- Optimize for evidence-backed alignment, not generic phrasing.
- Prefer exact job-relevant terminology when it is already supported by the CV.
- Preserve ASCII punctuation unless LaTeX content requires otherwise.
- If the job posting emphasizes a technology or responsibility that is not supported by the CV, explicitly leave it out and mention it as a remaining gap.
- Do not continue editing on `main` or an unrelated branch when a job-specific branch should be created first.

Additional context:
{Optional company, role title, or emphasis areas supplied by the user}