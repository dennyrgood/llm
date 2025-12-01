# DMS Recategorization Plan - FINAL (Balanced)

**Created:** 2025-12-01  
**Approach:** Archive files >14 days old that are clearly outdated or low-value  
**Keep:** Everything ≤14 days old PLUS critical reference materials

---

## The Balanced Approach

**Threshold: >14 days old (before Nov 17)**

This captures:
- Stuff you haven't touched in 2+ weeks 
- But keeps active setup guides & critical references
- Uses DMS category rename: `ARCHIVE-*` (no deletes, no file moves)

---

## Files to Recategorize → `ARCHIVE-*`

### ARCHIVE-QuickRefs (3 files)

**Move these:**
```
1. Ollama Download Commands for Recommended LLMs.pdf (21d)
   └─ Category: QuickRefs → ARCHIVE-QuickRefs
   └─ Reason: Static download list (models change, commands outdated)

2. LLM Infrastructure Cheat Sheet_old.pdf (20d)
   └─ Category: QuickRefs → ARCHIVE-QuickRefs
   └─ Reason: File name says "old" - superseded by Updated version
```

### ARCHIVE-Scripts (1 file)

**Move this:**
```
3. What to Try Next.txt (20d)
   └─ Category: Scripts → ARCHIVE-Scripts
   └─ Reason: Experimental notes from 3 weeks ago (likely tried/superseded)
```

### ARCHIVE-Guides (2 files)

**Move these:**
```
4. Prep for 3060 - in the mean time as well.docx (12d)
   └─ Category: Guides → ARCHIVE-Guides
   └─ Reason: Pre-3060 prep (you have 3060 now, this is done)

5. Rtx3060 Supplemental Improvements.pdf (13d)
   └─ Category: Guides → ARCHIVE-Guides
   └─ Reason: Supplemental notes (improvements integrated into main guides)
```

---

## Files to KEEP (No Change)

### ✅ Critical References (Keep even if >14d old):

```
✅ Guides (Keep - active setup):
  • GROK.Ollama.on.Win11.Ultimate.Perf.Guide.md (13d)
    └─ Your main Ollama tuning guide - actively used
  
  • New RTX 3060 Setup - SETTING_UP_REAL_IMAGE_MANIPULATION_LOCAL_SERVER.md (14d)
    └─ Current setup in progress
  
  • RTX 3060 Setup Guide - Complete AI Coding Workflow.pdf (13d)
    └─ Current coding integration
  
  • Setting Up Real Image Manipulation on Your Local Server.pdf (14d)
    └─ Active image gen setup
  
  • Open WebUI Management Guide.pdf (14d)
  • Open WebUI Installation Guide for Windows 11.pdf (14d)
    └─ Current service management
  
  • Claude session - started the whole rabbit trail... (13d)
    └─ Context for your LLM journey
  
  • Image Generation Options for Open WebUI.pdf (14d)
    └─ Active workflow reference

✅ Models (Keep - current inventory):
  • Ollama Models as of 2025 11 18.txt (12d) ← **CRITICAL**
  • GROK.recommended.llms.w.RTX.3060.txt (14d)
  • GROK.recommended.nano.banana.replacement.txt (14d)
  • Models for Python coding.docx (9d)
  • MODELS_recommendations_by_claude.md (8d)
  • Models.txt (11d)

✅ QuickRefs (Keep - still current):
  • Quantization & Context Tokens — A One‑Page Practical Guide.md (12d)
  • LLM QUICK SELECTION GUIDE.txt (13d)
  • Doc_INDEX_Version6.md (12d)
  • LLM Infrastructure Cheat Sheet (Updated).pdf (19d) ← Keep (not "old")
  • Ollama Model Cheat Sheet.pdf (10d)
  • Ollama CLI Help.txt (12d)

✅ References (Keep - useful):
  • LLM Recommendations for Programming and Development.pdf (21d)
    └─ Still valid programming guidance
  
  • AIChat CLI guide (21d)
    └─ Tool reference - still relevant

✅ Operational (Keep - still active):
  • Using 1040 until 3060 Gets Here.txt (12d)
  • OpenWebUI — Task Scheduler CLI Reference.txt (13d)
  • Managing Ollama Environment Variables in NSSM.pdf (8d)

✅ All files ≤14 days old (Keep - actively being worked on):
  • Dual RTX 3060 + GTX 1080 Ti config (0d)
  • GPU splitting guides (0d)
  • ComfyUI setup guides (4-5d)
  • Troubleshooting logs (4d)
  • Gemini chat conversations (4d)
  • [29 files edited in last 2 weeks]
```

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
  "ARCHIVE-Guides",
  "ARCHIVE-QuickRefs",
  "ARCHIVE-Scripts"
]
```

---

## Implementation

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
  "ARCHIVE-QuickRefs",
  "ARCHIVE-Scripts"
]
```

### Step 2: Recategorize 6 files

In the `"documents"` section, change `"category"` for:

```
1. "./Prep for 3060 - in the mean time as well.docx"
   Change: "Guides" → "ARCHIVE-Guides"

2. "./Rtx3060 Supplemental Improvements.pdf"
   Change: "Guides" → "ARCHIVE-Guides"

3. "./What to Try Next.txt"
   Change: "Scripts" → "ARCHIVE-Scripts"

4. "./Ollama Download Commands for Recommended LLMs.pdf"
   Change: "QuickRefs" → "ARCHIVE-QuickRefs"

5. "./LLM Infrastructure Cheat Sheet_old.pdf"
   Change: "QuickRefs" → "ARCHIVE-QuickRefs"
```

(And do the same for any `.md` or PDF conversions of these files in `md_outputs/`)

### Step 3: Done

Files stay in place, just tagged as archived in DMS.

---

## Summary

| Action | Count | Details |
|--------|-------|---------|
| Recategorize → ARCHIVE | 6 files | Outdated prep, supplements, experiments, old versions |
| Keep (no change) | 73 files | Active setup, critical references, current inventory |

---

## Why This Set?

- **Prep for 3060** - You HAVE the 3060 now, this prep is done
- **Supplemental Improvements** - Improvements got integrated into main guides
- **What to Try Next** - Experimental notes from 3 weeks ago (likely acted on)
- **Ollama Download Commands** - Static list (models/commands evolve)
- **Cheat Sheet_old** - File literally says "old", superseded by "Updated" version

Everything else is either:
- Recently touched (≤14 days = actively working)
- Critical reference (models, setup guides, quick refs)
- Still useful (programming guidance, CLI help)

---

**Ready to execute? Or want to adjust the threshold?**
