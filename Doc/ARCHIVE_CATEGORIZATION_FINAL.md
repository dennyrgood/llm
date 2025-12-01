# Archive Categorization - From archive.these.txt

**Analysis Date:** 2025-12-01  
**Files Analyzed:** 56 from archive.these.txt  
**Archive Recommendation:** 24 files  
**Keep:** 32 files

---

## 🗑️ FILES FOR ARCHIVAL (24 files total)

### ARCHIVE-Hardware (4 files)
**Why:** Different GPU configs, not your current RTX 3060 setup

```
1. Adding Second PC and FLUX on Dual GPUs.docx
   └─ Dual-GPU exploration (not implemented)

2. Best GPUs Next Level - 3090 - 25gig.docx
   └─ Old GPU comparison (3090, not current)

3. One pc rtx3080 other 2x1080ti 11g - best split of ollama and comfyUI.docx
   └─ Different hardware config (RTX 3080 + dual 1080Ti, not your setup)

4. Use both gpus (split functions) dual gpu machine flux clip etc.docx
   └─ GPU splitting exploration doc
```

### ARCHIVE-Screenshots (10 files)
**Why:** Standalone screenshots, low searchability, low actionable value

```
5. aichat not working.png
   └─ Screenshot annotation/debug image

6. Day of rtx3040 models.png
   └─ Historical model snapshot

7. Fix File upload OpenWebUI.png
   └─ Screenshot/reference image

8. Models - fast autocomplete.jpeg
   └─ Screenshot comparison

9. Models - inline coding.jpeg
   └─ Screenshot comparison

10. Models - local vs cloud.jpeg
    └─ Screenshot comparison

11. Models - recommendation for programming.png
    └─ Screenshot comparison

12. Need more info on Tool Use.png
    └─ Screenshot annotation

13. what does local api server mean.png
    └─ Screenshot annotation

14. what is a tool enabled prompt.png
    └─ Screenshot annotation
```

### ARCHIVE-OneTime (2 files)
**Why:** One-time tasks (completed or low-priority)

```
15. Missing Files - Download These Now.pdf
    └─ One-time download task (5d old)

16. NVMe 2230 Acer - Macrium Reflect.docx
    └─ One-time disk imaging task
```

### ARCHIVE-Utilities (5 files)
**Why:** System artifacts, outdated plans, unclear purpose

```
17. CLEANUP_PLAN.md
    └─ Superseded by newer plans

18. DMS System - sample_run.txt
    └─ System sample/debug file

19. image descriptions.txt
    └─ Unclear purpose

20. LLM Infrastructure Cheat Sheet_old.pdf
    └─ Marked "old" (superseded by Updated version)

21. What to Try Next.txt
    └─ Old experiments (20d)
```

### ARCHIVE-Guides (2 files)
**Why:** Setup preparation & supplemental docs (complete/integrated)

```
22. Prep for 3060 - in the mean time as well.docx
    └─ Pre-3060 preparation (you have 3060, phase complete)

23. Rtx3060 Supplemental Improvements.pdf
    └─ Supplemental notes (improvements integrated into main guides)
```

### ARCHIVE-References (1 file)
**Why:** Static reference lists that become outdated

```
24. Ollama Download Commands for Recommended LLMs.pdf
    └─ Static download list (21d old, models/commands evolve)
```

---

## ✅ KEEP (32 files)

### Setup Guides & Critical References (kept for ongoing use):
```
✓ GROK.Ollama.on.Win11.Ultimate.Perf.Guide.md
✓ RTX 3060 Setup Guide - Complete AI Coding Workflow.pdf
✓ RTX 3060 Image Manipulation Setup Guide (Win11 - 2025).pdf
✓ RTX 3060 Image Manipulation Setup Guide - Troubleshooting Log & Lessons Learned - Complete Log (all versions)
✓ Setting Up Real Image Manipulation on Your Local Server.pdf
✓ Open WebUI Installation Guide for Windows 11.pdf
✓ Open WebUI Management Guide.pdf
✓ Managing Ollama Environment Variables in NSSM.pdf
```

### Model Inventory & Recommendations (CRITICAL):
```
✓ Ollama Models as of 2025 11 18.txt (CRITICAL - current model inventory)
✓ GROK.recommended.llms.w.RTX.3060.txt (current pulls)
✓ GROK.recommended.nano.banana.replacement.txt (image model recommendations)
✓ Ollama Model Cheat Sheet (Local LLMs) pdf version.pdf
✓ Models Ollama ComfyUI Config Photorealistic Removal Restoration Mesh Objects.pdf
✓ MODELS_recommendations_by_claude.md
✓ MODELS_recommendations_by_claude_summary.txt
✓ Models for Python coding.docx
✓ Models.txt
✓ LLM Recommendations for Programming and Development.pdf
✓ ollama website list - LLM.txt
```

### Quick References & Config:
```
✓ Doc_INDEX_Version6.md (master index)
✓ OpenWebUI — Task Scheduler CLI Reference.txt
✓ Using 1040 until 3060 Gets Here.txt
✓ Image Generation Options for Open WebUI.pdf
✓ OLLAMA_GUIDE.md
```

### Command References & Logs:
```
✓ ollama-ls.txt
✓ ollama-show-out.txt
✓ ollama-show.bat
✓ Ollama CLI Help.txt
```

### Context & Active Discussions:
```
✓ Claude session - started the whole rabbit trail of hosting my own LLM.md (context/history)
✓ Conversation with Gemini - ComfyUI Models.docx (active project discussion)
✓ Conversation with Gemini - Sequence of memory events during ComfyUI run.docx (active project discussion)
```

### Active Optimizations:
```
✓ FLUX Optimazation.docx (current image gen optimization)
```

---

## Summary Table

| Archive Category | Count | Type |
|---|---|---|
| ARCHIVE-Hardware | 4 | Old GPU configs |
| ARCHIVE-Screenshots | 10 | Standalone images |
| ARCHIVE-OneTime | 2 | One-time tasks |
| ARCHIVE-Utilities | 5 | Artifacts/unclear |
| ARCHIVE-Guides | 2 | Completed setup prep |
| ARCHIVE-References | 1 | Static reference list |
| **TOTAL ARCHIVE** | **24** | |
| **KEEP** | **32** | Active/critical refs |

---

## DMS Implementation

### Add these new categories to `.dms_state.json`:
```json
"categories": [
  "Guides",
  "QuickRefs",
  "Models",
  "Workflows",
  "Scripts",
  "Junk",
  "Troubleshooting",
  "ARCHIVE-Guides",
  "ARCHIVE-Hardware",
  "ARCHIVE-Screenshots",
  "ARCHIVE-OneTime",
  "ARCHIVE-References",
  "ARCHIVE-Utilities"
]
```

### Recategorize 24 files in `"documents"` section:
(All files shown in the 🗑️ section above, change their `"category"` field to appropriate ARCHIVE-*)

---

## Result

✅ **24 files tagged as archived** (still in place, just categorized)
✅ **32 files kept current** (active work, critical references, model inventory)
✅ **No deletions, no moves** - only DMS metadata changes
✅ **Clean separation** - old work stays findable but flagged as archive

Your Doc/ folder is now **meaningfully organized** by activity & obsolescence!

