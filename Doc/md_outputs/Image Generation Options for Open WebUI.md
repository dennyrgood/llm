# Image Generation Options for Open WebUI


_Source: Image Generation Options for Open WebUI.pdf_



---



## Page 1


**Image Generation Options for Open WebUI**

**Important Clari ﬁcation: Vision vs Generation**

**Ollama models fall into TWO categories:**

1\. **Vision Models (like LLaVA)** \- Can **analyze/describe** images, but **CANNOT generate** new images

2\. **True Image Generation** \- Requires separate tools like Stable Diffusion

**Option 1: Vision Models (Image Analysis Only)**

❌

❌**Not Image Generation**

**What They Do**

Vision models like LLaVA can analyze images, answer questions about them, and describe what they see, but

they **cannot create new images from text prompts**.

**Available Vision Models via Ollama**

**Capabilities**

• Describe images

• Answer questions about images

• Extract text from images (OCR)

• Analyze charts and diagrams

• Compare multiple images

**Limitations**

• **Cannot generate new images**

• **Cannot create art from descriptions**

• Only works with existing images you provide

**Option 2: Stable Diffusion Integration**

✅

✅**True Image Generation**

This is what you need for actual image generation (creating new images from text prompts).

**Overview**

Open WebUI can connect to Stable Diffusion WebUI to enable true image generation capabilities. You'll run

two separate systems:

1\. **Ollama** \- For text/chat (what you already have)

2\. **Stable Diffusion WebUI** \- For image generation

**Architecture**

cmd

# Install vision models for image analysis

# Install vision models for image analysis

ollama pull llava

ollama pull llava

ollama pull llava:13b

ollama pull llava:13b

ollama pull llava:34b

ollama pull llava:34b


---



## Page 2


**Setting Up Stable Diffusion for Image Generation**

**Hardware Requirements**

**GPU VRAM**

**Capability**

4-6 GB

Basic generation, lower resolutions

8 GB

Good quality, standard resolutions

12-16 GB

High quality, large images

24+ GB

Professional quality, multiple ControlNets

**Step 1: Install AUTOMATIC1111 Stable Diffusion WebUI**

**Prerequisites:**

• Python 3.10.6 (important: newer versions may not work with torch)

• Git

• 10+ GB free disk space for models

**Installation on Windows:**

1\. Install Python 3.10.6 from python.org

•

✅ Check "Add Python to PATH"

2\. Install Git from git-scm.com

3\. Clone the repository:

4\. **Start with API enabled:**

The \--api ﬂag is **critical** for Open WebUI integration. The \--listen ﬂag allows access from other devices on

your network.

**Step 2: Download Models**

Models are stored in: stable-diffusion-webui\models\Stable-diffusion\

**Recommended Starting Models:**

**For Realistic Images:**

Open WebUI (chat interface)

Open WebUI (chat interface)

↓

↓

Ollama (text generation)

Ollama (text generation)

AND

AND

↓

↓

Stable Diffusion WebUI (image generation)

Stable Diffusion WebUI (image generation)

cmd

cd D:\AI

cd D:\AI

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

cd stable-diffusion-webui

cd stable-diffusion-webui

cmd

webui-user.bat --api --listen

webui-user.bat --api --listen


---



## Page 3


• Stable Diffusion v1.5 (4GB) - Good all-around model

• Stable Diffusion XL (7GB) - Higher quality, needs more VRAM

**For Anime/Illustration:**

• Anything V5 (2GB) - Popular anime model

• DreamShaper (2GB) - Versatile artistic model

**Download from:**

• Hugging Face

• Civitai (requires free account)

Place .safetensors or .ckpt ﬁles in the models folder.

**Step 3: Connect Open WebUI to Stable Diffusion**

**In Open WebUI:**

1\. Click your proﬁle icon -> **Admin Panel**

2\. Navigate to **Settings****->****Images**

3\. Conﬁgure:

• **Image Generation Engine:** Automatic1111

• **Automatic1111 Base URL:** http://localhost:7860

• **Enable Image Generation:**

✅ ON

• **Default Model:** Select your downloaded model

• **Image Size:** 512x512 (adjust based on your GPU)

4\. Click the **reload button**

🔁

5\. Click **Save**

**Step 4: Generate Images**

**In Open WebUI chat:**

1\. Type a message like: "Generate an image of a cyberpunk city at night"

2\. Your Ollama model will create a detailed prompt

3\. Click the **image generation button** (appears below the response)

4\. Stable Diffusion generates the image

5\. Image appears in the chat

**Alternative: Stable Diffusion WebUI Forge**

Forge is an optimized fork of Stable Diffusion WebUI that offers 30-75% faster generation speeds depending on

your GPU.

**Bene ﬁts over standard WebUI:**


---



## Page 4


• 30-45% faster on 8GB VRAM GPUs

• 60-75% faster on 6GB VRAM GPUs

• Lower memory usage (700MB-1.5GB reduction)

• 2-3x higher maximum resolution

• Additional samplers

**Installation:**

Connect to Open WebUI the same way (port 7860).

**Alternative: ComfyUI**

ComfyUI is a node-based interface for Stable Diffusion - more complex but more powerful.

**Best for:**

• Advanced users

• Complex workﬂows

• Maximum control over generation process

• Custom pipelines

**Not recommended for beginners** \- start with AUTOMATIC1111 ﬁrst.

**Image Generation Work ﬂow in Open WebUI**

**Method 1: Direct Prompt**

**Method 2: Prompt Enhancement Model**

You can use a dedicated prompt-generation model:

Then in Open WebUI:

cmd

cd D:\AI

cd D:\AI

git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git

git clone https://github.com/lllyasviel/stable-diffusion-webui-forge.git

cd stable-diffusion-webui-forge

cd stable-diffusion-webui-forge

# Run with API enabled

# Run with API enabled

webui-user.bat --api --listen

webui-user.bat --api --listen

User: "Create an image of a sunset over mountains"

User: "Create an image of a sunset over mountains"

Ollama: Generates detailed Stable Diffusion prompt

Ollama: Generates detailed Stable Diffusion prompt

User: Clicks image generation button

User: Clicks image generation button

Result: Image generated by Stable Diffusion

Result: Image generated by Stable Diffusion

cmd

# Install prompt generator model

# Install prompt generator model

ollama pull brxce/stable-diffusion-prompt-generator

ollama pull brxce/stable-diffusion-prompt-generator


---



## Page 5


**Recommended Models by Use Case**

**Photorealistic Images**

• **Stable Diffusion v1.5** \- General purpose

• **Realistic Vision** \- Enhanced realism

• **DreamShaper** \- Versatile, good quality

**Artistic/Illustration**

• **Anything V5** \- Anime style

• **Deliberate** \- Artistic ﬂexibility

• **AbyssOrangeMix** \- Anime/semi-realistic

**Fast Generation**

• **Stable Diffusion Turbo** \- 1-step generation

• **LCM (Latent Consistency Models)** \- 2-4 steps

**Professional Quality**

• **Stable Diffusion XL** \- High resolution

• **Stable Diffusion 3.5** \- Latest, best quality (requires 12GB+ VRAM)

• **Flux.1-Dev** \- Cutting edge (requires 24GB+ VRAM)

**Performance Optimization Tips**

**For Lower-End GPUs (4-8GB VRAM)**

1\. **Use smaller models** (SD 1.5 instead of SDXL)

2\. **Lower resolution** (512x512 instead of 1024x1024)

3\. **Enable optimizations** in WebUI settings:

• \--medvram or \--lowvram ﬂags

• \--xformers for memory efﬁciency

4\. **Use Forge** instead of standard WebUI

5\. **Generate one image at a time**

**For High-End GPUs (12GB+ VRAM)**

User: "I want a picture of a robot"

User: "I want a picture of a robot"

Prompt Generator Model: "A highly detailed, photorealistic robot with gleaming chrome finish, 

Prompt Generator Model: "A highly detailed, photorealistic robot with gleaming chrome finish, 

standing in a futuristic laboratory, dramatic lighting, 8k quality, trending on artstation"

standing in a futuristic laboratory, dramatic lighting, 8k quality, trending on artstation"

User: Clicks image generation

User: Clicks image generation

Result: Much better image due to optimized prompt

Result: Much better image due to optimized prompt


---



## Page 6


1\. **Use SDXL or SD 3.5** for best quality

2\. **Higher resolutions** (1024x1024+)

3\. **Batch generation** (multiple images at once)

4\. **Add ControlNet** for precise control

5\. **Use LoRA models** for style customization

**Adding to Cloud ﬂare Tunnel (Optional)**

If you want to access Stable Diffusion remotely:

**Add to****config.yml****:**

**Add DNS record in Cloud ﬂare:**

• Type: CNAME

• Name: sd

• Target: [your-tunnel-id].cfargotunnel.com

⚠

⚠**Security Warning:** Only do this if you trust who has access. Image generation uses signiﬁcant GPU

resources.

**Running as Windows Service**

**Create batch ﬁle:** start-stable-diffusion.bat

**Using NSSM:**

**Comparison: Vision Models vs Image Generation**

yaml

ingress

ingress:

_# ... your existing rules ..._

_# ... your existing rules ..._

\- hostname

hostname: sd.ldmathes.cc

sd.ldmathes.cc

service

service: http

http://localhost

//localhost:7860

7860

\- service

service: http_status

http_status:404

404

batch

@echo

echo off

off

cd

cd D:\AI\stable-diffusion-webui

D:\AI\stable-diffusion-webui

call

call webui-user.bat 

webui-user.bat \--api

\--api \--listen

\--listen \--autolaunch

\--autolaunch

cmd

nssm install StableDiffusion "D:\AI\stable-diffusion-webui\webui-user.bat" "\--api --listen"

nssm install StableDiffusion "D:\AI\stable-diffusion-webui\webui-user.bat" "\--api --listen"

nssm set StableDiffusion AppDirectory "D:\AI\stable-diffusion-webui"

nssm set StableDiffusion AppDirectory "D:\AI\stable-diffusion-webui"

nssm start StableDiffusion

nssm start StableDiffusion


---



## Page 7


**Feature**

**LLaVA (Vision)**

**Stable Diffusion**

Analyze images

✅ Yes

❌ No

Generate images

❌ No

✅ Yes

Describe photos

✅ Yes

❌ No

Create art

❌ No

✅ Yes

Read text in images

✅ Yes

❌ No

GPU requirements

Low

Medium-High

Disk space

~4-20GB

~2-7GB per model

**Complete Setup Summary**

For **full capabilities** (chat + vision + image generation):

1\. 

✅ **Ollama** \- Text generation (already installed)

2\. 

✅ **Open WebUI** \- Interface (already installed)

3\. 

➕ **LLaVA** \- Image analysis (optional)

4\. 

➕ **Stable Diffusion WebUI** \- Image generation

5\. 

➕ **SD Models** \- Download from Hugging Face/Civitai

6\. 

➕ **Con ﬁgure Open WebUI** \- Connect to SD in admin panel

**Recommended Next Steps**

1\. **Start with AUTOMATIC1111** \- Easier to learn

2\. **Download SD 1.5** \- Good starting model (4GB)

3\. **Test locally ﬁrst** \- Before adding to tunnel

4\. **Try different models** \- Find what works for your use case

5\. **Consider Forge** \- If you need better performance

**Resources**

• **AUTOMATIC1111 GitHub:** https://github.com/AUTOMATIC1111/stable-diffusion-webui

• **Forge GitHub:** https://github.com/lllyasviel/stable-diffusion-webui-forge

• **Models:** https://huggingface.co/models?pipeline_tag=text-to-image

• **Models (NSFW Warning):** https://civitai.com/

• **Open WebUI Docs:** https://docs.openwebui.com/tutorial/images

cmd

ollama pull llava

ollama pull llava

cmd

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git

cd stable-diffusion-webui

cd stable-diffusion-webui

webui-user.bat --api --listen

webui-user.bat --api --listen


---



## Page 8


**Common Issues**

**" Out of memory" errors:**

• Reduce image size

• Use \--medvram ﬂag

• Close other GPU applications

• Try smaller model

**Images look bad:**

• Use better prompts (be speciﬁc and detailed)

• Try different models

• Increase steps (20-50 recommended)

• Use negative prompts

**Slow generation:**

• Normal for ﬁrst image (model loading)

• Use Forge for speed boost

• Reduce image size

• Use fewer steps

**Can 't connect from Open WebUI:**

• Verify SD WebUI is running with \--api ﬂag

• Check URL is correct ( http://localhost:7860 )

• Click reload button in Open WebUI settings

• Restart both services