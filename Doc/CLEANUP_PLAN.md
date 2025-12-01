# Simple Cleanup Plan - Doc Folder

**Goal:** Remove junk, keep good stuff. Move deprecated docs to `Doc-old/`. No restructuring.

---

## What Gets DELETED (temporary/lock files - no need to keep)

```
~$e both gpus (split functions) dual gpu machine flux clip etc.docx
~$Me 2230 Acer - Macrium Reflect.docx
~$st GPUs Next Level - 3090 - 25gig.docx
.dms_missing_for_deletion.json
.dms_scan.json
.dms_state.json
.DS_Store
```

**Reason:** Lock files, temp DMS files. Not needed.

---

## What Gets MOVED to `Doc-old/` (Deprecated/Legacy)

### Hardware Exploration (obsolete - you have RTX 3060)
```
Best GPUs Next Level - 3090 - 25gig (PDF).pdf
Best GPUs Next Level - 3090 - 25gig.docx
md_outputs/Best GPUs Next Level - 3090 - 25gig (PDF).md
md_outputs/Best GPUs Next Level - 3090 - 25gig.md

One pc rtx3080 other 2x1080ti 11g - best split of ollama and comfyUI (PDF).pdf
One pc rtx3080 other 2x1080ti 11g - best split of ollama and comfyUI.docx
md_outputs/One pc rtx3080 other 2x1080ti 11g - best split of ollama and comfyUI (PDF).md
md_outputs/One pc rtx3080 other 2x1080ti 11g - best split of ollama and comfyUI.md

Adding Second PC and FLUX on Dual GPUs (PDF).pdf
Adding Second PC and FLUX on Dual GPUs.docx
md_outputs/Adding Second PC and FLUX on Dual GPUs (PDF).md
md_outputs/Adding Second PC and FLUX on Dual GPUs.md
```

### Pre-3060 Setup Planning (now obsolete)
```
Prep for 3060 - in the mean time as well.docx
md_outputs/Prep for 3060 - in the mean time as well.md
md_outputs/Prep for 3060 - in the mean time as well.docx.txt

RTX 3060 Image Manipulation - Implementation Plan.pdf
md_outputs/RTX 3060 Image Manipulation - Implementation Plan.md

Rtx3060 Supplemental Improvements.pdf
md_outputs/Rtx3060 Supplemental Improvements.md
```

### One-Time Tasks (completed)
```
NVMe 2230 Acer - Macrium Reflect (pdf).pdf
NVMe 2230 Acer - Macrium Reflect.docx
md_outputs/NVMe 2230 Acer - Macrium Reflect (pdf).md
md_outputs/NVMe 2230 Acer - Macrium Reflect.md

Missing Files - Download These Now.pdf
md_outputs/Missing Files - Download These Now.md
```

### Chat Logs (supplemental reference only)
```
Conversation with Gemini - ComfyUI Models (PDF).pdf
Conversation with Gemini - ComfyUI Models.docx
md_outputs/Conversation with Gemini - ComfyUI Models (PDF).md
md_outputs/Conversation with Gemini - ComfyUI Models.md

Conversation with Gemini - Sequence of memory events during ComfyUI run (PDF).pdf
Conversation with Gemini - Sequence of memory events during ComfyUI run.docx
md_outputs/Conversation with Gemini - Sequence of memory events during ComfyUI run (PDF).md
md_outputs/Conversation with Gemini - Sequence of memory events during ComfyUI run.md
```

### Low-Value Screenshots (can't search easily)
```
Models - fast autocomplete.jpeg
md_outputs/Models - fast autocomplete.txt

Models - inline coding.jpeg
md_outputs/Models - inline coding.txt

Models - local vs cloud.jpeg
md_outputs/Models - local vs cloud.txt

Models - recommendation for programming.png
md_outputs/Models - recommendation for programming.txt

aichat not working.png
md_outputs/aichat not working.txt
md_outputs/aichat not working copy.txt
md_outputs/aichat not working.png.txt

Need more info on Tool Use.png
md_outputs/Need more info on Tool Use.txt
md_outputs/Need more info on Tool Use.png.txt

Fix File upload OpenWebUI.png
md_outputs/Fix File upload OpenWebUI.txt

Day of rtx3040 models.png
md_outputs/Day of rtx3040 models.txt
md_outputs/Day of rtx3040 models.png.txt

what does local api server mean.png
md_outputs/what does local api server mean.txt
md_outputs/what does local api server mean.png.txt

what is a tool enabled prompt.png
md_outputs/what is a tool enabled prompt.txt
md_outputs/what is a tool enabled prompt.png.txt

IMG_4664.jpeg
IMG_4664.jpeg.txt
IMG_4664.txt
IMG_4664 blah.txt
IMG_4665.jpeg
IMG_4665.jpeg.txt
IMG_4665.txt
IMG_4666.jpeg
IMG_4666.jpeg.txt
IMG_4666.txt
IMG_4666 copy.txt
```

### Unclear/Unknown Purpose
```
Acer Specs.txt

DMS System - sample_run.txt

image descriptions.txt

index.html

Quantization and Context Tokens — One‑Page Guide.html

md_outputs/DMS Summarization Pipeline Debug Report - Gemini fixing Claude Code.md
md_outputs/AIChat.md
md_outputs/AIChat2.md
md_outputs/AIChat3.md
```

---

## What Stays in Doc/ (KEEP - High Value Current Docs)

### Core Setup Guides (Active, Current)
```
GROK.Ollama.on.Win11.Ultimate.Perf.Guide.md
New RTX 3060 Setup - SETTING_UP_REAL_IMAGE_MANIPULATION_LOCAL_SERVER.md
Claude session - started the whole rabbit trail of hosting my own LLM.md
Dual RTX 3060 and GTX 1080 Ti Ollama ComfyUI.md
OLLAMA_GUIDE.md
```

### Current Model Inventory & Recommendations (📌 CRITICAL)
```
Ollama Models as of 2025 11 18.txt
GROK.recommended.llms.w.RTX.3060.txt
GROK.recommended.nano.banana.replacement.txt
Models.txt
MODELS_recommendations_by_claude.md
MODELS_recommendations_by_claude_summary.txt
```

### Quick References / Cheat Sheets
```
Doc_INDEX_Version6.md
LLM QUICK SELECTION GUIDE.txt
Quantization & Context Tokens — A One‑Page Practical Guide.md
```

### Operational / Config
```
OpenWebUI — Task Scheduler CLI Reference.txt
Using 1040 until 3060 Gets Here.txt
What to Try Next.txt
```

### Command References / Snapshots
```
Ollama CLI Help.txt
ollama-show.bat
ollama-ls.txt
ollama-show-out.txt
ollama website list - LLM.txt
```

### Supporting PDFs & Conversions (in Doc/ + md_outputs/)
```
AIChat CLI_ Capabilities and User Guide Summary.pdf
md_outputs/AIChat CLI_ Capabilities and User Guide Summary.md

RTX 3060 Setup Guide - Complete AI Coding Workflow.pdf
md_outputs/RTX 3060 Setup Guide - Complete AI Coding Workflow.md

Setting Up Real Image Manipulation on Your Local Server.pdf
md_outputs/Setting Up Real Image Manipulation on Your Local Server.md

Open WebUI Installation Guide for Windows 11.pdf
md_outputs/Open WebUI Installation Guide for Windows 11.md

Open WebUI Management Guide.pdf
md_outputs/Open WebUI Management Guide.md

ComfyUI Explained - Understanding the Basics.pdf
md_outputs/ComfyUI Explained - Understanding the Basics.md

ComfyUI RTX 3060 Setup.pdf
md_outputs/ComfyUI RTX 3060 Setup.md

ComfyUI Image Comparer Node.pdf
md_outputs/ComfyUI Image Comparer Node.md

Image Generation Options for Open WebUI.pdf
md_outputs/Image Generation Options for Open WebUI.md

FLUX Optimazation.docx
md_outputs/FLUX Optimazation.md

Models Ollama ComfyUI Config Photorealistic Removal Restoration Mesh Objects (md).md
Models Ollama ComfyUI Config Photorealistic Removal Restoration Mesh Objects.pdf

LLM Infrastructure Cheat Sheet (Updated).pdf
md_outputs/LLM Infrastructure Cheat Sheet (Updated).md

LLM Infrastructure Cheat Sheet_old.pdf
md_outputs/LLM Infrastructure Cheat Sheet_old.md

LLM Recommendations for Programming and Development.pdf
md_outputs/LLM Recommendations for Programming and Development.md

Managing Ollama Environment Variables in NSSM.pdf
md_outputs/Managing Ollama Environment Variables in NSSM.md

Ollama Download Commands for Recommended LLMs.pdf
md_outputs/Ollama Download Commands for Recommended LLMs.md

Ollama Model Cheat Sheet (Local LLMs) pdf version.pdf
md_outputs/Ollama Model Cheat Sheet (Local LLMs) pdf version.md

RTX 3060 Image Manipulation Setup Guide (Win11 - 2025).pdf
md_outputs/RTX 3060 Image Manipulation Setup Guide (Win11 - 2025).md

RTX 3060 Image Manipulation Setup Guide - Troubleshooting Log & Lessons Learned - (Win11 - 2025) – Complete Log.docx
RTX 3060 Image Manipulation Setup Guide - Troubleshooting Log & Lessons Learned - (Win11 - 2025) – Complete Log - (PDF).pdf
RTX 3060 Image Manipulation Setup Guide - Troubleshooting Log & Lessons Learned - (Win11 - 2025) – Complete Log - Last Run.txt
md_outputs/RTX 3060 Image Manipulation Setup Guide - Troubleshooting Log & Lessons Learned - (Win11 - 2025) – Complete Log.md
md_outputs/RTX 3060 Image Manipulation Setup Guide - Troubleshooting Log & Lessons Learned - (Win11 - 2025) – Complete Log - (PDF).md
md_outputs/RTX 3060 Image Manipulation Setup Guide - (Win11 - 2025) – Complete Log - (PDF).md

Models for Python coding.docx
md_outputs/Models for Python coding.md
```

### Directory
```
md_outputs/
```

---

## Summary

**DELETE (3 files):**
- 3 Word lock files (`~$*`)
- 3 DMS system files (`.dms_*`)
- 1 system file (`.DS_Store`)

**MOVE to Doc-old/ (~90 files):**
- 12 files: Hardware exploration docs (3090, dual-GPU configs)
- 14 files: Pre-3060 setup planning
- 8 files: One-time tasks
- 16 files: Chat logs
- 30+ files: Low-value screenshots + conversions
- 10+ files: Unclear/orphaned/unknown

**KEEP in Doc/ (~55 files):**
- 5 core setup guides
- 6 model inventory & recommendations
- 8 quick references & cheat sheets
- 6 operational/config references
- 5 command references
- 25+ supporting PDFs & MD conversions
- md_outputs/ directory

---

## Execution

```bash
# 1. Create archive directory
mkdir -p /Users/dennishmathes/repos/llm/Doc-old

# 2. Move deprecated files (add as batch commands)
# 3. Delete temp files (safe - can undo)
# 4. Verify Doc/ has ~55 good files
```

