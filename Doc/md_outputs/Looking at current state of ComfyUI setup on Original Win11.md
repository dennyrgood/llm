# Looking at current state of ComfyUI setup on Original Win11

Extracted from PDF: Looking at current state of ComfyUI setup on Original Win11.pdf

---

Looking at current state of ComfyUI setup on Original Win11

Current Model Distribution
From your screenshots, you have:
•
•
•
•
•
•
•

CLIP/text encoders (clip folder, text_encoders)
ControlNet models (controlnet folder with SDXL folder)
VAE models (vae, vae_approx folders)
Upscale models (upscale_models)
UNet models (unet folder)
Diffusion models (diffusion_models folder)
Face restoration (facerestore_models)

Recommended Setup for Your Hardware
ComfyUI Server (2x GTX 1080 Ti = 22GB VRAM): This is your powerhouse for generation.
Keep here:
•
•
•
•
•

All diffusion models (flux1-schnell, flux1-dev, z_image_turbo)
UNet models (flux1-dev-fp8.safetensors)
ControlNet models (especially the large SDXL ones)
VAE models
Main CLIP/text encoders

Workstation (RTX 3060 12GB + Ollama): Since Ollama is already using this, keep this
focused on:
•
•
•
•

Lightweight inference support if needed
Face restoration models (GFPGAN)
Upscale models (RealESRGAN)
Can serve as backup for smaller models

Optimization Tips
1. Consolidate duplicates: You have multiple encoder/decoder variants - keep only what
you actively use
2. Use FP8 quantized models: I see you already have some
(t5xxl_fp8_e4m3fn.safetensors) - these save significant VRAM
3. Network access: Ensure ComfyUI on your server is accessible from your workstation via
network
4. Model loading: With 22GB VRAM on the server, you can load larger Flux models
comfortably

Understanding Your ComfyUI Model Files
Let me break down each folder and file type you showed me:

1. CLIP Folder (Image 2)
What they are:
•
•

clip_l.safetensors (240 MB) - CLIP text encoder for understanding prompts
t5xxl_fp8_e4m3fn.safetensors (4.7 GB) - T5 XXL text encoder (Flux models)

What they do: Convert your text prompts into embeddings that the AI understands. Flux models
need both CLIP and T5 encoders.
Can you eliminate? NO - these are essential for Flux to work. Keep both.

2. ControlNet Folder (Image 3)
What they are:
•
•
•

flux-controlnet-canny-v3.safetensors (1.4 GB) - Edge detection control
flux-controlnet-depth.safetensors (3.1 GB) - Depth map control

SDXL subfolder - ControlNet models for SDXL (different model family)

What they do: Guide image generation using edge maps, depth maps, poses, etc. They give you
precise control over composition.
Can you eliminate?
•
•

Keep if you use ControlNet features (highly recommended)
The SDXL folder: only if you use SDXL models (not Flux)

3. VAE_approx Folder (Image 4)
What they are: Multiple TAESD (Tiny AutoEncoder) variants
What they do: Create quick, low-quality previews during generation so you can see progress
without loading the full VAE.

Can you eliminate?
•
•

Keep ONE that matches your model: taesd_decoder.safetensors for Flux
Delete the rest (taef1, taesd3, taesdxl variants unless you use those specific models)

4. VAE Folder (Image 5)
What they are:
•
•

ae.safetensors (327 MB) - Flux AutoEncoder
ae-from-zimage-youtube.safetensors (327 MB) - Duplicate/variant

What they do: Encode images to latent space and decode them back. Essential for image
generation.
Can you eliminate? Keep ae.safetensors only. Delete the YouTube variant (it's redundant).

5. Upscale_models Folder (Image 6)
What they are:
•

RealESRGAN_x4.pth (65 MB) - 4x upscaler

What they do: Increase image resolution after generation.
Can you eliminate? Keep if you upscale images. These are small, so no harm keeping them.

6. UNet Folder (Image 7)
What they are:
•

flux1-dev-fp8.safetensors (11.6 GB) - Flux Dev model (quantized)

What they do: This IS the actual Flux model. The core AI that generates images.
Can you eliminate? NO - this is your main model. Keep it.

7. Text_encoders Folder (Image 8)
What they are:
•
•
•

clip_l.safetensors (240 MB) - CLIP encoder (duplicate from clip folder)
qwen_3_4b.safetensors (7.8 GB) - Alternative text encoder
t5xxl_fp8_e4m3fn_scaled.safetensors (5 GB) - T5 encoder variant

Can you eliminate?
•
•
•
•

This is REDUNDANT with your clip folder
Keep the clip folder versions
Delete qwen_3_4b unless you specifically use it
Delete the "scaled" T5 variant

8. Facerestore_models Folder (Image 9)
What they are:
•

GFPGAN-1.3.8.zip (5.8 MB compressed)

What they do: Restore/enhance faces in generated images.
Can you eliminate? Keep if you generate faces and want enhancement. Small file, no harm
keeping.

9. Diffusion_models Folder (Image 10)
What they are:
•
•
•

z_image_turbo_bf16.safetensors (12 GB) - Fast generation model
flux1-schnell-fp8-e4m3fn.safetensors (11.6 GB) - Flux Schnell (fast variant)
flux1-dev-kontext_fp8_scaled.safetensors (11.6 GB) - Flux Dev variant

What they do: Different Flux model variants for different purposes (speed vs quality).
Can you eliminate?
•
•

Keep ONE Flux model you prefer (Schnell for speed, Dev for quality)
You already have flux1-dev in unet folder

•

Delete duplicates/variants you don't use

10. ControlNet/SDXL Folder (Image 11)
What they are:
•

controlnet-union-sdxl-1.0 subfolder

What they do: ControlNet models specifically for SDXL (not Flux).
Can you eliminate? Only if you DON'T use SDXL models. If you only use Flux, delete this
entire folder.

Cleanup Recommendations
HIGH PRIORITY - Delete These:
1.
2.
3.
4.

Duplicate text encoders in text_encoders folder
Extra TAESD variants in vae_approx (keep only taesd_decoder)
ae-from-zimage-youtube.safetensors in VAE folder
Duplicate Flux models (you have flux1-dev in multiple places)

MEDIUM PRIORITY - Consider Deleting:
1. SDXL ControlNet folder (if you only use Flux)
2. qwen_3_4b.safetensors (unless you specifically use it)
3. Extra Flux variants (Schnell, z_image_turbo) if you only use one

KEEP:
•
•
•
•
•
•

flux1-dev-fp8.safetensors (your main model)
clip_l.safetensors and t5xxl_fp8_e4m3fn.safetensors (text encoders)
ae.safetensors (VAE)

One TAESD decoder for previews
ControlNet models if you use them
Upscale models

File Sharing & Workflow Access Plan
Problem:
Your MacBook Air M2 can access ComfyUI server via web, but:
•
•
•

Saved workflows → Go to server's local drive ✓
Loading workflows → Must be on Mac's local drive ✗
Can't access workflows saved on the server

Solution Options:
Option 1: OneDrive Sync (Recommended for You)
Since you already use OneDrive:
On ComfyUI Server:
1. Move workflow folder to OneDrive
2. Create symlink in ComfyUI directory:
mklink /D "D:\Misc\ComfyUI\ComfyUI\user\default\workflows"
"C:\Users\YourName\OneDrive\ComfyUI_Workflows"

On MacBook Air M2:
1. Install OneDrive
2. Let workflows sync automatically
3. Point ComfyUI to OneDrive folder
Pros:
•
•
•
•

Automatic sync across all devices
Works over internet
No VPN needed
Already familiar with OneDrive

Cons:
•
•

Uses cloud storage quota
Requires internet for sync

## **My Recommendation:**
**Use OneDrive sync** since you're already using it. Here's the setup:
### **Step-by-Step Setup:**
**1. On ComfyUI Server:**
```
1. Create folder: C:\Users\YourName\OneDrive\ComfyUI_Shared\workflows
2. Copy existing workflows there
3. Open Command Prompt as Administrator
4. Run: mklink /D "D:\Misc\ComfyUI\ComfyUI\user\default\workflows"
"C:\Users\YourName\OneDrive\ComfyUI_Shared\workflows"
```
**2. On MacBook Air M2:**
```
1. Install OneDrive (if not already)
2. Let ComfyUI_Shared folder sync
3. In ComfyUI settings, point workflow directory to:
~/Library/CloudStorage/OneDrive/ComfyUI_Shared/workflows
```
**3. On Windows Workstation (optional):**
Same as MacBook - let OneDrive sync and point to that folder.
---

For Model Sharing Between Windows Machines:**

**Option A: Network Path**
On ComfyUI server, share models folder:
```
Share: D:\Misc\ComfyUI\ComfyUI\models
Access from workstation: \\server-ip\models
In ComfyUI extra_model_paths.yaml:
yaml
workstation:
base_path: \\server-ip\models\
checkpoints: diffusion_models
vae: vae
clip: clip
controlnet: controlnet

Option B: Duplicate Essential Models Keep frequently used models on both machines, sync

Best Method: Upload Directly Here
1. Zip your workflows folder:
powershell
# Navigate to your workflows directory
cd "D:\Misc\ComfyUI\ComfyUI\user\default\workflows"
# Create a zip file
Compress-Archive -Path *.json -DestinationPath "C:\Users\YourName\Desktop\my_workflows.zip"

2. Upload the zip here - I can analyze all your workflow JSON files to see which models
they reference

What I'll Check For:
When you send the workflows, I'll scan for:

•
•
•
•
•

Checkpoint/model names - which Flux variants you actually use
ControlNet references - if you use SDXL ControlNets
VAE references - which VAE/TAESD models are needed
Text encoder requirements - if you use alternative encoders like Qwen
Custom nodes - that might require specific models

Quick Manual Check You Can Do:
Open any workflow JSON file in a text editor and search for these terms:
•
•
•
•
•

"qwen" - if found, keep qwen_3_4b.safetensors
"sdxl" - if found, keep SDXL ControlNet folder
"schnell" - if found, keep flux1-schnell model
"z_image_turbo" - if found, keep that model
"ae-from-zimage" - if found, keep that VAE variant

Models Actually Used in Your Workflows:
CLIP/Text Encoders:
•
•
•
•

✅ clip_l.safetensors - Used in most Flux workflows
✅ t5xxl_fp8_e4m3fn.safetensors - Used in Flux workflows
❌ qwen_3_4b.safetensors - NOT found in any workflow
❌ t5xxl_fp8_e4m3fn_scaled.safetensors - NOT found in any workflow

Main Models:
•
•
•
•

✅ flux1-dev-fp8.safetensors (or flux1-dev) - Used in multiple workflows
✅ flux1-schnell - Used in several "schnell" workflows
❌ z_image_turbo - Only found in "zimage.json" workflow
❌ flux1-dev-kontext - NOT found in any workflow

VAE:
•
•

✅ ae.safetensors - Used in Flux workflows
❌ ae-from-zimage-youtube - Only in zimage.json workflow

SDXL Models:
•

❌ SDXL ControlNet folder - Found in "Simple SDXL Workflow" files, but you seem
focused on Flux

•

✅ Keep if you use those "Simple SDXL Workflow" files

ControlNet:
•

✅ flux-controlnet-canny-v3 and flux-controlnet-depth - Used in some workflows

Safe to Delete:
Based on your actual workflows:
1.
2.
3.
4.
5.

❌ qwen_3_4b.safetensors (7.8 GB) - Not used
❌ t5xxl_fp8_e4m3fn_scaled.safetensors (5 GB) - Not used
❌ flux1-dev-kontext_fp8_scaled.safetensors (11.6 GB) - Not used
❌ Extra TAESD variants in vae_approx (except taesd_decoder)
❌ ae-from-zimage-youtube.safetensors - Unless you use zimage.json

Keep if you use specific workflows:
•
•
•

z_image_turbo_bf16.safetensors - Only if you use zimage.json
flux1-schnell-fp8 - Keep if you use the "schnell" fast workflows
SDXL ControlNet - Only if you use "Simple SDXL Workflow" files

Updated Space Savings:
•
•

Removing unused files: ~24 GB (safer estimate)
If you also remove flux1-schnell (keeping only flux1-dev): ~35 GB

