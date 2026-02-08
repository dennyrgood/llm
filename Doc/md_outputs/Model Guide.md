Model Guide -- Common Tasks -- Feb 2026

One more time ...

- Create simple images (text-to-image basics): Use **Flux.1 Dev** [or
  **Z-Image Turbo**]{.mark} **bf16** for quick photoreal generation;
  fallback to SDXL Base 1.0 for legacy compatibility.

- Change brightness (global adjustments): Use Qwen-Image-Edit-2511 with
  a prompt like \"increase brightness\"; or [Flux.1 Kontext Dev]{.mark}
  for text-based tweaks without masks.

- Change background: Use Flux.1 Fill Dev for inpainting the background
  area; or Qwen-Image-Edit-2509 for precise object-preserving edits.

- Add a person/thing: Use Qwen-Image-Edit-2511 for seamless addition via
  prompts/masks; or Flux.1 Kontext Dev for context-aware integration.

- Delete a person/thing: Use Flux.1 Fill Dev for masking and inpainting
  removal; or Qwen-Image-Edit-2509 for clean, photoreal deletions.

- Combine two images: Use Flux.2 Dev for multi-reference img2img
  blending; or Z-Image Turbo Fun ControlNet Union with depth/canny for
  guided merging.

- Restore an old photograph: Use Qwen-Image-Edit-2511 for expert fixes
  (scratches, color, details); or Realistic Vision V5.1 (SD1.5) with
  ControlNet depth for structure preservation.

- Turn a realistic photograph into a fun image (e.g., puppets or
  stylized): Use Flux.1 Kontext Dev with style LoRAs like
  Master-Claymation; or Juggernaut XL Ragnarok (SDXL) with
  ColoringBookRedmond LoRA for cartoon/puppet effects.

- Upscale an image: Use 4x-UltraSharp.pth or 4x_NMKD-Siax_200k.pth with
  ESRGAN nodes for high-res detail enhancement.

- Face enhancement or swap: Use IP-Adapter-FaceID SDXL with Insightface
  models for identity preservation/swaps in edits.

- Guided pose/structure editing: Use ControlNet SD1.5 (canny/openpose)
  with Juggernaut Reborn (SD1.5) for pose adjustments in photoreal
  scenes.

- Text addition/typography: Use SD3 Medium incl Clips T5XXL fp16 for
  accurate text overlays in images.

- Outpainting is an AI image editing technique that extends an image
  beyond its original borders, generating new content (e.g.,
  backgrounds, scenes) while seamlessly matching the style, lighting,
  and details of the source image. It\'s great for expanding cropped
  photos, creating panoramic views, or restoring incomplete images in
  your photoreal workflows. Recommended Model: Use your Flux.1 Fill Dev
  (flux1-fill-dev.safetensors or Q8 gguf variant) -- it\'s specialized
  for outpainting and inpainting, producing high-quality, photoreal
  results with good coherence. For alternatives, try
  Qwen-Image-Edit-2511 (for prompt-based extensions) or Z-Image Turbo
  bf16 (with ControlNet for guided outpainting).

NOTES ON OUTPAINTING:

Basic ComfyUI Workflow Steps:Load your source image (use \"Load Image\"
node).

Add \"Pad Image for Outpainting\" node: Set padding pixels (e.g.,
left=0, right=512, top=0, bottom=0 to extend right side) and feathering
(e.g., 64 pixels) for smooth blending.

Connect to \"Inpaint Model Conditioning\" or \"Flux Guidance\" node for
control.

Use your Flux.1 Fill Dev as the checkpoint; add a positive prompt
describing the new area (e.g., \"seamless extension of forest landscape,
photorealistic, matching lighting\").

Decode with VAEDecode and your ae.safetensors VAE.

Run the queue (Ctrl+Enter); adjust denoising strength (0.6--0.8) and
steps (20--30) for best results.
