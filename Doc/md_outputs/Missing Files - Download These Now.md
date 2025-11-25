# Missing Files - Download These Now

Extracted from PDF: Missing Files - Download These Now.pdf

---

Missing Files for Your Flux Setup
Download these 3 files to make everything work fast:

File 1: clip_l.safetensors (246 MB)
What it is: Basic CLIP text encoder (required)
Download: https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
Save to:
D:\misc\ComfyUI\ComfyUI\models\clip\clip_l.safetensors

How to download:
1. Click the link above
2. Your browser will start downloading automatically
3. Move the file to the clip folder

File 2: t5xxl_fp8_e4m3fn.safetensors (4.89 GB)
What it is: Advanced T5 text encoder (FP8 optimized for speed)
Download: https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/
t5xxl_fp8_e4m3fn.safetensors
Save to:
D:\misc\ComfyUI\ComfyUI\models\clip\t5xxl_fp8_e4m3fn.safetensors

How to download:
1. Click the link above
2. Wait for 4.89 GB download (takes 5-20 minutes depending on speed)
3. Move to the clip folder
IMPORTANT: Make sure you get t5xxl_fp8_e4m3fn.safetensors NOT t5xxl_fp8_e4m3fn_scaled.safetensors (the
scaled version is slower)

File 3: ae.safetensors (335 MB)
What it is: VAE (image encoder/decoder for Flux)
Download: https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors
Save to:
D:\misc\ComfyUI\ComfyUI\models\vae\ae.safetensors

How to download:

1. Click the link above
2. Browser downloads automatically
3. Move to the vae folder

Final Folder Structure
After downloading, verify your files are here:
D:\misc\ComfyUI\ComfyUI\models\
│
├── checkpoints\
│ └── flux1-dev-fp8.safetensors (11 GB) ✓ You have this
│
├── clip\
│ ├── clip_l.safetensors (246 MB) ← Download this
│ └── t5xxl_fp8_e4m3fn.safetensors (4.89 GB) ← Download this
│
├── controlnet\
│ ├── flux-controlnet-depth.safetensors ✓ You have this
│ └── flux-canny-controlnet-v3.safetensors ✓ You have this
│
└── vae\
└── ae.safetensors (335 MB) ← Download this

Total Downloads: ~5.5 GB
Download time estimate:
• Fast connection (100 Mbps): ~8 minutes
• Medium connection (50 Mbps): ~15 minutes
• Slow connection (25 Mbps): ~30 minutes

After Downloading:
1. Restart ComfyUI (Ctrl+C in console, run run_nvidia_gpu.bat )
2. Load any Flux workflow - they should all work now
3. Generation time should be 15-25 seconds (instead of 267!)

Troubleshooting:
If files don't appear in dropdowns:
• Make sure files are in the EXACT folders shown above
• Restart ComfyUI completely
• Check file sizes match what's listed here
If download fails:

• Right-click the link → "Save link as"
• Or use a download manager
• HuggingFace sometimes requires you to be logged in (free account)

