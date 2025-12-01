# DMS Recategorization Plan - Date-Based Smart Archival

**Created:** 2025-12-01  
**Approach:** Analyze file modification dates → Recategorize old files to `ARCHIVE-*` categories via DMS  
**No deletions, no directory moves** → Only DMS category changes in `.dms_state.json`

---

## Current DMS Setup

**Existing Categories:**
- `Guides` (42 files)
- `Models` (17 files)
- `Workflows` (5 files)
- `QuickRefs` (11 files)
- `Troubleshooting` (2 files)
- `Scripts` (2 files)
- `Junk` (placeholder, 0 files)

**Total tracked: 79 files**

---

## Analysis: File Age Distribution

Based on **actual filesystem modification dates**:

### Very Recent (Updated This Week: Nov 25 - Dec 1)
```
Dec 1   (0d)   Models Ollama ComfyUI Config... (MD & PDF pair)
Dec 1   (0d)   Best GPUs Next Level - 3090...  (old GPU comparison, recently edited)
Dec 1   (0d)   NVMe 2230 Acer - Macrium...      (one-time task, recently edited)
Dec 1   (0d)   One pc rtx3080...                (dual-GPU config, recently edited)
Dec 1   (0d)   Use both gpus...                 (GPU splitting, recently edited)
Dec 1   (0d)   Adding Second PC...              (dual-GPU exploration, recently edited)
Nov 27  (4d)   RTX 3060 Image Manipulation - Implementation Plan
Nov 26  (5d)   Conversation with Gemini - ComfyUI Models (chat log)
Nov 26  (5d)   Conversation with Gemini - Sequence of memory events (chat log)
Nov 25  (6d)   FLUX Optimization
Nov 25  (6d)   Missing Files - Download These Now
Nov 25  (6d)   ComfyUI RTX 3060 Setup
```

### Moderately Old (1-2 weeks: Nov 18-24)
```
Nov 22  (9d)   MODELS_recommendations_by_claude
Nov 22  (9d)   Managing Ollama Environment Variables in NSSM
Nov 22  (9d)   Image Generation Options for Open WebUI
Nov 21  (10d)  Ollama Model Cheat Sheet
Nov 21  (10d)  Models for Python coding
Nov 20  (11d)  DMS System - sample_run
Nov 19  (12d)  Doc_INDEX_Version6
Nov 19  (12d)  Ollama CLI Help
Nov 18  (13d)  GROK.Ollama.on.Win11 guide
Nov 18  (13d)  Quantization & Context Tokens guide
Nov 18  (13d)  Claude session - rabbit trail
Nov 18  (13d)  ollama-show-out
Nov 18  (13d)  ollama-ls
```

### Older (2-3 weeks: Nov 10-17)
```
Nov 17  (14d)  New RTX 3060 Setup - REAL_IMAGE_MANIPULATION
Nov 16  (15d)  Setting Up Real Image Manipulation on Your Local Server
Nov 16  (15d)  RTX 3060 Setup Guide - Complete AI Coding Workflow
Nov 16  (15d)  Open WebUI Management & Installation Guides
Nov 12  (19d)  LLM Infrastructure Cheat Sheet (Updated)
Nov 11  (20d)  LLM Infrastructure Cheat Sheet_old
Nov 10  (21d)  Ollama Download Commands & LLM Recommendations
Nov 10  (21d)  AIChat CLI guide
```

---

## Recategorization Strategy

### **Strategy: Age-Based with Category Semantics**

Since most files are still relatively recent (all ≤30 days old), we'll use a **hybrid approach**:

1. **Keep current categories for active/recent content** (< 2 weeks)
2. **Create ARCHIVE-* variants** for:
   - Deprecated hardware explorations (old GPU configs)
   - Completed/obsolete planning docs
   - Chat logs (supplemental reference)
   - Low-signal content

3. **Files recently touched but semantically OLD** → Mark for archival despite recent dates

---

## Files to Recategorize → `ARCHIVE-*`

### GROUP 1: **Obsolete Hardware** (Different setups - not yours)
**Current:** Mostly in `Guides` | **Recategorize to:** `ARCHIVE-Guides`

```
• Best GPUs Next Level - 3090 - 25gig (PDF & DOCX)
  └─ Reason: GPU comparison (you have RTX 3060 now)
  
• One pc rtx3080 other 2x1080ti...  (PDF & DOCX)
  └─ Reason: Different hardware config (not your setup)
  
• Adding Second PC and FLUX on Dual GPUs (PDF & DOCX)
  └─ Reason: Dual-GPU exploration (likely not implemented)
  
• Use both gpus (split functions)... (PDF & DOCX)
  └─ Reason: GPU splitting exploration
```

### GROUP 2: **Obsolete Setup/Planning** (Planning docs - completed or obsolete)
**Current:** Mix of `Guides` & `Workflows` | **Recategorize to:** `ARCHIVE-Workflows`

```
• Prep for 3060 - in the mean time as well (DOCX & MD versions)
  └─ Reason: Pre-3060 preparation (likely done by now)
  
• RTX 3060 Image Manipulation - Implementation Plan (PDF & MD)
  └─ Reason: Planning doc (implementation complete)
  
• Rtx3060 Supplemental Improvements (PDF & MD)
  └─ Reason: Supplemental notes (integrated into main guides)
```

### GROUP 3: **One-Time Tasks** (Completed, historical)
**Current:** `Guides` | **Recategorize to:** `ARCHIVE-Guides`

```
• NVMe 2230 Acer - Macrium Reflect (PDF & DOCX)
  └─ Reason: One-time disk imaging task (completed)
  
• Missing Files - Download These Now (PDF & MD)
  └─ Reason: One-time download list (likely completed)
```

### GROUP 4: **Chat Transcripts** (Supplemental reference, not actionable)
**Current:** `Guides` | **Recategorize to:** `ARCHIVE-Reference`

```
• Conversation with Gemini - ComfyUI Models (PDF & DOCX)
  └─ Reason: Chat transcript (archived chat log)
  
• Conversation with Gemini - Sequence of memory events (PDF & DOCX)
  └─ Reason: Technical deep-dive chat (archived discussion)
```

### GROUP 5: **Low-Signal / Unclear** (md_outputs orphans, unknown purpose)
**Current:** Various | **Recategorize to:** `ARCHIVE-Junk`

```
• In md_outputs/:
  - AIChat.md, AIChat2.md, AIChat3.md (orphaned variants)
  - DMS Summarization Pipeline Debug Report (orphaned)
  - aichat not working.txt variants (screenshot conversions)
  - IMG_*.txt (photo conversions)
  - Models - *.txt (screenshot conversions)
  - Other .png.txt files
```

---

## Files to Keep (No Recategorization)

### ✅ **CRITICAL - Current & Used (< 2 weeks old)**

```
✅ Guides:
  • GROK.Ollama.on.Win11.Ultimate.Perf.Guide.md (13d old - main reference)
  • New RTX 3060 Setup - SETTING_UP_REAL_IMAGE_MANIPULATION_LOCAL_SERVER.md (14d - active)
  • RTX 3060 Setup Guide - Complete AI Coding Workflow.md (15d - current)
  • Claude session - started the whole rabbit trail... (13d - context)
  • Dual RTX 3060 and GTX 1080 Ti Ollama ComfyUI.md (0d - EDITED TODAY, need clarification)
  • ComfyUI RTX 3060 Setup (5d - current)
  • OLLAMA_GUIDE.md

  ⚠️ **NOTE:** `Dual RTX 3060 and GTX 1080 Ti...` - File modified TODAY (Dec 1 11:20) but contains old GPU chat. Is this YOUR current dual-GPU setup you're implementing, or just reference material?

✅ Models:
  • Ollama Models as of 2025 11 18.txt (13d - CRITICAL INVENTORY)
  • GROK.recommended.llms.w.RTX.3060.txt (15d - current)
  • GROK.recommended.nano.banana.replacement.txt (15d - current)
  • Models.txt (11d)
  • MODELS_recommendations_by_claude.md (9d)
  • MODELS_recommendations_by_claude_summary.txt
  • Models for Python coding (21d - slightly old but useful)

✅ QuickRefs:
  • Doc_INDEX_Version6.md (12d - master index)
  • LLM QUICK SELECTION GUIDE.txt
  • Quantization & Context Tokens — A One‑Page Practical Guide.md (13d)
  • LLM Infrastructure Cheat Sheet (Updated).pdf (19d - still current)
  • LLM Infrastructure Cheat Sheet_old.pdf (20d)
  • Ollama Model Cheat Sheet.pdf (10d)
  • LLM Recommendations for Programming and Development.pdf (21d)
  • Ollama Download Commands.pdf (21d)

✅ Workflows:
  • Conversation with Gemini - Sequence of memory events (chat log, but useful technical)
  • Open WebUI Installation & Management Guides (15d - current)
  • AIChat CLI guide (11d - reference)
  • ComfyUI Explained - Understanding the Basics (12d)
  • Setting Up Real Image Manipulation on Your Local Server (15d - current)
  • Image Generation Options for Open WebUI (9d)
  • FLUX Optimization (5d - current)

✅ Operational/Config:
  • OpenWebUI — Task Scheduler CLI Reference.txt
  • Using 1040 until 3060 Gets Here.txt (12d - current hardware)
  • What to Try Next.txt (11d)
  • ollama-show.bat, ollama-ls.txt, ollama-show-out.txt (command refs)
  • Managing Ollama Environment Variables (10d)

✅ Supporting PDFs & Conversions:
  • [All md_outputs/ conversions of active guides]
```

---

## New DMS Categories to Add

```
Categories to add to .dms_state.json:
  • ARCHIVE-Guides
  • ARCHIVE-Workflows
  • ARCHIVE-Reference
  • ARCHIVE-Junk
  (optional: ARCHIVE-Models if entire Models category ages out)
```

---

## Implementation Plan

**No manual moves, no deletions:**

### Step 1: Add new archive categories to `.dms_state.json`
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
  "ARCHIVE-Workflows",
  "ARCHIVE-Reference",
  "ARCHIVE-Junk"
]
```

### Step 2: Recategorize documents in DMS
For each file group above, change the `"category"` field:

```
"Best GPUs Next Level - 3090 - 25gig (PDF).pdf": {
  ...
  "category": "ARCHIVE-Guides",  ← Changed from "Guides"
  ...
}
```

### Step 3: Verify in DMS system
```bash
# (Your dms_util commands to review/render)
cd /Users/dennishmathes/repos/Scripts/dms_util
# Check the recategorized files show up correctly
```

---

## Summary

| Action | Count | Target Category |
|--------|-------|-----------------|
| Recategorize (Obsolete Hardware) | 4 file groups (8 files) | ARCHIVE-Guides |
| Recategorize (Obsolete Planning) | 3 file groups (6 files) | ARCHIVE-Workflows |
| Recategorize (One-Time Tasks) | 2 file groups (4 files) | ARCHIVE-Guides |
| Recategorize (Chat Logs) | 2 file groups (4 files) | ARCHIVE-Reference |
| Recategorize (Low-Signal/Orphans) | ~10 files in md_outputs/ | ARCHIVE-Junk |
| **Keep** (No change) | ~42-50 active files | Existing categories |

**Result:** Active doc folder stays clean; old stuff tagged for easy filtering/exclusion in future searches or renders.

---

## Decision Points for You

1. **Should `LLM Infrastructure Cheat Sheet_old.pdf` be archived?** (19 days old, marked "old")
2. **Chat logs: archive all of them, or keep one as reference?**
3. **Screenshot conversions (.png.txt files): keep any of them?**
4. **New archive category names:** Use `ARCHIVE-*` or prefer `LEGACY-*` or something else?

---

**Next Step:** Approve this plan, and I'll generate the DMS update commands to recategorize files.
