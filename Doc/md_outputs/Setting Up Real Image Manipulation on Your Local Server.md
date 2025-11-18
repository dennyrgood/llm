# Setting Up Real Image Manipulation on Your Local Server


_Source: Setting Up Real Image Manipulation on Your Local Server.pdf_



---



## Page 1


**Setting Up Real Image Manipulation on Your Local Server**

**Overview**

This guide will help you set up **state-of-the-art image manipulation** capabilities on your Windows 11 machine

with the new RTX 3060 12GB. You'll be able to:

• Generate photorealistic images from text prompts

• Remove/replace backgrounds with nano-precision

• Restore and colorize old black & white photos

• Fill in missing parts of images (limbs, faces, torn sections)

• Remove people/objects cleanly with perfect edges

• Inpaint and outpaint with professional quality

**Technology Stack:**

• ComfyUI (node-based workﬂow system)

• Flux.1-dev FP8 (2025's best image generation model)

• ControlNet suite (precise control over generation)

• Your RTX 3060 12GB (perfect for these models)

**Time to Setup:** 30-45 minutes

**Disk Space Required:** ~20-30 GB

**Prerequisites**

**Before Your GPU Arrives**

•

✅ Windows 11 machine (you have this)

•

✅ Open WebUI already installed (you have this)

•

✅ Ollama running (you have this)

•

⏳ RTX 3060 12GB (arriving in a few days)

**After GPU Installation**

1\. **Install latest NVIDIA drivers**

• Download from: https://www.nvidia.com/download/index.aspx

• Select: GeForce RTX 30 Series -> RTX 3060 -> Windows 11

• Install and restart

2\. **Verify GPU is detected**

You should see your RTX 3060 with 12GB VRAM listed.

cmd

nvidia-smi

nvidia-smi


---



## Page 2


**Step 1: Install ComfyUI (Portable Version)**

**Why ComfyUI?**

As of November 2025, ComfyUI has become the preferred platform over AUTOMATIC1111 because:

• Better performance on modern GPUs

• Native Flux model support

• More powerful workﬂow system

• Better for complex image manipulation tasks

**Installation Steps**

1\. **Download ComfyUI Portable**

• Go to: https://github.com/comfyanonymous/ComfyUI/releases

• Download: ComfyUI_windows_portable_nvidia_cu118_or_cpu.7z

• Size: ~2-3 GB

2\. **Extract to permanent location**

3\. **First Run**

The batch ﬁle will:

• Auto-detect your RTX 3060

• Install required dependencies

• Start ComfyUI server on http://localhost:8188

4\. **Verify Installation**

• Open browser to http://localhost:8188

• You should see the ComfyUI interface with node workﬂow

**Step 2: Download Essential Models**

**Directory Structure**

ComfyUI models go in speciﬁc folders:

cmd

# Create AI directory

# Create AI directory

mkdir D:\AI

mkdir D:\AI

cd D:\AI

cd D:\AI

# Extract the 7z file here (use 7-Zip or WinRAR)

# Extract the 7z file here (use 7-Zip or WinRAR)

# You should have: D:\AI\ComfyUI_windows_portable\

# You should have: D:\AI\ComfyUI_windows_portable\

cmd

cd D:\AI\ComfyUI_windows_portable

cd D:\AI\ComfyUI_windows_portable

run_nvidia_gpu.bat

run_nvidia_gpu.bat


---



## Page 3


**Model 1: Flux.1-dev FP8 (Main Model) - REQUIRED**

**Why FP8 version?**

• Optimized for 12GB VRAM

• 8GB model size (vs 24GB for full precision)

• Same quality as full model

• Faster generation

**Download:**

• URL: https://huggingface.co/Kijai/ﬂux-fp8/blob/main/ﬂux1-dev-fp8.safetensors

• Size: ~8 GB

• Save to: D:\AI\ComfyUI_windows_portable\models\checkpoints\

**Model 2: Flux ControlNet Models - REQUIRED**

ControlNet gives you precise control over image generation (depth, edges, poses).

**Download these two:**

1\. **ControlNet Depth** (understands 3D structure)

• URL: https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Depth

• Files needed:

• diffusion_pytorch_model.safetensors (2.5 GB)

• Save to: D:\AI\ComfyUI_windows_portable\models\controlnet\

2\. **ControlNet Canny** (edge detection)

• URL: https://huggingface.co/Shakker-Labs/FLUX.1-dev-ControlNet-Canny

• Files needed:

• diffusion_pytorch_model.safetensors (2.5 GB)

• Save to: D:\AI\ComfyUI_windows_portable\models\controlnet\

**Model 3: Upscaler Models - RECOMMENDED**

For 4K/8K output from your generated images.

**Real-ESRGAN (Best for photos)**

• URL: https://github.com/xinntao/Real-ESRGAN/releases

• Download: RealESRGAN_x4plus.pth (64 MB)

• Save to: D:\AI\ComfyUI_windows_portable\models�pscale_models\

**Ultimate SD Upscale**

D:\AI\ComfyUI_windows_portable\

D:\AI\ComfyUI_windows_portable\

├── models\

├── models\

│ ├── checkpoints\ (main models go here)

│ ├── checkpoints\ (main models go here)

│ ├── controlnet\ (ControlNet models)

│ ├── controlnet\ (ControlNet models)

│├── upscale_models\ (upscalers)

│ ├── upscale_models\ (upscalers)

│ ├── vae\ (VAE models)

│ ├── vae\ (VAE models)

│ └── clip\ (CLIP models)

│ └── clip\ (CLIP models)


---



## Page 4


• URL: https://huggingface.co/uwg/upscaler/tree/main

• Download: ESRGAN_SRx4_DF2KOST_official-ff704c30.pth

• Save to: D:\AI\ComfyUI_windows_portable\models�pscale_models\

**Model 4: Face Restoration Models - For Photo Restoration**

**CodeFormer** (Best for old photos)

• URL: https://github.com/sczhou/CodeFormer/releases

• Download: codeformer.pth

• Save to: D:\AI\ComfyUI_windows_portable\models\facerestore_models\

**GFPGAN** (Backup face restoration)

• URL: https://github.com/TencentARC/GFPGAN/releases

• Download: GFPGANv1.4.pth

• Save to: D:\AI\ComfyUI_windows_portable\models\facerestore_models\

**Step 3: Install ComfyUI Manager (Essential)**

ComfyUI Manager makes installing custom nodes and workﬂows incredibly easy.

**Installation**

1\. **Stop ComfyUI** (if running)

2\. **Clone Manager**

3\. **Restart ComfyUI**

4\. **Verify Installation**

• Go to http://localhost:8188

• You should see a **Manager** button in the interface

**Step 4: Install Essential Custom Nodes**

These nodes add critical functionality for image manipulation.

**Via ComfyUI Manager (Easiest)**

1\. Click **Manager** button in ComfyUI interface

2\. Click **Install Custom Nodes**

3\. Search and install these essential packs:

cmd

cd D:\AI\ComfyUI_windows_portable\custom_nodes

cd D:\AI\ComfyUI_windows_portable\custom_nodes

git clone https://github.com/ltdrdata/ComfyUI-Manager.git

git clone https://github.com/ltdrdata/ComfyUI-Manager.git

cmd

cd D:\AI\ComfyUI_windows_portable

cd D:\AI\ComfyUI_windows_portable

run_nvidia_gpu.bat

run_nvidia_gpu.bat


---



## Page 5


**REQUIRED:**

•

✅ **ComfyUI_Impact_Pack** \- Advanced image manipulation

•

✅ **ComfyUI_Segment_Anything** \- Auto-masking for object removal

•

✅ **ComfyUI_ControlNet_Aux** \- ControlNet preprocessors

•

✅ **ComfyUI_IPAdapter_Plus** \- Advanced image prompting

**RECOMMENDED:**

•

✅ **ComfyUI_FaceDetailer** \- Face enhancement

•

✅ **ComfyUI_Essentials** \- Useful utility nodes

•

✅ **rgthree-comfy** \- Quality of life improvements

4\. **Restart ComfyUI** after installing nodes

**Step 5: Download Ready-Made Work ﬂows**

Workﬂows are pre-built node graphs for speciﬁc tasks. Think of them as "recipes" for different image

manipulation tasks.

**Where to Get Work ﬂows**

**Primary Source:** OpenArt.ai

• URL: https://openart.ai/workﬂows

• Filter by: ComfyUI + Flux.1-dev

**Secondary Source:** CivitAI

• URL: https://civitai.com/models?modelType=Workﬂow

• Filter by: ComfyUI workﬂows

**Essential Work ﬂows to Download**


---



## Page 6


1\. **Background Removal & Replacement**

• Search: "Flux realistic background replace"

• Direct: https://openart.ai/workﬂows/ﬂux-realistic-background-replace

• Download the .json ﬁle

• Drag into ComfyUI interface to load

2\. **Old Photo Restoration & Colorization**

• Search: "Flux old photo restoration colorization"

• Direct: https://openart.ai/workﬂows/ﬂux-old-photo-restoration-colorization

• This workﬂow does:

• Auto face detection and enhancement

• Scratch/tear removal

• Realistic colorization

• Missing limb/face reconstruction

• 4K upscaling

3\. **Object Removal (People, Things)**

• Search: "Flux inpainting removal"

• Allows you to brush over anything and remove it cleanly

4\. **Text-to-Image Generation**

• Search: "Flux.1-dev basic workﬂow"

• Simple prompt -> image generation

**How to Use Work ﬂows**

1\. **Load work ﬂow:** Drag .json ﬁle onto ComfyUI canvas

2\. **Connect your models:** Check that paths point to your downloaded models

3\. **Input your image:** Load image in the input node

4\. **Adjust settings:** Modify prompts, strength, steps as needed

5\. **Queue Prompt:** Click "Queue Prompt" to generate

**Step 6: Integrate ComfyUI with Open WebUI**

Now connect your ComfyUI setup to Open WebUI for seamless image generation from chat.

**Con ﬁgure ComfyUI for API Access**

ComfyUI already has API enabled by default on port 8188.

**Con ﬁgure Open WebUI**


---



## Page 7


1\. **Access Open WebUI Admin Panel**

• Go to: https://chat.ldmathes.cc

• Click proﬁle icon -> **Admin Panel**

2\. **Navigate to Image Settings**

• Settings -> **Images**

3\. **Con ﬁgure ComfyUI Integration**

• **Image Generation Engine:** Select ComfyUI

• **ComfyUI Base URL:** http://localhost:8188

• **Enable Image Generation:**

✅ ON

• **Default Work ﬂow:** Select your preferred workﬂow

• **Image Size:** 1024x1024 (adjust based on preference)

• **Steps:** 20-30 (balance speed vs quality)

4\. **Test Connection**

• Click the **Test Connection** button

• Should show: "Connected successfully"

5\. **Save Settings**

**Using Image Generation in Chat**

**Method 1: Direct Generation**

**Method 2: With Ollama Enhancement**

**Step 7: Set Up as Windows Service (Auto-Start)**

**Create Startup Batch File**

**File:** D:\AI\start-comfyui.bat

**Using NSSM (Recommended)**

User: "Generate an image of a futuristic city at sunset"

User: "Generate an image of a futuristic city at sunset"

Open WebUI: Uses Flux to create the image

Open WebUI: Uses Flux to create the image

User: "I want a picture of a robot in a lab"

User: "I want a picture of a robot in a lab"

Ollama: Creates detailed prompt

Ollama: Creates detailed prompt

User: Clicks image generation button

User: Clicks image generation button

Flux: Generates high-quality image

Flux: Generates high-quality image

batch

@echo

echo off

off

cd

cd D:\AI\ComfyUI_windows_portable

D:\AI\ComfyUI_windows_portable

start

start run_nvidia_gpu.bat

run_nvidia_gpu.bat


---



## Page 8


**Verify Service**

**Step 8: Optional - Add to Cloud ﬂare Tunnel**

If you want remote access to ComfyUI interface:

**Update Cloud ﬂare Conﬁg**

**Edit:** C:�sers\DrDen\\.cloudflared\config.yml

**Add DNS Record in Cloud ﬂare**

• **Type:** CNAME

• **Name:** comfy

• **Target:** c2febf30-92a0-4b30-ae52-d79b7e8884f5.cfargotunnel.com

• **Proxy:** ON (orange cloud)

**Restart Tunnel**

cmd

# Open Command Prompt as Administrator

# Open Command Prompt as Administrator

d:\Misc\nssm.exe install ComfyUI "D:\AI\ComfyUI_windows_portable\run_nvidia_gpu.bat"

d:\Misc\nssm.exe install ComfyUI "D:\AI\ComfyUI_windows_portable\run_nvidia_gpu.bat"

d:\Misc\nssm.exe set ComfyUI AppDirectory "D:\AI\ComfyUI_windows_portable"

d:\Misc\nssm.exe set ComfyUI AppDirectory "D:\AI\ComfyUI_windows_portable"

d:\Misc\nssm.exe set ComfyUI AppStdout "D:\AI\comfyui-stdout.log"

d:\Misc\nssm.exe set ComfyUI AppStdout "D:\AI\comfyui-stdout.log"

d:\Misc\nssm.exe set ComfyUI AppStderr "D:\AI\comfyui-stderr.log"

d:\Misc\nssm.exe set ComfyUI AppStderr "D:\AI\comfyui-stderr.log"

d:\Misc\nssm.exe start ComfyUI

d:\Misc\nssm.exe start ComfyUI

cmd

d:\Misc\nssm.exe status ComfyUI

d:\Misc\nssm.exe status ComfyUI

# Should show: SERVICE_RUNNING

# Should show: SERVICE_RUNNING

yaml

tunnel

tunnel: c2febf30

c2febf30-92a0

92a0-4b30

4b30-ae52

ae52-d79b7e8884f5

d79b7e8884f5

credentials-file

credentials-file: C

C:�sers\DrDen\\.cloudflared\c2febf30

�sers\DrDen\\.cloudflared\c2febf30-92a0

92a0-4b30

4b30-ae52

ae52-d79b7e8884f5.json

d79b7e8884f5.json

protocol

protocol: http2 

http2 

ingress

ingress:

\- hostname

hostname: weatherproxy.ldmathes.cc 

weatherproxy.ldmathes.cc 

service

service: http

http://localhost

//localhost:5005

5005

\- hostname

hostname: api.ldmathes.cc

api.ldmathes.cc

service

service: http

http://localhost

//localhost:5000

5000

\- hostname

hostname: api

api-edit.ldmathes.cc

edit.ldmathes.cc

service

service: http

http://localhost

//localhost:5001

5001

\- hostname

hostname: ollama.ldmathes.cc

ollama.ldmathes.cc

service

service: http

http://localhost

//localhost:11434

11434

originRequest

originRequest:

httpHostHeader

httpHostHeader: "localhost:11434"

"localhost:11434"

\- hostname

hostname: chat.ldmathes.cc

chat.ldmathes.cc

service

service: http

http://localhost

//localhost:8080

8080

\- hostname

hostname: comfy.ldmathes.cc

comfy.ldmathes.cc

service

service: http

http://localhost

//localhost:8188

8188

\- service

service: http_status

http_status:404

404


---



## Page 9


⚠

⚠**Security Note:** ComfyUI has no built-in authentication. Only expose if you trust who has access, or add

Cloudﬂare Access protection.

**Usage Examples**

**Example 1: Remove Person from Photo**

1\. **Load Work ﬂow:** "Object Removal" workﬂow

2\. **Upload Image:** Your photo with person to remove

3\. **Mask Person:** Use brush tool to paint over person

4\. **Prompt:** "empty scene, no people, photorealistic"

5\. **Generate:** 15-20 seconds on RTX 3060

6\. **Result:** Person cleanly removed with perfect background ﬁll

**Example 2: Replace Background**

1\. **Load Work ﬂow:** "Background Replace" workﬂow

2\. **Upload Image:** Your subject photo

3\. **Mask Background:** Auto-mask with Segment Anything, or manual

4\. **New Background Prompt:** "tropical beach at sunset, golden hour, photorealistic, 8k"

5\. **Generate:** 15-30 seconds

6\. **Result:** Subject perfectly composited onto new background with matching lighting

**Example 3: Restore Old Photo**

1\. **Load Work ﬂow:** "Old Photo Restoration" workﬂow

2\. **Upload Image:** Damaged B&W photo from 1920s

3\. **Settings:** Auto-detect faces, ﬁll missing areas, colorize

4\. **Generate:** 30-60 seconds

5\. **Result:**

• Scratches removed

• Tears ﬁlled in

• Faces enhanced

• Realistically colorized

• Upscaled to 4K

**Example 4: Generate from Scratch**

cmd

net stop cloudflared

net stop cloudflared

net start cloudflared

net start cloudflared


---



## Page 10


1\. **Load Work ﬂow:** "Text-to-Image" workﬂow

2\. **Prompt:** "A serene Japanese garden with cherry blossoms, koi pond, traditional tea house, soft morning

light, photorealistic, 8k detail"

3\. **Negative Prompt:** "blurry, distorted, low quality, cartoon"

4\. **Steps:** 25-30

5\. **CFG Scale:** 7.0

6\. **Generate:** 20-40 seconds

7\. **Result:** Photorealistic image matching description

**Performance Expectations (RTX 3060 12GB)**

**Generation Times**

**Task**

**Resolution**

**Time**

**VRAM Usage**

Text-to-Image

1024x1024

20-40s

10-11GB

Background Replace

1024x1024

15-30s

10-11GB

Object Removal

1024x1024

15-25s

9-10GB

Photo Restoration

Original size

30-60s

8-10GB

4K Upscale

4096x4096

20-40s

11-12GB

**Quality Settings Impact**

**Setting**

**Speed**

**Quality**

**VRAM**

Steps: 15-20

Fast

Good

Lower

Steps: 25-30

Medium

Great

Medium

Steps: 40-50

Slow

Excellent

Higher

**Recommended:** 25-30 steps for best balance

**Troubleshooting**

**Issue: Out of Memory Error**

**Solution:**

1\. Close other GPU applications

2\. Reduce image resolution (try 768x768 instead of 1024x1024)

3\. Lower batch size to 1

4\. Restart ComfyUI

**Issue: Models Not Loading**

**Solution:**

1\. Verify model ﬁles are in correct folders

2\. Check ﬁle names match exactly (case-sensitive)

3\. Restart ComfyUI

4\. Check comfyui-stderr.log for speciﬁc errors

**Issue: Slow Generation**


---



## Page 11


**Solution:**

1\. First generation is always slow (model loading)

2\. Subsequent generations are faster

3\. Reduce steps (try 20 instead of 30)

4\. Use smaller resolution for testing

5\. Make sure NVIDIA drivers are updated

**Issue: Poor Quality Results**

**Solution:**

1\. Use more detailed prompts

2\. Increase steps (25-30)

3\. Use negative prompts to exclude unwanted elements

4\. Try different seeds (randomization)

5\. Adjust CFG scale (7-9 is usually good)

**Issue: Work ﬂow Missing Nodes**

**Solution:**

1\. Open ComfyUI Manager

2\. Click "Install Missing Nodes"

3\. Restart ComfyUI

4\. Reload workﬂow

**Advanced Features**

**ControlNet Depth (Preserve Structure)**

Use when you want to maintain the exact composition of an image while changing style/content.

**Example:** Convert photo to painting while keeping same poses and layout

**IPAdapter (Image Prompting)**

Use an image as a "style reference" for generation.

**Example:** "Make my image look like this Van Gogh painting"

**Segment Anything (Auto-Masking)**

Automatically detect and mask objects without manual brushing.

**Example:** Click on person -> auto-masks entire person perfectly

**Face Detailer**

Automatically enhances faces in images with better detail, ﬁxing eyes, teeth, skin texture.

**Always use for portraits**

**Comparison: ComfyUI vs Other Tools**


---



## Page 12


**Feature**

**ComfyUI + Flux**

**Photoshop 2025**

**Online AI Tools**

Quality (2025)

★★★★★

★★★★★

★★★☆☆

Speed (local)

20-40s

10-30s

5-15s

Cost

Free

$20/mo

Free tier limited

Privacy

Complete

Cloud sync

No privacy

Customization

Unlimited

Limited

Very limited

Offline use

✅ Yes

❌ No

❌ No

GPU Required

Yes (12GB)

Yes/No

No

**Recommended Learning Path**

**Day 1: Setup & Basics**

1\. Install ComfyUI and models

2\. Run simple text-to-image workﬂow

3\. Generate 10-20 test images

4\. Learn the interface

**Day 2: Image Manipulation**

1\. Try background replacement

2\. Practice object removal

3\. Experiment with inpainting

4\. Test different prompts

**Day 3: Photo Restoration**

1\. Load restoration workﬂow

2\. Restore old family photos

3\. Try colorization

4\. Practice face enhancement

**Week 2: Advanced Techniques**

1\. Create custom workﬂows

2\. Combine multiple techniques

3\. Optimize for your use cases

4\. Fine-tune settings

**Community Resources**

**Learning**

• **ComfyUI Of ﬁcial Wiki:** https://github.com/comfyanonymous/ComfyUI/wiki

• **YouTube Tutorial:** Search "ComfyUI Flux tutorial 2025"

• **Reddit:** r/StableDiffusion and r/comfyui

**Work ﬂows**


---



## Page 13


• **OpenArt:** https://openart.ai/workﬂows

• **CivitAI:** https://civitai.com/models?modelType=Workﬂow

• **ComfyWork ﬂows:** https://comfyworkﬂows.com/

**Models**

• **Hugging Face:** https://huggingface.co/models

• **CivitAI:** https://civitai.com/ (requires login, has NSFW content warning)

**Support**

• **ComfyUI Discord:** https://discord.gg/comfyui

• **GitHub Issues:** https://github.com/comfyanonymous/ComfyUI/issues

**Best Practices**

**Prompt Writing**

• **Be speci ﬁc:** "Golden retriever puppy playing in grass" vs "dog"

• **Add quality terms:** "photorealistic, 8k, highly detailed, professional photography"

• **Use negative prompts:** "blurry, distorted, low quality, artifacts"

• **Describe lighting:** "soft morning light, golden hour, studio lighting"

**Organization**

• **Save good work ﬂows:** Keep a library of your best workﬂows

• **Name outputs clearly:** Use descriptive ﬁlenames

• **Backup regularly:** Copy models and outputs folders

• **Document settings:** Note what settings worked well

**Performance**

• **Warm up GPU:** First generation loads models (slow), then fast

• **Batch similar tasks:** Do all photos at once for efﬁciency

• **Monitor VRAM:** Keep task manager open to watch GPU usage

• **Update regularly:** Check for ComfyUI and model updates

**What You 'll Be Able to Do**

After setup, you'll have professional-grade capabilities:

✅ **Image Generation**

• Create any image from text description

• Photorealistic or artistic styles

• Complete creative control

✅ **Background Manipulation**


---



## Page 14


• Remove backgrounds cleanly

• Replace with anything imaginable

• Perfect edge detection and lighting match

✅ **Object Removal**

• Remove people, objects, watermarks

• Fill in seamlessly

• "Nano-banana precision" level

✅ **Photo Restoration**

• Fix scratches, tears, water damage

• Reconstruct missing parts

• Enhance faces automatically

• Colorize B&W photos realistically

• Upscale to 4K/8K

✅ **Advanced Editing**

• Inpainting (ﬁll in masked areas)

• Outpainting (extend images beyond borders)

• Style transfer

• Face swapping

• Image variations

**All of this:**

• Running locally on your machine

• Completely free (after GPU purchase)

• Unlimited generations

• No subscriptions

• Full privacy

• Professional quality results

**Final Checklist**

Before you start:


---



## Page 15


RTX 3060 12GB installed in PC

Latest NVIDIA drivers installed

nvidia-smi shows GPU correctly

ComfyUI portable downloaded and extracted

Flux.1-dev FP8 model downloaded (~8GB)

ControlNet models downloaded (~5GB)

Upscaler models downloaded (~1GB)

ComfyUI Manager installed

Essential custom nodes installed

At least 3-5 workﬂows downloaded

First test image generated successfully

Integrated with Open WebUI (optional)

Set up as Windows service (optional)

**Conclusion**

Once your RTX 3060 arrives and you complete this setup, you'll have capabilities that rival or exceed

professional paid tools like Photoshop 2025, all running locally with complete privacy and unlimited usage.

**Estimated total setup time:** 30-45 minutes

**Total disk space:** ~20-30 GB

**Cost after GPU:** $0/month

**Quality level:** State-of-the-art (November 2025)

You'll be doing "nano-banana level" edits and restoring century-old photos by the end of your ﬁrst day.

Welcome to the cutting edge of local AI image manipulation! 

🎨

🚀