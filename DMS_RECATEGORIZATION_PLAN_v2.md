# DMS Recategorization Plan v2 - 7-Day Activity Threshold

**Created:** 2025-12-01  
**Threshold:** Files modified in the last 7 days are CURRENT (Nov 24 - Dec 1)  
**Approach:** Recategorize files >7 days old to `ARCHIVE-*` via DMS only

---

## Key Finding: Recent Activity Trumps Semantics

Many files we thought were "legacy" were **edited/reviewed TODAY or this week**:
- `Best GPUs Next Level - 3090` → edited Dec 1 (0d old) = KEEP
- `Dual RTX 3060 + GTX 1080 Ti` → edited Dec 1 (0d old) = KEEP  
- `One pc rtx3080 + dual 1080ti` → edited Dec 1 (0d old) = KEEP
- `Use both gpus` → edited Dec 1 (0d old) = KEEP
- `Adding Second PC FLUX` → edited Dec 1 (0d old) = KEEP
- `RTX 3060 Image Manipulation - Implementation Plan` → edited Nov 27 (4d old) = KEEP
- `Conversation with Gemini` logs → edited Nov 26 (4d old) = KEEP

**These are YOUR ACTIVE CURRENT WORK** this week. Don't archive them.

---

## Files to Recategorize → `ARCHIVE-*`

### Only 2 Files to Archive (>7 days old, low-value):

**Move to `ARCHIVE-Guides`:**
```
1. Rtx3060 Supplemental Improvements.pdf (13d old)
   └─ Reason: Supplemental notes (integrated into main guides)

2. Prep for 3060 - in the mean time as well.docx (12d old)  
   └─ Reason: Pre-3060 preparation (likely superseded by current week's work)
```

**That's it.** Everything else either:
- Was edited ≤7 days ago (KEEP)
- Or is still useful reference material

---

## ALL Current Files - Keep As-Is (Edited Last Week)

### ✅ ACTIVE THIS WEEK (Dec 1 - most recent):

**Guides (14 files edited Dec 1):**
- Best GPUs Next Level - 3090 (PDF & DOCX) - 0d
- One pc rtx3080 + 2x1080ti (PDF & DOCX) - 0d  
- Use both gpus (PDF & DOCX) - 0d
- Adding Second PC FLUX (PDF & DOCX) - 0d
- Dual RTX 3060 + GTX 1080 Ti Ollama ComfyUI.md - 0d
- NVMe 2230 Acer - Macrium (PDF & DOCX) - 0d
- ComfyUI Image Comparer Node.pdf - 0d

**Models (1 file):**
- Models Ollama ComfyUI Config... (PDF) - 0d

**Troubleshooting (1 file):**
- Models Ollama ComfyUI Config... (MD) - 0d

### ✅ CURRENT (Nov 25-27, 4-5 days old):

**Guides:**
- RTX 3060 Image Manipulation Setup Guide - Troubleshooting Log (DOCX & PDF) - 4d
- RTX 3060 Image Manipulation Setup Guide (Win11 - 2025).pdf - 5d
- ComfyUI RTX 3060 Setup.pdf - 5d
- Conversation with Gemini - ComfyUI Models (PDF & DOCX) - 4d
- Conversation with Gemini - Sequence of memory events (PDF & DOCX) - 4d
- RTX 3060 Image Manipulation Setup Guide - Last Run.txt - 4d

**Workflows:**
- RTX 3060 Image Manipulation - Implementation Plan.pdf - 4d
- Conversation with Gemini - Sequence... (DOCX) - 4d

**Models:**
- Acer Specs.txt - 5d

---

## Files to Keep (No Archival - >7 days but still important)

### ✅ ESSENTIAL REFERENCES (8-21 days old):

**Critical Setup Guides (Still Current):**
- GROK.Ollama.on.Win11.Ultimate.Perf.Guide.md - 13d
- New RTX 3060 Setup - SETTING_UP_REAL_IMAGE_MANIPULATION_LOCAL_SERVER.md - 14d
- RTX 3060 Setup Guide - Complete AI Coding Workflow.pdf - 13d
- Claude session - started the whole rabbit trail... - 13d
- Setting Up Real Image Manipulation on Your Local Server.pdf - 14d
- Open WebUI Management Guide.pdf - 14d
- Open WebUI Installation Guide for Windows 11.pdf - 14d

**Model Inventory (Critical):**
- Ollama Models as of 2025 11 18.txt - 12d ← **MOST IMPORTANT**
- GROK.recommended.llms.w.RTX.3060.txt - 14d
- GROK.recommended.nano.banana.replacement.txt - 14d

**Quick References:**
- Quantization & Context Tokens — A One‑Page Practical Guide.md - 12d
- LLM QUICK SELECTION GUIDE.txt - 13d
- Doc_INDEX_Version6.md - 12d
- LLM Infrastructure Cheat Sheet (Updated).pdf - 19d

**Other Tools/Config:**
- Using 1040 until 3060 Gets Here.txt - 12d
- OpenWebUI — Task Scheduler CLI Reference.txt - 13d
- Managing Ollama Environment Variables in NSSM.pdf - 8d
- Image Generation Options for Open WebUI.pdf - 14d

**Supporting Files (Screenshots, References, Batch Scripts):**
- ollama-show.bat, ollama-ls.txt, ollama-show-out.txt, etc.
- LLM Recommendations for Programming and Development.pdf - 21d
- AIChat CLI guide - 21d
- Models for Python coding.docx - 9d
- Models - *.jpeg (4 screenshot files) - 11-12d
- *.png (6 screenshot files) - 11-22d
- Ollama Download Commands.pdf - 21d

---

## New DMS Categories to Add

```json
"categories": [
  "Guides",
  "QuickRefs",
  "Models",
  "Workflows",
  "Scripts",
  "Junk",
  "Troubleshooting",
  "ARCHIVE-Guides"
]
```

---

## Implementation (Ultra-Simple)

### Step 1: Update `.dms_state.json`
Add new category:
```json
"ARCHIVE-Guides"
```

### Step 2: Recategorize Only 2 Files
```
"./Rtx3060 Supplemental Improvements.pdf": {
  ...
  "category": "ARCHIVE-Guides",  ← Changed
  ...
}

"./Prep for 3060 - in the mean time as well.docx": {
  ...
  "category": "ARCHIVE-Guides",  ← Changed
  ...
}
```

### Step 3: Done
Everything else stays as-is.

---

## Summary

| Action | Count | Notes |
|--------|-------|-------|
| Recategorize → ARCHIVE-Guides | 2 files | Rtx3060 Supplemental, Prep for 3060 |
| Keep (no change) | 77 files | All recently edited or still important |

**Result:** Almost nothing changes. Only files you haven't touched in 2+ weeks get flagged as archived.

---

## Why So Few Archives?

Because you're **actively working** on this LLM setup right now! The fact that you edited 14 files TODAY shows this is live work. These "old hardware" docs are part of your **current dual-GPU implementation this week.**

**Bottom line:** The DMS already reflects reality. Just archive the 2 stragglers.

---

**Questions?**
1. Should I recategorize just these 2 files?
2. Or do you want to review the 7-day threshold? (Could use 14 days instead)
