# ComfyUI Model Compatibility Chart
## Your Models → Required CLIP & VAE Reference

---

## 🔵 FLUX Models

### **flux1-dev-fp8.safetensors**
- **Location:** `checkpoints/FLUX/`
- **CLIP Required:** 
  - `clip_l.safetensors` (located in `text_encoders/FLUX_Fill/`)
- **Text Encoder Required:**
  - `t5xxl_fp16.safetensors` OR `t5xxl_fp8_e4m3fn.safetensors`
  - (located in `text_encoders/FLUX_Fill/` or `text_encoders/SD3/`)
- **VAE Required:**
  - `ae.safetensors` (located in `vae/FLUX_Fill/` or `vae/FLUX2/`)
- **Notes:** FLUX uses dual text encoders (CLIP-L + T5-XXL)

### **flux1-fill-dev-Q8_0.gguf**
- **Location:** `unet/`
- **CLIP Required:** 
  - `clip_l.safetensors` (located in `text_encoders/FLUX_Fill/`)
- **Text Encoder Required:**
  - `t5xxl_fp16.safetensors`
- **VAE Required:**
  - `ae.safetensors` (from `vae/FLUX_Fill/`)
- **Notes:** GGUF quantized format for lower VRAM usage

---

## 🟢 SD3 (Stable Diffusion 3) Models

### **sd3_medium.safetensors**
- **Location:** `checkpoints/SD3/`
- **CLIP Required (SEPARATE FILES NEEDED):**
  - `clip_l.safetensors` (located in `text_encoders/SD3/`)
  - `clip_g.safetensors` (located in `text_encoders/SD3/`)
- **Text Encoder Required:**
  - `t5xxl_fp16.safetensors` OR `t5xxl_fp8_e4m3fn.safetensors`
  - (located in `text_encoders/SD3/`)
- **VAE Required:**
  - Built-in OR use external VAE if desired
- **Notes:** Requires 3 separate text encoders (CLIP-L, CLIP-G, T5-XXL)

### **sd3_medium_incl_clips.safetensors**
- **Location:** `checkpoints/SD3/`
- **CLIP Required:** ✅ **BUILT-IN** (CLIP-L + CLIP-G included)
- **Text Encoder Required:**
  - `t5xxl_fp16.safetensors` OR `t5xxl_fp8_e4m3fn.safetensors`
- **VAE Required:**
  - Built-in
- **Notes:** Easier to use - only needs T5 encoder

### **sd3_medium_incl_clips_t5xxlfp16.safetensors**
- **Location:** `checkpoints/SD3/`
- **CLIP Required:** ✅ **BUILT-IN** (all text encoders included)
- **Text Encoder Required:** ✅ **BUILT-IN**
- **VAE Required:** Built-in
- **Notes:** All-in-one file - no external files needed

### **sd3_medium_incl_clips_t5xxlfp8.safetensors**
- **Location:** `checkpoints/SD3/`
- **CLIP Required:** ✅ **BUILT-IN** (all text encoders included)
- **Text Encoder Required:** ✅ **BUILT-IN** (FP8 quantized)
- **VAE Required:** Built-in
- **Notes:** All-in-one with FP8 T5 for lower VRAM

---

## 🟡 SDXL (Stable Diffusion XL) Models

### **albedobaseXL_v21.safetensors**
### **juggernautXL_ragnarokBy.safetensors**
### **Juggernaut_X_RunDiffusion.safetensors**
### **sd_xl_base_1.0.safetensors**
### **sd_xl_turbo_1.0.safetensors**

- **Location:** `checkpoints/SDXL/` or `checkpoints/SDXL_Turbo/`
- **CLIP Required:** ✅ **BUILT-IN** 
  - SDXL uses dual CLIPs (OpenCLIP-G + CLIP-L) - typically built into checkpoint
  - If needed separately: Use files from `text_encoders/SD3/`
- **VAE Required:**
  - Optional external VAE (recommended for better quality)
  - **You don't have a dedicated SDXL VAE** - consider downloading `sdxl_vae.safetensors`
- **Notes:** SDXL checkpoints usually include CLIPs. VAE is optional but recommended.

---

## 🔴 SD1.5 (Stable Diffusion 1.5) Models

### **dreamshaper_8.safetensors**
### **juggernaut_reborn.safetensors**
### **realisticVisionV51_v51VAE.safetensors**

- **Location:** `checkpoints/SD1.5/` or `checkpoints/`
- **CLIP Required:** ✅ **BUILT-IN**
  - SD1.5 uses single CLIP-L (built into checkpoint)
- **VAE Required:**
  - Most SD1.5 models have VAE built-in
  - `realisticVisionV51_v51VAE.safetensors` has VAE in filename (included)
  - Optional: Download `vae-ft-mse-840000-ema-pruned.safetensors` for external VAE
- **Notes:** SD1.5 is simplest - usually needs no external files

---

## 🟣 Qwen-Based Models (Multimodal/LLM-Diffusion Hybrids)

### **Qwen-Rapid-AIO-NSFW-v22.safetensors**
- **Location:** `checkpoints/`
- **CLIP Required:** ✅ **BUILT-IN** (AIO = All-In-One)
- **Text Encoder Required:** ✅ **BUILT-IN**
  - But can optionally use external Qwen encoders for specific features
  - Available: `qwen_2.5_vl_7b_fp8_scaled.safetensors` in `text_encoders/Qwen2509/`
- **VAE Required:** ✅ **BUILT-IN**
  - Optional: `qwen_image_vae.safetensors` in `vae/Qwen2509/`
- **Notes:** Qwen models are multimodal - can use vision + language

---

## 🟠 Z-Image Models

### **z-image-turbo-fp8-aio.safetensors**
### **z-image-turbo-fp16-aio.safetensors**
### **z-image-turbo-bf16-aio.safetensors**
### **qwen_image_edit_2511_fp8mixed.safetensors**

- **Location:** `checkpoints/Z-image/` or `unet/`
- **CLIP Required:** Not applicable
- **Text Encoder Required:**
  - `qwen_3_4b.safetensors` OR
  - `qwen_3_4b_fp8_mixed.safetensors` OR
  - `qwen_3_4b_fp4_mixed.safetensors`
  - (located in `text_encoders/Z-Image/`)
  - Alternative: `qwen-4b-zimage-heretic-q8.gguf` or `Huihui-Qwen3-4B-abliterated-v2_fp8mixed.safetensors`
- **VAE Required:**
  - `ae.safetensors` (located in `vae/Z-Image/`)
- **Notes:** Z-Image uses Qwen LLM as text encoder - very different architecture

---

## 📋 Quick Reference Table

| Model Family | CLIP Type | Separate CLIP Needed? | VAE Needed? | Text Encoder |
|--------------|-----------|----------------------|-------------|--------------|
| **FLUX** | CLIP-L + T5-XXL | ✅ Yes (2 files) | ✅ Yes | T5-XXL (separate) |
| **SD3** | CLIP-L + CLIP-G + T5-XXL | Depends on variant | Usually built-in | T5-XXL (may need separate) |
| **SDXL** | OpenCLIP-G + CLIP-L | ❌ Usually built-in | ⚠️ Optional (recommended) | Built-in |
| **SD1.5** | CLIP-L | ❌ Built-in | ❌ Usually built-in | Built-in |
| **Qwen** | N/A | N/A | ⚠️ Optional | Qwen LLM (separate or built-in) |
| **Z-Image** | N/A | N/A | ✅ Yes | Qwen-3-4B (separate) |

---

## 🔧 What You're Missing

Based on your file listing, here are some recommended downloads:

1. **SDXL VAE** - `sdxl_vae.safetensors`
   - Not critical, but improves SDXL output quality
   - Place in: `models/vae/`

2. **SD1.5 VAE** (Optional) - `vae-ft-mse-840000-ema-pruned.safetensors`
   - Only if you want external VAE control for SD1.5
   - Place in: `models/vae/`

---

## 💡 Important Notes

### FLUX Workflow:
```
FLUX checkpoint → Load separately:
  - clip_l.safetensors
  - t5xxl_fp16.safetensors (or fp8 for lower VRAM)
  - ae.safetensors (VAE)
```

### SD3 Workflow Options:
```
Option 1 (Minimal files):
  sd3_medium_incl_clips_t5xxlfp16.safetensors → No external files needed

Option 2 (More control):
  sd3_medium.safetensors → Load separately:
    - clip_l.safetensors
    - clip_g.safetensors
    - t5xxl_fp16.safetensors (or fp8)
```

### Z-Image Workflow:
```
z-image-turbo-fp8-aio.safetensors → Load separately:
  - qwen_3_4b_fp8_mixed.safetensors (text encoder)
  - ae.safetensors (from vae/Z-Image/)
```

---

## 📁 Your Current File Structure Summary

✅ **You have:**
- FLUX text encoders (CLIP-L, T5-XXL in FP16 and FP8)
- FLUX VAEs (ae.safetensors)
- SD3 text encoders (all variants)
- SD3 checkpoints (all variants including all-in-one)
- Qwen text encoders (multiple quantizations)
- Z-Image text encoders and VAE

⚠️ **You're missing:**
- Dedicated SDXL VAE (optional but recommended)
- Dedicated SD1.5 VAE (optional)

---

*Generated for ComfyUI on Windows 11*  
*Last updated: February 2026*
