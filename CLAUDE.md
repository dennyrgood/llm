# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

This is a personal document archive about a home AI/LLM infrastructure setup — it is not a software project. There is no source code, no package.json/requirements.txt/Makefile, and no build, lint, or test commands to run. The repo is a `Doc/` folder of PDFs, DOCX files, and converted Markdown notes covering:

- Running local LLMs with **Ollama** across a fleet of Windows/GPU machines (RTX 3060, RTX 3080, GTX 1080 Ti, dual-GPU rigs).
- **ComfyUI + Flux** image-generation pipelines (workflows, model compatibility, dual-GPU splits between Ollama and ComfyUI).
- **Open WebUI** installation, service management (NSSM), data locations (`webui.db`, `uploads/`, `vector_db/`), and Cloudflare Tunnel exposure.
- Model selection/quantization guidance (context tokens, Q4_K_M/Q4_0/BF16/FP8, per-task model recommendations for coding vs. image work).
- `aichat` CLI usage notes.

`Fredy27_max.json` at the repo root is a large (~530KB) JSON artifact (likely a ComfyUI workflow/model export) — not a config file to edit casually.

## Structure that isn't obvious from a directory listing

- `Doc/Doc_INDEX_Version6.md` is the **human-maintained table of contents** for the whole `Doc/` folder — read this first to find anything, rather than globbing files blindly.
- `Doc/md_outputs/` contains Markdown conversions of the PDFs in `Doc/` (same content, more searchable/quotable). When a PDF has a corresponding file here, prefer reading the Markdown version and cite the PDF as the authoritative source only when precision matters.
- `Doc/.dms_state.json`, `Doc/.dms_scan.json`, `Doc/.dms_missing_for_deletion.json` are state files for a document-management/cleanup process (see `Doc/CLEANUP_PLAN.md` and the various `DMS_RECATEGORIZATION_*.md` files) — these track an in-progress archive reorganization, not application state.
- `Doc/ARCHIVE_APPLIED_COMPLETION_REPORT.md` and `Doc/ARCHIVE_CATEGORIZATION_*.md` document past reorganizations of this same Doc folder.

## Working in this repo

- There is nothing to build, lint, or test. Changes here are documentation edits (adding/updating notes, converting a PDF to Markdown, updating the index).
- If you add or convert a document, update `Doc/Doc_INDEX_Version6.md` to reference it, following the existing pattern (MD listed first for searchability, original PDF linked as source).
