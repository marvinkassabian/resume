---
description: "Clean pasted or attached job descriptions into structured, readable markdown"
name: "clean-job-description"
argument-hint: "Optional: output filename, company, role title, or date"
tools: [read, edit, execute]
---

Clean a copied-and-pasted job description into a clean markdown file.

Input sources (use in this order):
1. If the user pasted text in the request, use that text.
2. If the user attached a file, use the attachment content.
3. If neither is provided, use the currently focused file in the editor.

Primary goals:
- Preserve meaning exactly.
- Remove copy/paste noise and formatting artifacts.
- Output clean, consistent markdown suitable for later resume tailoring.

Workflow:

1. Determine source text.
- Identify whether input came from pasted text, attachment, or focused file.
- If source text is missing or empty, stop and ask for content.

2. Clean obvious artifacts.
- Remove duplicated lines and repeated headers/footers.
- Remove pagination artifacts, timestamps, UI chrome text, and navigation scraps.
- Normalize whitespace, line breaks, and bullet formatting.
- Keep URLs and email addresses intact.

3. Standardize markdown structure.
- Add a top-level heading using the role title if available.
- Include these sections when content exists:
  - Company
  - Role
  - Location
  - Employment Type
  - Compensation
  - About the Role
  - Responsibilities
  - Required Qualifications
  - Preferred Qualifications
  - Benefits
  - Application Notes
- If a section is not present in source text, omit it rather than inventing details.

4. Keep content faithful.
- Do not summarize away important requirements.
- Do not add facts not present in the source.
- Keep legal/compliance statements if present.

5. Choose a sensible filename.
- If a file target exists (attached file or focused file), rename it to a clear kebab-case filename before finalizing.
- Build the filename from available metadata in this priority: date (if known), company, role title.
- Example pattern: `YYYYMMDD-company-role-title.md`.
- If date is unknown, use `company-role-title.md`.
- Keep names lowercase, ASCII, and hyphen-separated.
- Remove filler words and punctuation that do not affect meaning.
- Do not invent company or role values; only use values present in the source.

6. Write output.
- If an attached file or focused file exists, always update that file in place.
- Do not return the cleaned markdown in chat when a file target exists.
- Only return markdown in chat when there is no file target, or when the user explicitly asks for preview-only output.
- If source is pasted text without a file target, return cleaned markdown in the response and suggest a filename in kebab-case.

Output format:
- Default behavior is in-place file update, not chat output.
- Return only a short confirmation after writing the file.
- Provide cleaned markdown in chat only when explicitly requested by the user or when no file target is available.

Rules:
- Never fabricate missing company, salary, location, or qualification details.
- Keep the final markdown concise and skimmable.
- Prefer plain ASCII punctuation unless the source intentionally requires specific symbols.
- When an attached or focused file is available, write changes to that file and do not output full cleaned markdown in chat by default.
- When an attached or focused file is available, rename the file to a sensible kebab-case name as part of the same operation.

Additional context:
{Optional naming convention, destination folder, or preferred section order}
