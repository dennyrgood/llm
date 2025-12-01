### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">What is better. Win11. Ollama server. Machine with single gtx 1080 11 g or a machine with dual 1080 ti 11g gpus</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

A single GTX 1080 (8 GB) is basically end-of-life for serious local LLM use. You’ll be stuck at 7–13B models with good speed and everything bigger will crawl (or won’t fit at all).

---

### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">Rtx 1080 11gig. Not gtx</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

Machine with one GTX 1080 Ti 11 GB

---

### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">Ollama will use both gpus for the model</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

Automatic detection
As soon as you have two (or more) identical NVIDIA GPUs visible in nvidia-smi, Ollama will automatically split the model layers across both cards when you use the normal command:textCopyollama run llama3.1:70bortextCopyollama run qwen2.5:72b

---

### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">Single is really dual rtx 3060 12 gig</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

~50–80 % faster on the same 70B models (real measured difference)

---

### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">It is called a dual. I only have one of them. 3060</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

For 99 % of what people actually run daily (7B–72B models, including Llama 3.1/3.3 70B, Qwen2.5 72B, Gemma-2 27B, Command-R+, all vision models, etc.) → your single RTX 3060 12 GB is plenty fast and actually feels snappier than dual 1080 Ti in many cases because of the much newer architecture.

---

### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">So with those two machines. I want ollama services and ComfyUI/ flux models. Suggestions</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

Ollama: Your 3060 crushes small/medium models (7-34B at 20-60 t/s), but 70B+ crawls without 32GB+ system RAM offload. Dual 1080 Ti unlocks full-speed 70-120B (e.g., DeepSeek-R1 70B at 30+ t/s), but it's overkill unless you're serving multiple users via Ollama API.

---

### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">I have both machines. Flux thrashes on the 3060. Once clip etc are loaded into gpu, even using an fp8 flux</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

Root Cause: FP8 UNet fits (~8-9GB), but CLIP/T5 (~2-3GB combined) + VAE (~0.5GB) + overhead (attention, samplers) exceed 12GB. PyTorch doesn't always free VRAM post-load, forcing swaps to your SATA SSD (remember those slow loads we talked about? This amplifies it). Win11 exacerbates with background tasks.

---

### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">Can I layer my openwebui on top the ComfyUI</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

Pick the machine that will host Ollama 24/7
→ Your RTX 3060 12GB machine is perfect (lower power, quieter, already fast enough for 7–70B models).

---

### Grok AI

<div class="relative"><div class="relative response-content-markdown markdown [&amp;_a:not(.not-prose)]:text-current [&amp;_a:not(.not-prose):hover]:text-primary [&amp;_a:not(.not-prose):hover]:decoration-primary [&amp;_a:not(.not-prose)]:underline [&amp;_a:not(.not-prose)]:decoration-primary/30 [&amp;_a:not(.not-prose)]:underline-offset-2 [&amp;_h2:not(.not-prose):first-child]:mt-0 [&amp;_h3:not(.not-prose):first-child]:mt-0 [&amp;_h4:not(.not-prose):first-child]:mt-0"><p dir="auto" class="break-words" style="white-space: pre-wrap;">I want a cleaner front end to ComfyUI, from open webui</p></div><section class="inline-media-container flex flex-col gap-1 clear-both"></section><section class="auth-notification flex flex-col gap-1"></section></div>

---

### User

Simplicity: Chat-style prompts → instant image gen. No wires, no manual node tweaks.

---

### Grok AI

Simplicity: Chat-style prompts → instant image gen. No wires, no manual node tweaks.

---

### Grok AI

Simplicity: Chat-style prompts → instant image gen. No wires, no manual node tweaks.

