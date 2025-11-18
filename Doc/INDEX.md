# Project Docs Index (human-maintained)

This repository includes an interactive, machine-generated HTML index that is the current source‑of‑truth for the Doc/ folder:

- Interactive index (recommended to browse, search and preview files): ./index.html
  - Serve the Doc folder and open: `http://localhost:8000/index.html`
  - Or view it on GitHub Pages if you publish `Doc/` there.

Why this file exists
- This lightweight INDEX.md is intentionally small and human-maintained.
- It points to the interactive index (Doc/index.html) for full, up-to-date listing and previews of PDFs, MD conversions and text files.

If you must edit contents (rare)
- Edit Doc/index.html (generated output) only if you're making tiny ad-hoc UI tweaks.
- To change which files are shown / categories, update the source files in Doc/ and Doc/md_outputs/, then re-run the generator:
  ```
  python tools/generate_index_html.py --doc-dir Doc --md-dir Doc/md_outputs --out Doc/index.html
  ```
  or run the CI job (if configured) to regenerate automatically on push.

Quick links
- Interactive HTML: ./index.html
- Converted markdowns: ./md_outputs/
- Auto-generated machine index: ./_autogen_index.md

If you want, I can:
- A) Replace the current Doc/INDEX.md with this file and commit it in a branch + open a PR, or
- B) Update the repository to treat Doc/index.html as canonical (add a small README note and/or GitHub Action to auto-regenerate the HTML on push),
- C) Do nothing and leave the file as you created it locally.

Reply with: “Create PR” to have me commit option A (default branch name: docs/sync-index), or tell me which option you prefer.
