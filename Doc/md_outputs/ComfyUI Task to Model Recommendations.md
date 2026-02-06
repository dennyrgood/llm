**ComfyUI Task-to-Model Recommendation Guide**

**Hardware Optimization: RTX 5090 \| Environment: Windows 11**

This guide maps common image manipulation tasks to the specific models
and support files found on your system to ensure maximum quality and
speed.

**📸 Photorealistic Tasks**

  -----------------------------------------------------------------------------------
  **Task**        **Primary        **Support Files      **Recommendation & Strategy**
                  Model**          (VAEs / CLIPs)**     
  --------------- ---------------- -------------------- -----------------------------
  **Fixing        **Qwen Image     qwen_image_vae,      Use for \"Global Edits.\"
  Contrast &      Edit 2511**      t5xxl_fp16           Qwen is superior at
  Brightness**                                          understanding lighting
                                                        instructions without changing
                                                        the underlying image
                                                        structure.

  **Adding        **FLUX.1 Fill    ae.safetensors,      Use the 23.8GB full version.
  Elements or     (Dev)**          t5xxl_fp16, clip_l   It provides the best
  People**                                              environmental blending for
                                                        new objects compared to the
                                                        GGUF variants.

  **Removing      **FLUX.1 Fill    ae.safetensors,      Better than generic
  Elements or     (Dev)**          t5xxl_fp16, clip_l   inpainting. It
  People**                                              \"hallucinates\" the missing
                                                        background with higher
                                                        fidelity, crucial for 4K
                                                        workflows.

  **Combining     **DreamOmni2**   flux1-kontext-dev,   Use the
  Images                           clip_l, t5xxl_fp16   **Vantage-DreamOmni2** node.
  (Blending)**                                          It allows you to feed a
                                                        source image and a reference
                                                        image to transfer poses or
                                                        objects seamlessly.

  **Restoring Old **FLUX.1         ae.safetensors,      Best for \"Structural
  Photographs**   Kontext**        t5xxl_fp16, clip_l   Restoration.\" If the face is
                                                        damaged, pair this with the
                                                        **InsightFace** models
                                                        (antelopev2) to preserve
                                                        identity.
  -----------------------------------------------------------------------------------

**🎨 Creative & Non-Photorealistic Tasks**

  ------------------------------------------------------------------------------------------
  **Task**       **Base      **LoRA / Toolset**              **Strategy**
                 Model**                                     
  -------------- ----------- ------------------------------- -------------------------------
  **Puppets /    **FLUX.1    Master-Claymation.safetensors   Apply at a strength of
  Claymation**   Dev**                                       0.8--1.0. FLUX\'s prompt
                                                             adherence ensures the \"clay\"
                                                             texture applies to every
                                                             detail.

  **Anime /      **FLUX.1    Flux Color Pop Sketch LoRA      This LoRA excels at turning
  Cartoons**     Dev**                                       photorealistic inputs into
                                                             stylized, vibrant sketches or
                                                             cell-shaded art.

  **Fun Stylized **Z-Image   z_image_turbo_nvfp4             Use this for \"Rapid
  Changes**      Turbo**                                     Prototyping.\" Since it\'s
                                                             optimized for your 5090, you
                                                             can iterate through different
                                                             fun styles in seconds.
  ------------------------------------------------------------------------------------------

**💡 RTX 5090 Workflow Notes**

**1. The \"No-GGUF\" Policy for VRAM Giants**

Since you have an RTX 5090, your VRAM is not a bottleneck.

- **Avoid:** Q8_0 or fp8 Text Encoders if a full version is available.

- **Always Use:** t5xxl_fp16.safetensors for your CLIP loader. This
  ensures the model understands complex prompts (like \"holding a blue
  translucent orb\") without the \"brain fog\" caused by quantization.

**2. Identity Preservation (PuLID + InsightFace)**

For any task involving people (Adding, Combining, or Restoring), use
your **PuLID for FLUX** (pulid_flux_v0.9.1.safetensors).

- **Requirement:** Ensure your antelopev2 and buffalo_l ONNX models are
  loaded into the InsightFace node.

- **Benefit:** This prevents the AI from \"genericizing\" the face,
  keeping it looking like the specific person in your reference photo.

**3. Background Removal (RMBG 2.0)**

Before combining images or adding people, use **RMBG 2.0**. Removing the
background of your source element *before* passing it to FLUX Fill or
DreamOmni2 prevents \"color bleeding\" from the old background into your
new scene.

**4. Speed vs. Quality**

- **For Speed:** Use z_image_turbo_nvfp4. It is built for your hardware
  and generates in \~1-3 seconds.

- **For Quality:** Use the **Full 35GB FLUX.2** or **FLUX Kontext**.
  These take longer (\~10-15 seconds) but provide professional-grade
  skin textures and lighting.
