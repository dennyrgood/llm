# DMS Recategorization Plan - Content-Driven Smart Selection

**Created:** 2025-12-01  
**Method:** Age (>10-21d) + Content Type + Summary Analysis  
**Result:** 6 files identified for archival based on semantic obsolescence, not just age

---

## Files Selected for Archive

### Group 1: ARCHIVE-Guides (3 files)
**Reason:** Setup preparation, planning, and supplemental docs that are complete/integrated

```
1. Prep for 3060 - in the mean time as well.docx (12d old)
   └─ Category: Guides → ARCHIVE-Guides
   └─ Why: Pre-3060 preparation doc (you have 3060, this phase is done)
   └─ Content signal: "Prep" keyword + >10 days

2. Rtx3060 Supplemental Improvements.pdf (13d old)
   └─ Category: Guides → ARCHIVE-Guides
   └─ Why: Supplemental notes (improvements integrated into main guides)
   └─ Content signal: "Supplemental" + >10 days

3. AIChat CLI_ Capabilities and User Guide Summary.pdf (21d old)
   └─ Category: Guides → ARCHIVE-References (could also be ARCHIVE-Guides)
   └─ Why: Generic chat transcript (reference only, not actionable)
   └─ Content signal: CLI guide, >21 days, not actively used
   └─ Note: Different from active "Conversation with Gemini" chats which have project context
```

### Group 2: ARCHIVE-References (1 file)
**Reason:** Reference lists/chats that are outdated or low-priority

```
4. Ollama Download Commands for Recommended LLMs.pdf (21d old)
   └─ Category: QuickRefs → ARCHIVE-References
   └─ Why: Static download list (models/commands evolve, outdated)
   └─ Content signal: "Download Commands" + >18 days = loses value quickly
```

### Group 3: ARCHIVE-Utilities (2 files)
**Reason:** Experimental notes and marked-old reference materials

```
5. What to Try Next.txt (20d old)
   └─ Category: Scripts → ARCHIVE-Utilities
   └─ Why: Experimental notes from 3 weeks ago (likely tried/acted on)
   └─ Content signal: "Try Next" + experimental nature + >15 days

6. LLM Infrastructure Cheat Sheet_old.pdf (20d old)
   └─ Category: QuickRefs → ARCHIVE-Utilities
   └─ Why: File explicitly marked "_old" (superseded by "Updated" version)
   └─ Content signal: "_old" suffix + newer "Updated" version exists
```

---

## Why These 6?

### Age Threshold Used:
- **Planning docs:** >10 days (prep/planning typically has limited shelf life)
- **Supplemental/Experimental:** >13-15 days (integrated or superseded)
- **Static lists:** >18 days (download commands, models change)
- **Marked old:** Any age (explicit signal in filename)

### Content Signals Applied:
- ✅ Filename markers: `_old`, `prep`, `supplemental`, `planning`, `experiment`
- ✅ Summary keywords: "planning", "supplemental", "chat transcript", "download command"
- ✅ Semantic obsolescence: Task complete, improvement integrated, alternative exists
- ✅ Temporal decay: Static references lose value as models/tools evolve

### Why NOT Archived:
- ❌ Gemini conversation logs (4d old, **active project discussion** about ComfyUI/image gen)
- ❌ GPU config docs from today (0d, **your current dual-GPU implementation**)
- ❌ LLM Cheat Sheet Updated (kept, not the "old" version)
- ❌ Screenshots with context (model comparisons, inline coding examples)
- ❌ Critical setup guides (GROK, RTX 3060 setup - still referenced)

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
  "ARCHIVE-References",
  "ARCHIVE-Utilities"
]
```

---

## Implementation

### Step 1: Update `.dms_state.json` - Add Categories

Add to the `"categories"` array:
```json
"ARCHIVE-Guides",
"ARCHIVE-References",
"ARCHIVE-Utilities"
```

### Step 2: Recategorize 6 Files

Update the `"documents"` section:

```json
"./Prep for 3060 - in the mean time as well.docx": {
  "category": "ARCHIVE-Guides"  ← changed from "Guides"
},

"./Rtx3060 Supplemental Improvements.pdf": {
  "category": "ARCHIVE-Guides"  ← changed from "Guides"
},

"./AIChat CLI_ Capabilities and User Guide Summary.pdf": {
  "category": "ARCHIVE-References"  ← changed from "Guides"
},

"./Ollama Download Commands for Recommended LLMs.pdf": {
  "category": "ARCHIVE-References"  ← changed from "QuickRefs"
},

"./What to Try Next.txt": {
  "category": "ARCHIVE-Utilities"  ← changed from "Scripts"
},

"./LLM Infrastructure Cheat Sheet_old.pdf": {
  "category": "ARCHIVE-Utilities"  ← changed from "QuickRefs"
}
```

### Step 3: Check for .md versions in md_outputs/

If any of these files have `.md` conversions in `md_outputs/`, recategorize those too:
```
md_outputs/Prep for 3060 - in the mean time as well.md → ARCHIVE-Guides
md_outputs/Rtx3060 Supplemental Improvements.md → ARCHIVE-Guides
md_outputs/LLM Infrastructure Cheat Sheet_old.md → ARCHIVE-Utilities
```

### Step 4: Done

Files stay in place. Only metadata changed.

---

## Summary

| Action | Count | Details |
|--------|-------|---------|
| ARCHIVE-Guides | 2 files | Pre-3060 prep + supplemental improvements |
| ARCHIVE-References | 2 files | Outdated CLI transcript + static download list |
| ARCHIVE-Utilities | 2 files | Old cheat sheet marker + old experiments |
| **KEEP** | 73 files | Active projects, critical refs, current models |

---

## Key Principles Applied

1. **Age matters, but content matters more**
   - A 3-week-old planning doc > a 1-week-old active setup guide

2. **Context is critical**
   - Gemini chat logs about YOUR 3060 image gen = KEEP
   - AIChat general guide = ARCHIVE

3. **Temporal decay**
   - Static lists (downloads, commands) lose value as tools evolve
   - Setup guides stay relevant if they match your hardware

4. **Explicit signals**
   - Files with `_old` in name are clear candidates
   - Prep/supplemental docs have natural expiration dates

5. **Preserve activity**
   - Everything edited in last week stays current (you're actively using it)
   - 14+ day old files are only archived if semantically obsolete

---

## How This Differs from "Pure Age"

**Pure age-based approach:** Archive everything >14-21 days = would archive 50+ files (too aggressive)

**This content-driven approach:** Archive 6 files with clear obsolescence signals = clean, intentional, preserves working material

**Result:** Your DMS stays relevant, old/completed work is tagged, but active projects remain visible.

---

**Ready to execute these 6 recategorizations?**
