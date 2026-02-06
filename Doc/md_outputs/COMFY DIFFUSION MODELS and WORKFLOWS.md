**COMFY DIFFUSION MODELS and WORKFLOWS**

**MY QUESTION**

comfyui. sd1.4, sdxl, flux, flux2, what other major categories of models
are there

**Grok AI**

Here are the major categories/families of diffusion models commonly used
in ComfyUI as of early 2026.These are the primary base model
architectures (or closely related families) that most workflows,
checkpoints, LoRAs, and custom nodes are built around. They differ
significantly in architecture, prompt understanding, speed, VRAM
requirements, and ecosystem maturity.1. SD 1.x / SD 1.5 family (Classic
/ Legacy)

- The original Stable Diffusion lineage everyone started with.

- Resolution sweet spot: \~512×512 to 768×768.

- Huge ecosystem: tens of thousands of fine-tunes, LoRAs, ControlNets,
  embeddings.

- Very fast and low VRAM (\~4--8 GB for comfortable use).

- Still extremely popular for NSFW, anime, fast iteration, and when
  maximum community resources are needed.

2\. SDXL family (including Pony, Illustrious, Turbo, Lightning)

- The dominant \"mid-generation\" family (2023--2025 peak).

- Native resolution: 1024×1024, much better prompt understanding (dual
  text encoders: CLIP-L + OpenCLIP-G).

- Extremely mature ecosystem: most realistic, art, anime, and style
  models are still SDXL-based.

- Pony (Pony Diffusion) deserves special mention → heavily fine-tuned
  fork of SDXL, basically its own sub-category, especially dominant for
  anime, furry, and explicit content (LoRAs from SDXL usually don\'t
  work on it).

- Variants:

  - SDXL Turbo / Lightning → distilled for very fast generation (1--8
    steps).

  - Still the go-to choice for speed + quality balance in 2026 for many
    users.

3\. Flux family (Flux.1 & Flux.2)

- Currently (2026) the hottest and highest-quality open-source family
  for many use cases.

- From Black Forest Labs --- hybrid DiT (Diffusion Transformer)
  architecture.

- Outstanding prompt adherence, anatomy, hands, text in images, realism.

- Variants: dev (highest quality, slow), schnell (distilled/fast), and
  now Flux.2 series.

- Very large (\~12B parameters), needs 16--24 GB VRAM for comfortable
  use (quantized GGUF/Q versions help).

- Growing but still smaller ecosystem than SDXL (great fine-tunes exist,
  though).

4\. SD3 / SD3.5 family

- Stability AI\'s transformer-heavy (DiT-based) successor to SDXL.

- Excellent text understanding (uses T5-XXL + CLIP), typography, complex
  compositions.

- Improved over original SD3 (which had terrible anatomy), but still not
  as universally loved as Flux in many communities.

- Large models, relatively high VRAM needs.

- Decent but not gigantic fine-tune ecosystem yet.

5\. Cascade / Stable Cascade family

- Stability AI\'s Würstchen / multi-stage cascade architecture.

- Very efficient training & inference (different stages handle
  composition vs details).

- Good quality at lower VRAM than contemporaries, but the ecosystem
  never really took off.

- Still used by some, especially for research or specific efficiency
  needs.

6\. Other notable emerging / alternative DiT-based families
(2025--2026)These are smaller but gaining traction, especially for
specific strengths:

- PixArt (Alpha / Sigma) --- early DiT models, good quality/speed
  trade-off.

- Lumina (Lumina-Image 2.0 etc.) --- strong prompt understanding.

- AuraFlow --- fully open attempt at modern DiT.

- HunyuanDiT (Tencent) --- very good quality, especially realism.

- Chroma, Qwen-Image, Z-Image, Ovis-Image --- newer Chinese open DiT
  models, some very competitive in 2026.

- LTX-2 --- frontier model from Lightricks, optimized for NVIDIA,
  expanding into strong image+video+audio territory.

Quick Summary Table (Popularity & Use-case in ComfyUI 2026)

  -----------------------------------------------------------------------------------------------
  **Family**   **Prompt        **Quality     **Speed**   **VRAM**   **Ecosystem   **Best For**
               Adherence**     (2026)**                             Size**        
  ------------ --------------- ------------- ----------- ---------- ------------- ---------------
  SD 1.5       ★★              ★★★           ★★★★★       ★★★★★      ★★★★★         Speed, NSFW,
                                                                                  max resources

  SDXL (+Pony) ★★★★            ★★★★          ★★★★        ★★★★       ★★★★★         General use,
                                                                                  realism/anime
                                                                                  balance

  Flux /       ★★★★★           ★★★★★         ★★          ★★         ★★★★          Maximum
  Flux.2                                                                          quality,
                                                                                  complex prompts

  SD3.5        ★★★★★           ★★★★          ★★          ★★         ★★★           Typography,
                                                                                  compositions

  Cascade      ★★★             ★★★★          ★★★★        ★★★★       ★★            Efficiency

  Others       ★★★★--★★★★★     ★★★★--★★★★★   ★★--★★★     ★★--★★★    ★★--★★★       Trying newest
  (Lumina,                                                                        SOTA models
  Hunyuan,                                                                        
  etc.)                                                                           
  -----------------------------------------------------------------------------------------------

Bottom line in Jan 2026:\
Most people run Flux(.2) when they want the absolute best quality,
SDXL/Pony when they want the biggest ecosystem + speed, and SD 1.5 when
they want blazing fast generations or have older/low-VRAM hardware.Many
advanced users keep workflows for 2--3 families and switch depending on
the project.

**MY QUESTION**

zimage?

**Grok AI**

Z-Image (also stylized as Z‑Image or 造相) is a major new
category/family in the open-source diffusion model landscape as of
January 2026 --- released in late November 2025 by Alibaba\'s Tongyi Lab
(Tongyi-MAI team).It\'s rapidly become one of the most popular and
practical options in ComfyUI right now, especially for users who want
Flux-level quality but with dramatically lower hardware requirements,
blazing speed, and strong uncensored capabilities.Key Highlights of
Z-Image Family

- Architecture: Scalable Single-Stream Diffusion Transformer (S3-DiT)
  --- a clever, efficient DiT design that concatenates text tokens,
  visual semantics, and VAE latents into one unified stream from the
  start. This gives dense cross-modal interaction with far fewer
  parameters than dual/multi-stream giants like Flux.

- Parameter count: Only 6B (billion) --- much smaller than Flux (12B),
  SD3.5 (8B+), or larger Chinese DiTs.

- Main variants (all fully open-source under Apache 2.0):

  - Z-Image-Turbo → the star right now. Distilled for ultra-fast
    inference (best quality in 4--8 steps, often sub-second on good
    hardware). This is what exploded in popularity in ComfyUI.

  - Z-Image-Base → non-distilled foundation version, great for
    fine-tuning/LoRAs.

  - Z-Image-Edit → specialized for strong instruction-based image
    editing.

- Strengths (why it\'s blowing up):

  - Excellent photorealism with natural skin textures, lighting, and
    anatomy (many say it beats or ties Flux.2 dev in realism while being
    way faster).

  - Outstanding bilingual text rendering (English + Chinese --- legible,
    properly structured, no gibberish).

  - Very strong prompt adherence, reasoning, and complex composition
    understanding (thanks to Qwen-based text encoder + architecture).

  - Runs comfortably on 12--16 GB VRAM consumer GPUs (RTX 4060 Ti / 4070
    / 4080 / 4090); quantized versions even work on lower.

  - Extremely fast: 2--10 seconds per image typical in ComfyUI (vs
    30--90s+ for full Flux dev).

  - Growing ecosystem fast: Native ComfyUI support (custom nodes,
    workflows), ControlNet (including Fun Union), LoRAs already
    appearing, GGUF/quant support.

  - Fully uncensored by default (great for NSFW/artistic freedom).

Updated Quick Comparison Table (Jan 2026 snapshot)Adding Z-Image to the
earlier overview:

  ---------------------------------------------------------------------------------------------------
  **Family**   **Prompt       **Photorealism**   **Speed**   **VRAM    **Ecosystem    **Best For**
               Adherence**                                   req.**    Maturity**     
  ------------ -------------- ------------------ ----------- --------- -------------- ---------------
  SD 1.5       ★★             ★★★                ★★★★★       ★★★★★     ★★★★★          Ultra-fast,
                                                                                      legacy max
                                                                                      resources

  SDXL (+Pony) ★★★★           ★★★★               ★★★★        ★★★★      ★★★★★          Balanced
                                                                                      ecosystem king

  Flux /       ★★★★★          ★★★★★              ★★          ★★        ★★★★           Max quality,
  Flux.2                                                                              complex scenes
                                                                                      (when you have
                                                                                      VRAM)

  SD3.5        ★★★★★          ★★★★               ★★          ★★        ★★★            Typography &
                                                                                      compositions

  Z-Image      ★★★★--★★★★★    ★★★★★              ★★★★★       ★★★★      ★★★--★★★★      Fast
  (-Turbo)                                                                            photorealism,
                                                                                      text, low-VRAM
                                                                                      efficiency,
                                                                                      uncensored
                                                                                      speed demon

  Others       ★★★★--★★★★★    ★★★★--★★★★★        ★★--★★★     ★★--★★★   ★★--★★★        Niche SOTA
  (Hunyuan,                                                                           experiments
  Lumina,                                                                             
  etc.)                                                                               
  ---------------------------------------------------------------------------------------------------

Bottom line right now (Jan 10, 2026):\
Z-Image-Turbo is the breakout star of late 2025 / early 2026 --- it\'s
frequently called the \"Flux killer for mortals\" because it delivers
\~90--95% of Flux.2 dev quality at 3--5× the speed and half (or less)
the VRAM. If you have a mid-range GPU and want fast, high-quality,
realistic/uncensored generations with good text, this is probably the
model to try first in ComfyUI today.Setup is straightforward: Grab
z_image_turbo_bf16.safetensors, the Qwen 3-4B text encoder, and AE VAE
--- tons of ready workflows on ComfyUI_examples, Civitai, or the
official Tongyi GitHub. The ecosystem is exploding weekly with more
ControlNets, LoRAs, and optimizations. Highly recommended if speed +
quality balance is your priority!

**MY QUESTION**

photorealism is my goal \... taking a real photo and modifiying it

**Grok AI**

If your primary goal is photorealism while modifying a real photo (e.g.,
inpainting to remove/add objects, outpainting to extend the scene,
changing elements like clothing/backgrounds, fixing details, or subtle
enhancements while keeping it looking like a genuine photograph), here
are the strongest options in ComfyUI as of January 10, 2026.The key
techniques for this are:

- Img2Img (start from your photo with low denoising \~0.25--0.55 to
  preserve structure)

- Inpainting (mask areas to edit precisely)

- Outpainting (extend canvas)

- ControlNet (depth/canny/pose for structure preservation)

- IPAdapter (reference your photo for style/content locking)

Top Recommendations Ranked for Photorealistic Photo Editing

1.  Flux family (especially Flux.1/2 dev + Fill/inpainting variants) →
    Best overall quality for photoreal edits

    - Flux excels at hyper-realistic skin textures, lighting, anatomy,
      and seamless blending --- crucial when editing real photos.

    - Use Flux Fill model (flux1-fill-dev.safetensors) for dedicated
      inpainting/outpainting --- it handles masked areas naturally
      without artifacts.

    - Many users report Flux-based workflows deliver the most
      \"indistinguishable from real photo\" results after editing.

    - Drawbacks: Slower (20--50 steps typical), high VRAM (16--24GB+
      comfortable, quantized helps).

    - Community workflows: Flux + ControlNet (Canny/Depth), IPAdapter
      for strong reference to original photo, or Fluxtapoz/FlowEdit for
      advanced non-inversion editing.

Here are some visual examples of Flux-based photorealistic edits
(before/after style modifications or object additions/removals on
real-ish photos):

2.  Z-Image-Turbo → Best speed + photorealism balance for practical
    editing

    - Delivers near-Flux (or sometimes better) photoreal skin/lighting
      in 4--10 steps, much faster and lower VRAM (\~12--16GB).

    - Strong for realism, natural textures, and bilingual text if
      needed.

    - Editing: Use standard img2img + masking, or combine with
      ControlNet (depth/canny works great for structure). It\'s emerging
      as a \"Flux killer\" for realistic photo mods due to speed without
      much quality drop.

    - Great if you iterate a lot (quick tests on real photos).

Example of Z-Image Turbo photoreal workflow output (high-res realistic
results from photo-inspired prompts):

3.  SD3.5 Large / Medium → Solid alternative for text-heavy or complex
    composition edits

    - Excellent prompt adherence and typography, good realism (better
      than SDXL), but slightly behind Flux/Z-Image in pure skin/lighting
      photorealism.

    - Easier inpainting with dedicated models, lower VRAM than Flux.

4.  Legacy SDXL photoreal fine-tunes (e.g., JuggernautXL Inpaint,
    RealisticVision Inpaint) → Still viable for speed/low VRAM

    - Huge ecosystem of specialized inpaint models and ControlNets ---
      very reliable for seamless object removal/addition on real photos.

    - Not as cutting-edge in raw realism as Flux/Z-Image, but fast and
      mature.

Quick Setup Tips for Photoreal Photo Editing in ComfyUI

- Start with Load Image → VAE Encode (for Inpainting) if masking.

- Use low denoising strength (0.3--0.6) in KSampler for subtle mods.

- Add ControlNet (Depth or Canny from your photo) to lock composition.

- Prompt: \"photorealistic, ultra detailed skin texture, natural
  lighting, 8k, raw photo\" + describe changes.

- For best blends: Multi-pass (coarse edit → refine mask → detail pass).

- Resources: Check ComfyUI_examples (inpaint/outpaint), Civitai
  workflows, or GitHub repos like Acly/comfyui-inpaint-nodes, XLabs Flux
  tools.

Bottom line: Go with Flux Fill/dev first if you have the hardware --- it
currently edges out for the most convincing photoreal modifications of
real photos. If speed/VRAM is a concern, switch to Z-Image-Turbo ---
it\'s shockingly close in quality while being 3--5× faster. Both have
exploding ComfyUI support right now.Try a simple img2img test on one of
your photos and share results if you want workflow tweaks!

**MY QUESTION**

I have a rtx5090

**Grok AI**

With an RTX 5090 (32GB GDDR7 VRAM, Blackwell architecture, native
FP8/FP4 support), you\'re sitting on one of the absolute best consumer
setups for photorealistic photo modification in ComfyUI right now (Jan
10, 2026). This GPU crushes VRAM-heavy tasks like full-precision Flux
dev, large batches, high-res (up to 2K+ easily), and multi-pass editing
without offloading or compromises.Your hardware unlocks the top-tier
photorealism options with minimal slowdowns --- expect generations in
seconds rather than minutes, even for complex inpainting/outpainting on
real photos.Ranked Recommendations for Photorealistic Photo Editing
(Inpainting/Outpainting/Img2Img Mods)

1.  Flux.2 / Flux.1 dev + Flux Fill (Inpainting/Outpainting specialist)
    → Still the king for ultimate photoreal edits

    - Hands-down best for seamless, hyper-realistic blending: skin
      pores, natural lighting/shadows, complex object removal/addition,
      and anatomy that looks indistinguishable from real photos.

    - Use the dedicated Flux Fill dev model (flux-fill-dev or similar
      variants) --- it was designed exactly for masked edits on real
      images and handles context-aware fills/outpaints flawlessly.

    - On your 5090: Full BF16/FP16 runs comfortably (no quantization
      needed), with FP8 or NVFP4 optimizations dropping times to \~2--10
      seconds per image (or even faster for 1024×1024). Inpainting
      passes feel near-instant.

    - Workflow tips: Low denoising (0.25--0.5), ControlNet (Depth/Canny
      from your photo), IPAdapter for strong original reference,
      multi-pass (rough edit → detail refine).

Here are some strong examples of Flux-based photorealistic edits (real
photo → object removal/addition, background change, seamless
inpainting):

2.  Z-Image-Turbo → Fastest photoreal workflow with near-Flux quality

    - Extremely close in realism (skin textures, lighting, natural
      details) but 3--5× faster --- perfect if you iterate dozens of
      times on a single photo.

    - Great for quick masked edits, outpainting extensions, or subtle
      enhancements without waiting.

    - Your 5090 runs it at blazing speeds (sub-5s often) with headroom
      for high-res or batches.

    - Use standard img2img + masking, or ControlNet for structure lock.

Examples of Z-Image Turbo photoreal inpainting/outpainting results on
real photos (before/after):

3.  SD3.5 Large (with inpaint fine-tunes) → Strong runner-up for
    text/composition-heavy edits

    - Excellent prompt following and typography if your mods involve
      signs/text/elements.

    - Realism is very good (improved over original SD3), but
      Flux/Z-Image edges it out on pure skin/lighting fidelity.

    - Runs super smoothly on 5090 (low VRAM use \~10--14GB even full
      precision).

Quick Optimization Tips for Your RTX 5090 in ComfyUI

- Use latest ComfyUI + PyTorch nightly/CUDA 12.8+ for Blackwell support
  (FP8/NVFP4 shines here --- massive speedups on Flux variants).

- No need for \--lowvram or CPU offload flags --- your 32GB eats
  everything.

- For Flux: Try FP8 quantized versions first (near-identical quality,
  2--3× faster).

- Start simple: Load your photo → VAE Encode for Inpainting → MaskEditor
  node → Flux Fill KSampler (low denoise, high steps 20--40).

- Resources: ComfyUI_examples Flux Fill workflows, Civitai Flux inpaint
  packs, or community repos like XLabs/Acly for advanced nodes.

Bottom line: With the 5090, start with Flux Fill/dev --- it delivers the
most convincing \"this was never edited\" photoreal modifications of
real photos. If you want speed for rapid prototyping, flip to
Z-Image-Turbo. Both will feel transformative compared to lower-VRAM
cards.Upload a sample photo edit you\'re trying (or describe the
change), and I can suggest exact workflow tweaks!

**MY QUESTION**

where are the workflows you promised?

**Grok AI**

Here are the specific, ready-to-use workflows I mentioned earlier for
photorealistic photo modification in ComfyUI (e.g., making your family
collage more cohesive while keeping faces exactly as they are). These
focus on inpainting/outpainting/img2img techniques with low denoising to
preserve original faces/details.Since your RTX 5090 handles
full-precision Flux easily, prioritize Flux Fill/dev workflows --- they
give the most seamless, photoreal blends for real photos.1. Official
Flux.1 Fill Dev Inpainting/Outpainting Workflows (Best Starting Point
for Photoreal Cohesion)Black Forest Labs + ComfyUI team provide
excellent drag-and-drop examples:

- These use flux1-fill-dev.safetensors (dedicated inpaint/outpaint
  model) for natural fills/extensions.

- Key for your collage: Load your image, use the MaskEditor (right-click
  Load Image node → Open in MaskEditor) to precisely mask
  overlapping/awkward areas (e.g., edges around cut-out people), then
  prompt for \"cohesive group photo in front of \[describe background\],
  natural lighting, everyone standing together realistically\" with very
  low denoising (0.25--0.45) to lock faces.

- Download by dragging these example images into ComfyUI (they embed the
  full workflow JSON):

  - Basic Inpainting example:
    [[https://comfyanonymous.github.io/ComfyUI_examples/flux/]{.underline}](https://comfyanonymous.github.io/ComfyUI_examples/flux/)
    (scroll to inpainting section, download the workflow image)

  - Outpainting/Extension example: Same page, for expanding canvas to
    make everyone fit better.

  - Full guide + model links:
    [[https://comfyanonymous.github.io/ComfyUI_examples/flux/]{.underline}](https://comfyanonymous.github.io/ComfyUI_examples/flux/)
    (includes flux1-fill-dev setup).

- Pro tip: Use ControlNet Depth/Canny from your original photo (add via
  custom nodes if needed) to preserve poses/positions exactly.

Many users report these give near-perfect photoreal results for real
photo edits.2. Advanced/Community Flux Fill Inpainting Workflows
(Enhanced for Precision & Photorealism)These build on the official ones
with better masking, multi-pass refinement, and face preservation:

- rubi-du/ComfyUI-Flux-Inpainting (GitHub repo): Optimized nodes for
  lower VRAM but still great on your 5090; includes example JSON
  workflows for inpainting/outpainting. Install via ComfyUI Manager
  (search \"ComfyUI-Flux-Inpainting\"), then grab workflows from
  /workflow/ folder (e.g., inpainting.json). Excellent for seamless
  object removal/addition while keeping faces untouched.

  - Link:
    [[https://github.com/rubi-du/ComfyUI-Flux-Inpainting]{.underline}](https://github.com/rubi-du/ComfyUI-Flux-Inpainting)

- Inpaint Crop and Stitch (highly recommended for photoreal): Crops
  masked area, inpaints at full detail, stitches back seamlessly ---
  avoids artifacts on faces. Workflow example:
  [[https://openart.ai/workflows/ZxX625DPdQQVZFO9pJTI]{.underline}](https://openart.ai/workflows/ZxX625DPdQQVZFO9pJTI)

  - Install nodes via Manager (search ComfyUI-Inpaint-CropAndStitch).

- Civitai Flux Inpaint JSON (simple drag-and-drop): Basic but effective
  Flux inpaint workflow --- load your collage, mask gaps/overlaps, low
  denoise.

  - Direct download:
    [[https://civitai.com/articles/6465/flux-inpaint-workflow]{.underline}](https://civitai.com/articles/6465/flux-inpaint-workflow)
    (includes flux inpaint.json file).

For keeping faces exact: Always use low denoising strength (start at
0.3), add a strong positive prompt emphasizing \"identical faces,
preserve original facial features exactly,\" and optionally use
IPAdapter (if you have the nodes) with cropped face references.3.
Z-Image-Turbo Inpainting Workflows (If You Want Blazing Speed for
Iterations)These are 3--5× faster than Flux while nearly matching
photoreal quality --- great for quick tests on your collage.

- Beginner-Friendly Z-Image Turbo Inpaint by Sarcastic TOFU: Simple,
  supports LoRAs, side-by-side comparison. Download from Civitai.

  - Link:
    [[https://civitai.com/models/2173031/comfyui-beginner-friendly-z-image-turbo-seamless-fast-inpaint-workflow-with-loras-by-sarcastic-tofu]{.underline}](https://civitai.com/models/2173031/comfyui-beginner-friendly-z-image-turbo-seamless-fast-inpaint-workflow-with-loras-by-sarcastic-tofu)

- Easy to Use Inpainting V2 by Rafaelldestilo: Precise masking for
  object removal/replacement, optimized for Z-Turbo.

  - Link:
    [[https://civitai.com/models/2192148/comfyui-z-image-turbo-inpainting-easy-to-use-by-rafaelldestilo]{.underline}](https://civitai.com/models/2192148/comfyui-z-image-turbo-inpainting-easy-to-use-by-rafaelldestilo)

- Setup reminder: Need z_image_turbo_bf16.safetensors + Qwen text
  encoder from Hugging Face.

Quick Start Advice for Your Collage:

1.  Update ComfyUI + install any missing nodes via Manager.

2.  Load your collage image.

3.  Mask the \"thrown together\" edges/gaps (use brush for precision
    around faces --- do NOT mask faces!).

4.  Prompt: \"cohesive family group photo in front of \[original
    background\], natural poses, everyone connected realistically,
    photorealistic, high detail\" + negative: \"cutouts, disjointed,
    floating people, artifacts\".

5.  Denoise 0.3--0.45, steps 20--30 for Flux.

6.  Run → if needed, refine with a second pass on small areas.

These should get you a much more unified, natural-looking group photo
without altering any faces. If you run into setup issues or want tweaks
(e.g., adding ControlNet for better pose lock), describe what happens
and I can guide further!

My search:

This could be helpful.

<https://civitai.com/search/models?sortBy=models_v9&query=workflows>

<https://civitai.com/models/162746/ultimatecomfyui-workflows-and-tools-collection-bundle-aio>

<https://civitai.com/models/332006/workflows-for-my-sdxl-enhancer>
