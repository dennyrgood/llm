# ComfyUI Explained - Understanding the Basics

Extracted from PDF: ComfyUI Explained - Understanding the Basics.pdf

---

ComfyUI Explained - Understanding What's Actually
Happening
Let's break down what you're really doing when you generate an image in ComfyUI.

The Big Picture: How AI Image Generation Works
Think of it like a photo darkroom process:
1. Start with random noise (like unexposed film)
2. Gradually refine it based on your text description (developing the image)
3. Clean it up and make it viewable (final print)
ComfyUI breaks this process into nodes - each node does ONE specific job.

Core Concepts You Need to Know
1. MODEL (The Brain)
What it is: The actual AI that "understands" how to turn noise into images.
In your case: flux1-dev-fp8.safetensors (11 GB file you downloaded)
• This is JUST the diffusion model
• It's the "artist" that paints the picture
• FP8 = 8-bit floating point (compressed to save memory)
Analogy: The model is like a trained painter who knows how to paint realistic scenes.

2. CLIP (The Translator)
What it is: Converts your text prompt into numbers the MODEL can understand.
Full name: Contrastive Language-Image Pre-training
The problem you hit: Your Flux model file doesn't include CLIP - it needs to be loaded separately.
Files needed:
• clip_l.safetensors - Basic language understanding (246 MB)
• t5xxl_fp8_e4m3fn.safetensors - Advanced language model (4.89 GB)
Analogy: CLIP is like a translator who converts "a red sports car" into instructions the painter (MODEL) can
follow.

3. VAE (The Image Processor)
What it is: Variational AutoEncoder - compresses/decompresses images.
Full name: VAE converts between:
• Latent space (compressed mathematical representation - tiny, fast)
• Pixel space (actual viewable image - big, slow)

Why it matters:
• MODEL works in latent space (faster, uses less VRAM)
• VAE Decode converts latent → pixels at the end
• VAE Encode converts pixels → latent (for editing existing images)
File: ae.safetensors (335 MB) - the VAE for Flux
Analogy: VAE is like a JPEG compressor/decompressor - makes files smaller for processing, then expands
them back to viewable images.

4. CONDITIONING (The Instructions)
What it is: The processed version of your text prompt that guides the MODEL.
Two types:
• Positive conditioning - what you WANT ("red sports car, photorealistic")
• Negative conditioning - what you DON'T want ("blurry, cartoon, low quality")
Flow:
Your text → CLIP → CONDITIONING → MODEL

Analogy: Conditioning is like giving the painter specific instructions: "paint this" and "don't paint that."

5. LATENT (The Work-in-Progress)
What it is: The compressed representation of an image while it's being generated.
Why use it:
• 1024x1024 pixel image = huge data
• 128x128 latent = tiny data (but represents same image)
• MODEL works 64x faster in latent space
Nodes you'll see:
• Empty Latent Image - creates blank canvas (in latent space)
• Latent output - the work-in-progress from KSampler
• VAE Decode - converts latent → viewable image
Analogy: Latent is like a thumbnail sketch the painter works on before creating the full painting.

6. KSAMPLER (The Painting Process)
What it is: The core diffusion algorithm that gradually refines noise into an image.
Key settings:

• Steps (20): How many times to refine the image (more = better quality, slower)
• CFG (7.0): How closely to follow your prompt (higher = more literal, lower = more creative)
• Seed: Random number that determines the starting noise (same seed = same image)
• Sampler name (euler, dpm++): Different mathematical approaches to denoising
What it does:
Step 1: 100% noise → 95% noise, 5% image
Step 2: 95% noise → 90% noise, 10% image
...
Step 20: 5% noise → 0% noise, 100% image

Analogy: KSampler is the painting process itself - starting with a blank canvas and gradually adding detail until
complete.

Your Specific Setup Problem (Explained)
What You Downloaded:
File 1: flux1-dev-fp8.safetensors (11 GB)
• ✓ Contains: MODEL (the painter)
• ✗ Missing: CLIP (the translator)
• ✗ Missing: VAE (the image processor)
File 2: flux1-dev.safetensors (23.8 GB)
• ✓ Contains: MODEL
• ✓ Contains: CLIP
• ✓ Contains: VAE
• ✗ Problem: Too big for 12GB VRAM (not FP8 compressed)
Why CheckpointLoaderSimple Failed:
It expects ONE file with MODEL + CLIP + VAE bundled together. Your 11GB file only has MODEL.
Why DualCLIPLoader Works:
It loads the 11GB MODEL separately, then loads CLIP from separate files.

The Two Loading Strategies
Strategy 1: All-in-One Checkpoint (Simple)
CheckpointLoaderSimple
↓
Loads ONE file containing MODEL + CLIP + VAE
↓
Outputs: MODEL, CLIP, VAE

Pros: Simple, fewer nodes Cons: Need the right checkpoint file (hard to find in FP8)

Strategy 2: Separate Components (Flexible)

Load Diffusion Model → Loads flux1-dev-fp8.safetensors (MODEL only)
+
DualCLIPLoader → Loads clip_l + t5xxl separately (CLIP)
+
Load VAE → Loads ae.safetensors (VAE)

Pros: Can mix/match, use FP8 models, more control Cons: More nodes, more complex
This is what your working workflow uses!

Understanding Your Working Workflow
Let me explain what each node in your landscape workflow does:
Left Side (Loading):
1. Load Checkpoint - Loads the MODEL (flux1-dev-fp8.safetensors)
2. DualCLIPLoader - Loads the two CLIP text encoders separately
3. Load VAE - Loads the image encoder/decoder
Middle (Processing):
4. CLIPTextEncodeFlux - Converts your prompt text into conditioning
5. Empty Latent Image - Creates blank canvas (1024x1024 in latent space)
6. KSampler - The actual image generation (20 steps of denoising)
Right Side (Output):
7. VAE Decode - Converts latent → viewable pixels
8. Save Image - Saves the final image

What FP8 Means (And Why It Matters)
Precision Levels:
• FP32 (Full precision): 32 bits per number - highest quality, uses 4x VRAM
• FP16 (Half precision): 16 bits per number - good quality, uses 2x VRAM
• FP8 (8-bit float): 8 bits per number - very good quality, uses 1x VRAM
For Your RTX 3060 (12GB VRAM):
• Full Flux model (FP16): ~24 GB VRAM needed ✗ Won't fit
• Flux FP8: ~11-12 GB VRAM needed ✓ Perfect fit!
This is why we specifically need FP8 versions for your card.

How to Find Nodes (Quick Reference)
Method 1: Right-Click Menu (Most Common)

Right-click canvas → Add Node → [category] → [node name]
Categories you'll use most:
├── loaders (Load Checkpoint, Load VAE, DualCLIPLoader)
├── conditioning (CLIPTextEncode, CLIPTextEncodeFlux)
├── sampling (KSampler, BasicScheduler)
├── latent (Empty Latent Image, Latent Upscale)
├── image (Load Image, Save Image, Preview Image)
└── _for_testing (experimental nodes)

Method 2: Search (Fastest)
1. Right-click canvas
2. Start typing immediately (no need to click anything)
3. Type: "clip" → see all CLIP-related nodes
4. Type: "sample" → see all sampling nodes
Method 3: Double-Click Canvas
• Double-click → Search box appears
• Type node name

Common Node Patterns (Recipes)
Pattern 1: Text-to-Image (Basic)
Load Checkpoint
↓ MODEL → KSampler
↓ CLIP → CLIPTextEncode → KSampler (positive)
↓ VAE → VAE Decode
↓
Empty Latent → KSampler → VAE Decode → Save Image

Pattern 2: Image-to-Image (Editing)
Load Image → VAE Encode → KSampler → VAE Decode → Save Image
↑
(Add prompt via CLIP)

Pattern 3: Inpainting (Your Goal - Remove People)
Load Image + Mask → VAE Encode → KSampler (with mask) → VAE Decode → Save

What You Actually Need for Your Setup
Files Required (Total ~17 GB):
1. Diffusion Model (MODEL):
• flux1-dev-fp8.safetensors (11 GB) ✓ You have this
2. Text Encoders (CLIP):

• clip_l.safetensors (246 MB) - Download from: https://huggingface.co/comfyanonymous/
flux_text_encoders/resolve/main/clip_l.safetensors
• t5xxl_fp8_e4m3fn.safetensors (4.89 GB) - Download from: https://huggingface.co/comfyanonymous/
flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors
3. Image Encoder/Decoder (VAE):
• ae.safetensors (335 MB) - Download from: https://huggingface.co/black-forest-labs/FLUX.1-schnell/
resolve/main/ae.safetensors
File Locations:
D:\misc\ComfyUI\ComfyUI\models\
├── checkpoints\
│ └── flux1-dev-fp8.safetensors (11 GB) ✓
├── clip\
│ ├── clip_l.safetensors (246 MB) ← Need this
│ └── t5xxl_fp8_e4m3fn.safetensors (4.89 GB) ← Need this
└── vae\
└── ae.safetensors (335 MB) ← Need this

Why Your Generation Took 267 Seconds
You're probably using the wrong T5 model. Current workflow likely uses:
• t5xxl_fp8_e4m3fn_scaled.safetensors ← Slower, larger
Should use:
• t5xxl_fp8_e4m3fn.safetensors ← Faster, optimized for RTX 3060
The "scaled" version wasn't optimized properly for FP8, causing slowdowns.

Next Steps (Now That You Understand)
Step 1: Download the 3 Missing Files
Get the CLIP and VAE files listed above (total ~5.5 GB download)
Step 2: Verify Your File Structure
Make sure files are in correct folders as shown above
Step 3: Restart ComfyUI
So it detects the new files
Step 4: Load Your Working Workflow
The landscape one that took 267 seconds
Step 5: Update DualCLIPLoader
Select the correct t5xxl_fp8_e4m3fn.safetensors (NOT scaled version)
Step 6: Test
Should now take 15-25 seconds instead of 267 seconds!

Questions to Check Your Understanding

Q1: What does the MODEL do? A1: Generates the image (the "painter")
Q2: What does CLIP do? A2: Converts text prompts into instructions the MODEL understands (the
"translator")
Q3: What does VAE do? A3: Converts between latent space (compressed) and pixel space (viewable images)
Q4: Why do we need FP8 for your RTX 3060? A4: Full precision models need 24GB VRAM, FP8 compresses
them to fit in 12GB
Q5: What does KSampler do? A5: Gradually refines noise into an image over multiple steps (the "painting
process")

Bookmark These for Reference
ComfyUI Official Docs:
• https://github.com/comfyanonymous/ComfyUI
Model Sources:
• HuggingFace (most AI models): https://huggingface.co
• CivitAI (community models): https://civitai.com
Learning Resources:
• ComfyUI Examples: https://comfyanonymous.github.io/ComfyUI_examples/
• r/comfyui subreddit

The Mental Model (Summary)
Image generation is a pipeline:
1. Your text prompt
↓
2. CLIP translates to numbers (conditioning)
↓
3. MODEL + KSampler gradually creates image (in latent space)
↓
4. VAE converts latent to pixels
↓
5. Final viewable image saved

ComfyUI = Visual pipeline builder
• Each node = one step
• Lines = data flowing between steps
• You design the pipeline by connecting nodes

Does this make sense now? Any concepts you want me to explain deeper before we continue?

