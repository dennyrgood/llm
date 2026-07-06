# ComfyUI Task to Model Recommendations

Extracted from PDF: ComfyUI Task to Model Recommendations.pdf

---

ComfyUI Task-to-Model
Recommendation Guide
Hardware Optimization: RTX 5090 | Environment: Windows 11
This guide maps common image manipulation tasks to the specific models and support
files found on your system to ensure maximum quality and speed.

📸 Photorealistic Tasks
Task

Primary
Model

Support Files
(VAEs / CLIPs)

Recommendation & Strategy

Fixing
Contrast &
Brightness

Qwen Image
Edit 2511

qwen_image_vae,
t5xxl_fp16

Use for "Global Edits." Qwen is
superior at understanding lighting
instructions without changing the
underlying image structure.

ae.safetensors,
t5xxl_fp16, clip_l

Use the 23.8GB full version. It
provides the best environmental
blending for new objects
compared to the GGUF variants.

ae.safetensors,
t5xxl_fp16, clip_l

Better than generic inpainting. It
"hallucinates" the missing
background with higher fidelity,
crucial for 4K workflows.

Adding
Elements or
People
Removing
Elements or
People

FLUX.1 Fill
(Dev)

FLUX.1 Fill
(Dev)

Combining
Images
(Blending)

DreamOmni2

flux1-kontext-dev,
clip_l, t5xxl_fp16

Use the Vantage-DreamOmni2
node. It allows you to feed a
source image and a reference
image to transfer poses or objects
seamlessly.

Restoring Old
Photographs

FLUX.1
Kontext

ae.safetensors,
t5xxl_fp16, clip_l

Best for "Structural Restoration." If
the face is damaged, pair this with
the InsightFace models
(antelopev2) to preserve identity.

🎨 Creative & Non-Photorealistic Tasks
Task

Base
Model

LoRA / Toolset

Strategy

Puppets /
Claymation

FLUX.1
Dev

MasterClaymation.safetensors

Apply at a strength of 0.8–1.0. FLUX's
prompt adherence ensures the "clay"
texture applies to every detail.

Anime /
Cartoons
Fun Stylized
Changes

FLUX.1
Dev

Flux Color Pop Sketch
LoRA

Z-Image
z_image_turbo_nvfp4
Turbo

This LoRA excels at turning
photorealistic inputs into stylized,
vibrant sketches or cell-shaded art.
Use this for "Rapid Prototyping." Since
it's optimized for your 5090, you can
iterate through different fun styles in
seconds.

💡 RTX 5090 Workflow Notes
1. The "No-GGUF" Policy for VRAM Giants
Since you have an RTX 5090, your VRAM is not a bottleneck.
•
•

Avoid: Q8_0 or fp8 Text Encoders if a full version is available.
Always Use: t5xxl_fp16.safetensors for your CLIP loader. This ensures the model
understands complex prompts (like "holding a blue translucent orb") without the
"brain fog" caused by quantization.

2. Identity Preservation (PuLID + InsightFace)
For any task involving people (Adding, Combining, or Restoring), use your PuLID for
FLUX (pulid_flux_v0.9.1.safetensors).
•
•

Requirement: Ensure your antelopev2 and buffalo_l ONNX models are loaded into
the InsightFace node.
Benefit: This prevents the AI from "genericizing" the face, keeping it looking like
the specific person in your reference photo.

3. Background Removal (RMBG 2.0)
Before combining images or adding people, use RMBG 2.0. Removing the background
of your source element before passing it to FLUX Fill or DreamOmni2 prevents "color
bleeding" from the old background into your new scene.

4. Speed vs. Quality
•
•

For Speed: Use z_image_turbo_nvfp4. It is built for your hardware and generates in
~1-3 seconds.
For Quality: Use the Full 35GB FLUX.2 or FLUX Kontext. These take longer
(~10-15 seconds) but provide professional-grade skin textures and lighting.

