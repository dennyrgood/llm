**ComfyUI Model Compatibility Chart**

**System: Windows 11 \| GPU: RTX 5090 \| Data Source: Local
models.lst.txt**

  ----------------------------------------------------------------------------------------------------------------------------------
  **Model Family** **Specific Model File (Your System)**   **Required CLIP / Text      **Required VAE**       **Node Strategy /
                                                           Encoder**                                          Notes**
  ---------------- --------------------------------------- --------------------------- ---------------------- ----------------------
  **FLUX.1         flux1-kontext-dev.safetensors           clip_l + t5xxl_fp16         ae.safetensors         **Multimodal
  Kontext**                                                                                                   Editing:** Supports
                                                                                                              image + text prompts
                                                                                                              for precise edits.

  **FLUX.2**       flux2_dev_fp8mixed.safetensors          clip_l + t5xxl_fp16         ae.safetensors         **35GB File:**
                                                                                                              High-fidelity version.
                                                                                                              Use UNET Loader (Flux
                                                                                                              2).

  **Z-Image        z_image_turbo_nvfp4.safetensors         qwen_3_4b_fp8_mixed         ae.safetensors         **RTX 5090 Native:**
  Turbo**                                                                              (Z-Image)              Requires CUDA 13 +
                                                                                                              Native FP4 kernels for
                                                                                                              max speed.

  **DreamOmni2**   dreamomni2/ directory models            clip_l + t5xxl_fp16         ae.safetensors         **Vantage-DreamOmni2
                                                                                                              Node:** Multimodal for
                                                                                                              style/pose/lighting
                                                                                                              transfer.

  **FLUX.1 Dev**   flux1-dev-fp8.safetensors               clip_l + t5xxl_fp16         ae.safetensors         Pair with
                                                                                                              pulid_flux_v0.9.1 for
                                                                                                              identity preservation.

  **FLUX Fill**    flux1-fill-dev.safetensors (23.8GB)     clip_l + t5xxl_fp16         ae.safetensors         Full-precision fill;
                                                                                                              better than GGUF for
                                                                                                              your 5090 VRAM.

  **Qwen Image     qwen-image-edit-2511-Q8_0.gguf          qwen_2.5_vl_7b_fp8_scaled   qwen_image_vae         **GGUF Model Loader:**
  Edit**                                                                                                      Optimized image
                                                                                                              manipulation.

  **SD 3.5         sd3_medium.safetensors                  clip_l + clip_g + t5xxl     Built-in               TripleCLIPLoader
  Medium**                                                                                                    

  **SDXL**         juggernautXL_ragnarokBy.safetensors     **None** (Embedded)         ip-adapter-plus_sdxl   VAE is baked into the
                                                                                                              checkpoint.

  **SD 1.5**       realisticVisionV51_v51VAE.safetensors   **None** (Embedded)         **None** (Baked-in)    VAE is integrated; no
                                                                                                              external loader
                                                                                                              needed.
  ----------------------------------------------------------------------------------------------------------------------------------

**🛠️ Specialized Power User Assets**

- **Identity (PuLID):** You have pulid_flux_v0.9.1.safetensors. Use this
  with the **InsightFace** models (antelopev2, buffalo_l) in your onnx
  folder to maintain character consistency in FLUX.

- **Performance (Lightning):** You have **Qwen Lightning 4-step LoRAs**.
  Use these to achieve near-instant results with your Qwen models
  without significantly sacrificing detail.

- **Vision Tools:** You have **RMBG 2.0** for high-quality background
  removal and **InsightFace** for face analysis.

- **Artistic Control:**

  - Master-Claymation.safetensors (FLUX LoRA)

  - Flux Color Pop Sketch LoRA

  - ip-adapter-faceid_sdxl.bin for SDXL identity work.

**🚀 Optimization for RTX 5090**

1.  **Stop Using GGUF Text Encoders:** You have t5xxl_fp16.safetensors.
    Since the 5090 has 32GB (or 24GB depending on specific Blackwell
    SKU) of VRAM, never use FP8 or GGUF text encoders. They introduce
    \"language misunderstanding\" and banding that your hardware
    doesn\'t need to suffer from.

2.  **Native FP4 Support:** Your **Z-Image Turbo NVFP4** is specifically
    designed for Blackwell (50-series) and Ada (40-series) cores. Ensure
    your ComfyUI is running **CUDA 13** to utilize the native FP4
    kernels, which are roughly 100% faster than standard versions.

3.  **The \"Ghost\" VAE Myth:** Your analysis correctly identified that
    you don\'t need \"missing\" SDXL/1.5 VAEs because your primary
    checkpoints (realisticVision, juggernaut) have them integrated.
