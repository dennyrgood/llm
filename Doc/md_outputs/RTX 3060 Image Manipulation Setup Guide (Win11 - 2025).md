# RTX 3060 Image Manipulation Setup Guide (Win11 - 2025)

Extracted from PDF: RTX 3060 Image Manipulation Setup Guide (Win11 - 2025).pdf

---

RTX 3060 Image Manipulation Setup Guide (Windows 11 2025)
Complete guide for setting up professional image manipulation on your RTX 3060 12GB running Windows 11.

What You'll Achieve
• Remove people/objects from images
• Replace backgrounds seamlessly
• Restore and colorize old photos
• Professional inpainting/outpainting
• High-quality upscaling to 4K

Prerequisites Checklist
Hardware Confirmation
• ✓ RTX 3060 12GB installed in PCIe slot
• ✓ Power connectors attached
• ✓ Monitor connected and GPU detected in Device Manager
Software Requirements
1. Update Windows 11 - Run Windows Update completely
2. Install Latest NVIDIA Driver
• Download from: https://www.nvidia.com/download/index.aspx
• Choose: GeForce RTX 3060 → Windows 11 64-bit → Game Ready or Studio Driver
• Restart after installation
3. Verify GPU Detection
• Open Task Manager → Performance tab
• Confirm "GPU 0 - NVIDIA GeForce RTX 3060" appears

Recommended Stack (2025)
Primary Setup: ComfyUI + Flux.1-dev (FP8) + ControlNet
• Best quality-to-performance ratio for 12GB VRAM
• State-of-the-art results as of 2025
• Fully local (no cloud subscriptions)
Alternative Options:
• Draw Things (Mac/iOS only - skip if Windows)
• Fooocus (simpler than ComfyUI, good for beginners)
• Cloud options: fal.ai, Replicate, Photoshop Firefly

Step 1: Download Core Files
A. ComfyUI Portable (Required)
• Download: https://github.com/comfyanonymous/ComfyUI/releases
• Look for: ComfyUI_windows_portable_nvidia_cu121_or_cpu.7z (cu121 is current as of late 2024/2025)
• Extract to: C:\ComfyUI\ or D:\ComfyUI\ (avoid paths with spaces)
B. Flux.1-dev Model (FP8 - Critical for 12GB)
• Download: https://huggingface.co/Kijai/flux-fp8/blob/main/flux1-dev-fp8.safetensors
• Size: ~17GB
• Save to: ComfyUI\models\checkpoints\
C. ControlNet Models (For precise control)
Download both and place in ComfyUI\models\controlnet\ :
• Depth: https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Depth/tree/main
• Get: diffusion_pytorch_model.safetensors (rename to flux-controlnet-depth.safetensors )
• Canny: https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Canny/tree/main
• Get: diffusion_pytorch_model.safetensors (rename to flux-controlnet-canny.safetensors )
D. Upscaler (For 4K outputs)
• Download: https://huggingface.co/ai-forever/Real-ESRGAN/blob/main/RealESRGAN_x4.pth
• Save to: ComfyUI\models\upscale_models\

Step 2: Initial ComfyUI Setup
Launch ComfyUI
1. Navigate to your ComfyUI folder (e.g., C:\ComfyUI\ )
2. Double-click run_nvidia_gpu.bat
3. Wait for console to show: "To see the GUI go to: http://127.0.0.1:8188"
4. Open your browser to: http://localhost:8188
Install ComfyUI Manager (Essential)
1. In ComfyUI, click Manager button (bottom right)
2. If Manager isn't installed:
• Close ComfyUI (Ctrl+C in console)
• Navigate to ComfyUI\custom_nodes\
• Open Command Prompt here and run:

git clone https://github.com/ltdrdata/ComfyUI-Manager.git

• Restart ComfyUI
Install Essential Custom Nodes
Via Manager → Install Custom Nodes, search and install:

• ✓ ComfyUI-Impact-Pack (segmentation, face detection)
• ✓ ComfyUI-SAM (Segment Anything Model)
• ✓ ComfyUI-Advanced-ControlNet
• ✓ ComfyUI-Essentials
Restart ComfyUI after installations.

Step 3: Get Workflows
Method 1: Import from OpenArt (Easiest)
1. Visit these URLs and download the workflow JSON:
• Background Removal: https://openart.ai/workflows/flux-realistic-background-replace
• Photo Restoration: https://openart.ai/workflows/flux-old-photo-restoration-colorization
2. In ComfyUI, drag the .json file onto the canvas
3. Manager will prompt to install missing nodes - click "Install"
Method 2: Build From Scratch
• Use the workflow builder in ComfyUI
• Connect nodes: Load Image → Flux Sampler → ControlNet → Save Image

Step 4: Verification Test
Quick Test - Text to Image
1. In ComfyUI default workflow, change the checkpoint to flux1-dev-fp8.safetensors
2. Enter prompt: "a red apple on a wooden table, photorealistic"
3. Click Queue Prompt
4. Expected: Image generates in 10-20 seconds
5. Check console for VRAM usage (should stay under 11GB)
If Errors Occur:
• "Out of memory" → Reduce resolution to 512x512, confirm FP8 model selected
• "Model not found" → Check file is in correct models\checkpoints\ folder
• "CUDA error" → Restart PC, verify NVIDIA driver installed

Step 5: Common Workflows
A. Remove Person & Replace Background
Setup:
1. Load the "Background Replace" workflow
2. Upload your source image
3. Use the masking tool to select the person/object
4. Enter background prompt: "sandy beach at sunset, dramatic sky, photorealistic"

Settings for RTX 3060:
• Resolution: 1024x1024 (upscale later)
• Steps: 20-30
• CFG Scale: 7.0
• Sampler: Euler A
Generate Time: ~12-25 seconds per image
B. Old Photo Restoration & Colorization
Setup:
1. Load the "Photo Restoration" workflow
2. Upload damaged/B&W photo
3. Let the workflow auto-detect faces and damage
4. Click generate
What It Does:
• Repairs scratches and tears
• Colorizes B&W photos
• Enhances faces
• Upscales to higher resolution
Generate Time: ~20-40 seconds depending on image size

Optimization Tips for 12GB VRAM
Always Use:
• ✓ FP8 models (flux1-dev-fp8.safetensors)
• ✓ Batch size = 1
• ✓ Start at 1024x1024, upscale after
If Out of Memory:
1. Lower resolution to 768x768 or 512x512
2. Enable "Low VRAM mode" in Settings → System
3. Use tiled ControlNet (processes image in sections)
4. Close other GPU applications (browsers with hardware acceleration)
For Best Quality:
1. Generate at 1024x1024
2. Use Ultimate SD Upscale node to 4K
3. Apply light denoising (0.3-0.4) during upscale

Advanced: Face Enhancement
For portrait work, add these models:

CodeFormer (face restoration):
• Download: https://huggingface.co/sczhou/CodeFormer/blob/main/codeformer.pth
• Place in: ComfyUI\models\facerestore_models\
GFPGAN (alternative face enhancer):
• Download: https://github.com/TencentARC/GFPGAN/releases
• Place in: ComfyUI\models\facerestore_models\
Use in workflows via "FaceDetailer" nodes (Impact Pack).

Troubleshooting
ComfyUI Won't Start
• Verify NVIDIA driver is latest version
• Try run_cpu.bat to check if it's GPU-specific
• Check Windows Firewall isn't blocking port 8188
• Run run_nvidia_gpu.bat as Administrator
Models Not Appearing in Dropdowns
• Confirm files are .safetensors or .pth format
• Check exact folder path matches workflow expectations
• Click "Refresh" in model selector
• Restart ComfyUI completely
Slow Generation (>60 seconds)
• Confirm GPU is actually being used (check Task Manager → Performance → GPU)
• Your system might be using CPU fallback - check console logs
• Reduce resolution or steps
• Close Chrome/Firefox (they use GPU memory)
"Connection Refused" in Browser
• ComfyUI process might have crashed - check console for errors
• Try different browser
• Check if another app is using port 8188

File Organization Reference

ComfyUI/
├── models/
│ ├── checkpoints/

(Flux, SDXL models)

│ ├── controlnet/

(ControlNet models)

│ ├── upscale_models/

(ESRGAN, Real-ESRGAN)

│ ├── facerestore_models/ (CodeFormer, GFPGAN)
│ ├── loras/

(LoRA fine-tunes)

│ └── clip/

(CLIP models if needed)

├── custom_nodes/
└── output/

(Plugins, Manager)
(Generated images)

Essential Bookmarks
• ComfyUI Releases: https://github.com/comfyanonymous/ComfyUI/releases
• Flux FP8 Models: https://huggingface.co/Kijai/flux-fp8
• OpenArt Workflows: https://openart.ai/workflows
• CivitAI Models: https://civitai.com/models
• ComfyUI Wiki: https://github.com/comfyanonymous/ComfyUI/wiki

Quick Start Checklist
NVIDIA driver installed and GPU detected
ComfyUI portable downloaded and extracted
Flux FP8 model in checkpoints folder
ComfyUI Manager installed
Impact Pack installed
Test workflow runs successfully
ControlNet models downloaded (optional but recommended)
Upscaler model downloaded for 4K outputs

Performance Expectations (RTX 3060 12GB)
Task

Resolution

Time

Text-to-Image

1024x1024

12-18s

Inpainting

1024x1024

15-25s

Background Replace

1024x1024

15-30s

Photo Restoration

Variable

20-40s

Upscale to 4K

Post-process

5-10s

Legal & Ethical Notes

• Respect copyright - don't manipulate images you don't own
• Don't create deepfakes or misleading content
• Don't generate images impersonating real people without consent
• Be transparent when sharing AI-edited images
• Follow platform guidelines for AI-generated content

Next Steps
1. Run the test workflow - Verify everything works
2. Experiment with prompts - Learn what produces best results
3. Try the restoration workflow - Great for family photos
4. Join communities:
• r/StableDiffusion
• r/comfyui
• ComfyUI Discord
Need help? Check the ComfyUI GitHub Issues or ask in the Discord community.

Last Updated: November 2025

