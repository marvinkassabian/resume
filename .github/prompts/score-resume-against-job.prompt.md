---
description: "Score the current resume against a job posting from the hiring department's perspective, like an ATS/Workday screening pass followed by a recruiter review"
name: "score-resume-against-job"
argument-hint: "Optional: emphasis areas, department context, or scoring focus"
tools: [vscode, execute, read, agent, edit, search, web, browser, todo]
---

Evaluate the current resume against a job posting as a neutral hiring-side reviewer.

Primary files:
- Resume: `src/kassabian_marvin_resume.tex`
- Job postings directory: `.context/job-postings/`

## Important

This prompt uses sub-agents for all evaluation passes so each reviewer has genuine context isolation — no chat history, no prior assumptions about the candidate. The orchestrating agent (you) is responsible only for data gathering and delegating to sub-agents. Do not perform any scoring or evaluation yourself.

---

## Job posting source

Resolve the target job posting using this priority order:

1. If the user pasted job description text in the request, use that text.
2. If the user attached a file, use the attachment content.
3. If the currently focused file in the editor is inside `.context/job-postings/`, use that file.
4. Otherwise, run `git branch --show-current` in the terminal to get the exact current branch name.
   - Extract the `YYYYMMDD-company-position` slug from the branch (pattern: `<category>/YYYYMMDD-company-position`).
   - List all files in `.context/job-postings/`.
   - Find the file whose name most closely matches the company and position slug.
   - Use that file as the job posting.
5. If no posting can be resolved, stop and ask the user to supply one before continuing.

---

## Workflow

### 1. Load materials (orchestrator)

- Read `src/kassabian_marvin_resume.tex` in full.
- Read the resolved job posting in full.
- Do not read the CV; evaluators must see only what a hiring department sees.
- Extract the resume as clean plain text by stripping LaTeX commands — this is what you will pass to sub-agents.
  - Remove all `\command{...}`, `\begin{...}`, `\end{...}`, `%` comment lines, and preamble/document-class lines.
  - Preserve all visible text: role titles, dates, bullet content, section headers.
- Extract the list of required qualifications, skills, and technologies from the job posting — this is the requirements list you will pass to the ATS sub-agent.

### 2. ATS keyword pass (sub-agent)

Spawn a new sub-agent with **only** the following context — nothing else:

> You are an applicant tracking system (ATS) screener. You have no knowledge of this candidate beyond the resume text provided.
> Your job is to determine how well the resume covers the requirements list for the role.
>
> Requirements list:
> `{paste the extracted requirements list here}`
>
> Resume text:
> `{paste the extracted plain-text resume here}`
>
> For each requirement, assign a status: **Present** (explicit match), **Partial** (adjacent or implied), or **Missing** (no evidence).
> Return a markdown table with columns: Requirement | Status | Evidence in Resume.
> After the table, assign an **ATS Score (1.0–10.0)** based purely on keyword and requirement coverage. Use exactly one decimal place (for example, `8.7`). Provide 2–3 sentences of justification.

Collect the sub-agent's full response.

### 3. Recruiter / hiring manager review (sub-agent)

Spawn a second new sub-agent with **only** the following context — nothing else:

> You are a recruiter and hiring manager screening candidates for the following role. You have no prior knowledge of this candidate.
> Spend approximately 30 seconds on a first-pass skim, then do a deeper review.
>
> Job posting:
> `{paste the full job posting text here}`
>
> Resume:
> `{paste the extracted plain-text resume here}`
>
> Evaluate:
> - How well does the candidate's experience level, scope, and background map to the role?
> - Are the strongest signals easy to find on a quick skim?
> - Are there red flags or missing signals that would cause this resume to be filtered out?
>
> Then:
> 1. Assign a **Recruiter Score (1.0–10.0)** for overall fit, relevance, clarity, and signal strength. Use exactly one decimal place (for example, `9.1`). Provide 2–3 sentences of justification.
> 2. List the most significant **hard gaps** (requirements with no resume evidence) and **soft gaps** (signals likely present but not clearly communicated), in priority order.
> 3. List up to 5 **quick wins** — specific, actionable improvements that surface existing experience more effectively without adding false information. Tie each to a concrete job requirement.

Collect the sub-agent's full response.

### 4. Compile the final report (orchestrator)

Combine the two sub-agent outputs into the structured report defined below.

---

## Output format

Return a structured report with these sections in order:

1. **Job Posting Resolved** — confirm which file or source was used
2. **ATS Keyword Table** — from ATS sub-agent
3. **ATS Score** — decimal score with justification, from ATS sub-agent
4. **Recruiter Review** — from hiring manager sub-agent
5. **Recruiter Score** — decimal score with justification, from hiring manager sub-agent
6. **Top Gaps** — hard vs. soft, from hiring manager sub-agent
7. **Quick Wins** — from hiring manager sub-agent

Do not print the full resume text or raw LaTeX in the response.
Keep the report concise and skimmable.
Preserve sub-agent decimal scores exactly as returned; do not round or convert them to integers in the final report.
