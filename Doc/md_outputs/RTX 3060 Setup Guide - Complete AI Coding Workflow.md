# RTX 3060 Setup Guide - Complete AI Coding Workflow


_Source: RTX 3060 Setup Guide - Complete AI Coding Workflow.pdf_



---



## Page 1


**RTX 3060 Setup Guide - Complete AI Coding Work ﬂow**

**Your Architecture (Optimal)**

**Phase 1: Hardware Installation & Driver Setup**

**Step 1: Install RTX 3060**

1\. Shut down Windows 11 machine

2\. Install RTX 3060 in PCIe slot

3\. Connect power cables (if required)

4\. Boot up

**Step 2: Install/Update NVIDIA Drivers**

**Step 3: Install CUDA Toolkit (if not present)**

┌────────────────────────┐

┌────────────────────────┐

│ MacBook Air M2 │ <- Light client

│ MacBook Air M2 │ <- Light client

│ \- Continue CLI │ <- Interface

│ \- Continue CLI │ <- Interface

│ \- Your code │ <- Development

│ \- Your code │ <- Development

│ \- NO GPU needed │ <- Just terminal/editor

│ \- NO GPU needed │ <- Just terminal/editor

└────────┬───────────────┘

└────────┬───────────────┘

│

│

│ LAN (fast)

│ LAN (fast)

│

│

┌────────▼───────────────┐

┌────────▼───────────────┐

│ Windows 11 Desktop │ <- Heavy lifting

│ Windows 11 Desktop │ <- Heavy lifting

│ \- Ollama server │ <- AI engine

│ \- Ollama server │ <- AI engine

│ \- RTX 3060 12GB │ <- GPU power

│ \- RTX 3060 12GB │ <- GPU power

│ \- All models │ <- Storage

│ \- All models │ <- Storage

│ \- 128K context │ <- Memory

│ \- 128K context │ <- Memory

└────────────────────────┘

└────────────────────────┘

powershell

_# Download latest drivers from:_

_# Download latest drivers from:_

_# https://www.nvidia.com/Download/index.aspx_

_# https://www.nvidia.com/Download/index.aspx_

_# Search: RTX 3060, Windows 11_

_# Search: RTX 3060, Windows 11_

_# Or use GeForce Experience (recommended)_

_# Or use GeForce Experience (recommended)_

_# https://www.nvidia.com/en-us/geforce/geforce-experience/_

_# https://www.nvidia.com/en-us/geforce/geforce-experience/_

_# After install, verify:_

_# After install, verify:_

nvidia-smi

nvidia-smi

_# Should show RTX 3060 with 12GB VRAM_

_# Should show RTX 3060 with 12GB VRAM_


---



## Page 2


**Phase 2: Clean Up Old Models (Optional)**

**Models to DELETE (free up space):**

**Models to KEEP:**

**Phase 3: Download Essential Models**

**Priority 1: Core Coding Models (Download First)**

**Priority 2: General Chat & Reasoning**

powershell

_# Download from:_

_# Download from:_

_# https://developer.nvidia.com/cuda-downloads_

_# https://developer.nvidia.com/cuda-downloads_

_# Choose: Windows, x86_64, 11, exe (local)_

_# Choose: Windows, x86_64, 11, exe (local)_

_# Verify installation:_

_# Verify installation:_

nvcc 

nvcc \--\--version

version

_# Should show CUDA version 12.x_

_# Should show CUDA version 12.x_

bash

_# On Windows 11 Ollama server:_

_# On Windows 11 Ollama server:_

ollama 

ollama rm

rm tinyllama:latest 

tinyllama:latest _# Too weak_

_# Too weak_

ollama 

ollama rm

rm qwen2.5:1.5b 

qwen2.5:1.5b _# Redundant_

_# Redundant_

ollama 

ollama rm

rm gemma2:2b 

gemma2:2b _# Redundant_

_# Redundant_

ollama 

ollama rm

rm qwen2.5-coder:1.5b 

qwen2.5-coder:1.5b _# Upgrading to 14B_

_# Upgrading to 14B_

ollama 

ollama rm

rm notus:latest 

notus:latest _# Outdated_

_# Outdated_

ollama 

ollama rm

rm alfred:latest 

alfred:latest _# Niche use_

_# Niche use_

ollama 

ollama rm

rm firefunction-v2:latest 

firefunction-v2:latest _# Redundant_

_# Redundant_

ollama 

ollama rm

rm gemma3:1b 

gemma3:1b _# Too small_

_# Too small_

bash

_# Keep these (still useful):_

_# Keep these (still useful):_

phi3:mini 

phi3:mini _# Fast 3.8B for quick queries_

_# Fast 3.8B for quick queries_

gemma3:4b 

gemma3:4b _# Lightweight backup_

_# Lightweight backup_

mistral:latest 

mistral:latest _# Good 7B model_

_# Good 7B model_

llava:13b 

llava:13b _# Vision model (will work now!)_

_# Vision model (will work now!)_

deepseek-r1:latest 

deepseek-r1:latest _# Reasoning (if 8B or 14B)_

_# Reasoning (if 8B or 14B)_

qwen3-coder:latest 

qwen3-coder:latest _# Check size, keep if 14B or less_

_# Check size, keep if 14B or less_

bash

_# BEST: Coding with large context (PRIMARY MODEL)_

_# BEST: Coding with large context (PRIMARY MODEL)_

ollama pull qwen2.5-coder:14b

ollama pull qwen2.5-coder:14b

_# Size: ~9GB, VRAM: ~9GB, Speed: 25-30 tok/s, Context: 32K_

_# Size: ~9GB, VRAM: ~9GB, Speed: 25-30 tok/s, Context: 32K_

_# BEST: Coding with huge context (ALTERNATIVE PRIMARY)_

_# BEST: Coding with huge context (ALTERNATIVE PRIMARY)_

ollama pull deepseek-coder-v2:16b

ollama pull deepseek-coder-v2:16b

_# Size: ~9GB, VRAM: ~10GB, Speed: 20-25 tok/s, Context: 128K_

_# Size: ~9GB, VRAM: ~10GB, Speed: 20-25 tok/s, Context: 128K_

_# BACKUP: Fast coding model_

_# BACKUP: Fast coding model_

ollama pull qwen2.5-coder:7b

ollama pull qwen2.5-coder:7b

_# Size: ~4.7GB, VRAM: ~5GB, Speed: 40-45 tok/s, Context: 32K_

_# Size: ~4.7GB, VRAM: ~5GB, Speed: 40-45 tok/s, Context: 32K_


---



## Page 3


**Priority 3: Specialized (Optional)**

**Phase 4: Con ﬁgure Continue CLI (MacBook Air M2)**

**Location:****~/.continue/config.yaml**

**Complete Optimal Con ﬁguration:**

bash

_# General chat/writing_

_# General chat/writing_

ollama pull qwen2.5:14b

ollama pull qwen2.5:14b

_# Size: ~9GB, VRAM: ~9GB, Speed: 25-30 tok/s, Context: 32K_

_# Size: ~9GB, VRAM: ~9GB, Speed: 25-30 tok/s, Context: 32K_

_# Complex reasoning (upgrade from current)_

_# Complex reasoning (upgrade from current)_

ollama pull deepseek-r1:14b

ollama pull deepseek-r1:14b

_# Size: ~9GB, VRAM: ~9GB, Speed: 20-25 tok/s, Context: 8K_

_# Size: ~9GB, VRAM: ~9GB, Speed: 20-25 tok/s, Context: 8K_

_# Alternative: Excellent reasoning_

_# Alternative: Excellent reasoning_

ollama pull phi4:14b

ollama pull phi4:14b

_# Size: ~9GB, VRAM: ~9GB, Speed: 25-30 tok/s, Context: 16K_

_# Size: ~9GB, VRAM: ~9GB, Speed: 25-30 tok/s, Context: 16K_

bash

_# If you do Python-heavy work_

_# If you do Python-heavy work_

ollama pull codellama:13b-python

ollama pull codellama:13b-python

_# Size: ~7.4GB, VRAM: ~8GB, Speed: 25-30 tok/s_

_# Size: ~7.4GB, VRAM: ~8GB, Speed: 25-30 tok/s_

_# If you want vision capabilities (already have llava:13b)_

_# If you want vision capabilities (already have llava:13b)_

_# But this is better:_

_# But this is better:_

ollama pull llava-llama3:8b

ollama pull llava-llama3:8b

_# Size: ~5.5GB, VRAM: ~6GB, Speed: 30-35 tok/s (faster alternative)_

_# Size: ~5.5GB, VRAM: ~6GB, Speed: 30-35 tok/s (faster alternative)_

_# Large context general model_

_# Large context general model_

ollama pull codestral:22b

ollama pull codestral:22b

_# Size: ~13GB, VRAM: ~11GB, Speed: 15-20 tok/s, Context: 128K_

_# Size: ~13GB, VRAM: ~11GB, Speed: 15-20 tok/s, Context: 128K_

_# NOTE: Might be tight on 12GB VRAM_

_# NOTE: Might be tight on 12GB VRAM_


---



## Page 4


yaml

name

name: My Config (RTX 3060 Optimized)

My Config (RTX 3060 Optimized)

version

version: 1.0.0

1.0.0

schema

schema: v1

v1

models

models:

_# ========================================_

_# ========================================_

_# PRIMARY MODELS (Daily Use)_

_# PRIMARY MODELS (Daily Use)_

_# ========================================_

_# ========================================_

\- name

name: Qwen2.5 Coder 14B (Default)

Qwen2.5 Coder 14B (Default)

provider

provider: ollama

ollama

model

model: "qwen2.5-coder:14b"

"qwen2.5-coder:14b"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 32768

32768

default

default: true

true _#__<-__YOUR DEFAULT MODEL_

_#__<-__YOUR DEFAULT MODEL_

roles

roles:

\- chat

chat

\- edit

edit

capabilities

capabilities:

\- tool_use

tool_use

requestOptions

requestOptions:

timeout

timeout: 300000

300000

keepAlive

keepAlive: 300000

300000

\- name

name: DeepSeek Coder V2 16B (Large Context)

DeepSeek Coder V2 16B (Large Context)

provider

provider: ollama

ollama

model

model: "deepseek-coder-v2:16b"

"deepseek-coder-v2:16b"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 131072

131072 _# 128K tokens!_

_# 128K tokens!_

roles

roles:

\- chat

chat

\- edit

edit

capabilities

capabilities:

\- tool_use

tool_use

requestOptions

requestOptions:

timeout

timeout: 600000

600000 _# Longer for big context_

_# Longer for big context_

keepAlive

keepAlive: 600000

600000

\- name

name: Qwen Fast 7B

Qwen Fast 7B

provider

provider: ollama

ollama

model

model: "qwen2.5-coder:7b"

"qwen2.5-coder:7b"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 32768

32768

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 300000

300000

keepAlive

keepAlive: 300000

300000

_# ========================================_

_# ========================================_

_# AUTOCOMPLETE (Fast, Small)_

_# AUTOCOMPLETE (Fast, Small)_

_# ========================================_

_# ========================================_

\- name

name: Qwen Autocomplete

Qwen Autocomplete

provider

provider: ollama

ollama


---



## Page 5


provider

provider: ollama

ollama

model

model: "qwen2.5-coder:1.5b"

"qwen2.5-coder:1.5b"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 32768

32768

roles

roles:

\- autocomplete

autocomplete

requestOptions

requestOptions:

timeout

timeout: 60000

60000

keepAlive

keepAlive: 60000

60000

_# ========================================_

_# ========================================_

_# REASONING & GENERAL USE_

_# REASONING & GENERAL USE_

_# ========================================_

_# ========================================_

\- name

name: DeepSeek R1 14B (Reasoning)

DeepSeek R1 14B (Reasoning)

provider

provider: ollama

ollama

model

model: "deepseek-r1:14b"

"deepseek-r1:14b"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 8192

8192

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 300000

300000

keepAlive

keepAlive: 300000

300000

\- name

name: Qwen2.5 14B (General Chat)

Qwen2.5 14B (General Chat)

provider

provider: ollama

ollama

model

model: "qwen2.5:14b"

"qwen2.5:14b"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 32768

32768

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 300000

300000

keepAlive

keepAlive: 300000

300000

\- name

name: Phi4 14B (Alternative Reasoning)

Phi4 14B (Alternative Reasoning)

provider

provider: ollama

ollama

model

model: "phi4:14b"

"phi4:14b"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 16384

16384

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 300000

300000

keepAlive

keepAlive: 300000

300000

_# ========================================_

_# ========================================_

_# BACKUP MODELS (Keep but not default)_

_# BACKUP MODELS (Keep but not default)_

_# ========================================_

_# ========================================_

\- name

name: Phi3 Mini (Fast Backup)

Phi3 Mini (Fast Backup)

provider

provider: ollama

ollama

model

model: "phi3:mini"

"phi3:mini"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc


---



## Page 6


**Phase 5: Test Your Setup**

contextLength

contextLength: 131072

131072 _# 128K context_

_# 128K context_

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 300000

300000

keepAlive

keepAlive: 300000

300000

\- name

name: Mistral 7B

Mistral 7B

provider

provider: ollama

ollama

model

model: "mistral:latest"

"mistral:latest"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 32768

32768

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 300000

300000

keepAlive

keepAlive: 300000

300000

\- name

name: LLaVA Vision 13B

LLaVA Vision 13B

provider

provider: ollama

ollama

model

model: "llava:13b"

"llava:13b"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

contextLength

contextLength: 4096

4096

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 300000

300000

keepAlive

keepAlive: 300000

300000

_# ========================================_

_# ========================================_

_# CLOUD MODELS (Emergency Use Only)_

_# CLOUD MODELS (Emergency Use Only)_

_# ========================================_

_# ========================================_

\- name

name: Kimi K2 (Cloud 

Kimi K2 (Cloud \- Limited Quota)

Limited Quota)

provider

provider: ollama

ollama

model

model: "kimi-k2-thinking:cloud"

"kimi-k2-thinking:cloud"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 600000

600000

keepAlive

keepAlive: 600000

600000

\- name

name: DeepSeek V3.1 (Cloud 

DeepSeek V3.1 (Cloud \- Limited Quota)

Limited Quota)

provider

provider: ollama

ollama

model

model: "deepseek-v3.1:671b-cloud"

"deepseek-v3.1:671b-cloud"

apiBase

apiBase: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

baseUrl

baseUrl: https

https://ollama.ldmathes.cc

//ollama.ldmathes.cc

roles

roles:

\- chat

chat

requestOptions

requestOptions:

timeout

timeout: 600000

600000

keepAlive

keepAlive: 600000

600000


---



## Page 7


**Test 1: Verify GPU is being used**

**Test 2: Speed test from MacBook**

**Test 3: Context test**

**Test 4: Model switching**

**Phase 6: Optimal Usage Patterns**

**Daily Coding Work ﬂow**

bash

_# On Windows 11 (during inference):_

_# On Windows 11 (during inference):_

nvidia-smi

nvidia-smi

_# Should show:_

_# Should show:_

_# - GPU utilization: 80-100%_

_# - GPU utilization: 80-100%_

_# - Memory usage: 8-10GB (for 14B models)_

_# - Memory usage: 8-10GB (for 14B models)_

_# - Temperature: 60-75 °C_

_# - Temperature: 60-75 °C_

bash

_# On MacBook Air M2:_

_# On MacBook Air M2:_

cn

cn

> Write a Python 

Write a Python function

function to calculate fibonacci numbers

to calculate fibonacci numbers

_# Observe:_

_# Observe:_

_# - Response should stream quickly (20-30 tokens/sec)_

_# - Response should stream quickly (20-30 tokens/sec)_

_# - Total response time: 3-6 seconds_

_# - Total response time: 3-6 seconds_

_# - Compare to old: 20-40 seconds_

_# - Compare to old: 20-40 seconds_

bash

cn

cn

> @ui_components.py @keystroke_handler.py @browser_controller.py @inject.py @names.json

@ui_components.py @keystroke_handler.py @browser_controller.py @inject.py @names.json

> Analyze this codebase architecture

Analyze this codebase architecture

_# Should complete without timeout_

_# Should complete without timeout_

_# Can follow up with 20+ more questions_

_# Can follow up with 20+ more questions_

bash

cn

cn

> Use DeepSeek Coder V2 16B 

Use DeepSeek Coder V2 16B (Large Context

Large Context) for

for this question:

this question:

> [complex multi-file question

complex multi-file question]

_# Should switch models and respond_

_# Should switch models and respond_


---



## Page 8


**Model Selection Guide**

**Task**

**Model**

**Why**

Daily coding

Qwen2.5 Coder 14B

Best balance

Long conversations

DeepSeek Coder V2 16B

128K context

Quick questions

Qwen Fast 7B

Speed

Complex debugging

DeepSeek R1 14B

Reasoning

General writing

Qwen2.5 14B

Not code-focused

Vision tasks

LLaVA 13B

Image understanding

Emergency/stuck

Cloud models

Save for last resort

**Phase 7: Performance Benchmarks**

**Expected Performance (RTX 3060 12GB)**

**Model**

**VRAM Usage**

**Speed**

**Quality**

**Context**

qwen2.5-coder:14b

9GB

25-30 tok/s

Excellent

32K

deepseek-coder-v2:16b

10GB

20-25 tok/s

Excellent

128K

qwen2.5-coder:7b

5GB

40-45 tok/s

Very Good

32K

deepseek-r1:14b

9GB

20-25 tok/s

Excellent

8K

phi3:mini

3GB

50-60 tok/s

Good

128K

**vs Current Setup (GT 1030 CPU)**

**Metric**

**GT 1030 (CPU)**

**RTX 3060 (GPU)**

**Improvement**

Speed

2-5 tok/s

25-30 tok/s

**10x faster**

Response time

30-60 sec

3-6 sec

**10x faster**

Model quality

1.5-4B

14-16B

**4x larger**

VRAM capacity

1GB (unused)

12GB

**12x more**

Context

32K

128K

**4x larger**

bash

_# Morning: Start with default model_

_# Morning: Start with default model_

cn

cn

> @ui_components.py

@ui_components.py

> Add new feature X

Add new feature X

_# Iterative development (unlimited)_

_# Iterative development (unlimited)_

> That works, now 

That works, now add

add Y

Y

> Refactor this section

Refactor this section

> Add error handling

Add error handling

> Generate tests

Generate tests

_# ... 20+ exchanges, no quota limits_

_# ... 20+ exchanges, no quota limits_

_# Complex architecture question_

_# Complex architecture question_

> Use DeepSeek Coder V2 16B 

Use DeepSeek Coder V2 16B (Large Context

Large Context):

> @all-5-files

@all-5-files

> How should I restructure this?

How should I restructure this?

_# Quick syntax question_

_# Quick syntax question_

> Use Qwen Fast 7B:

Use Qwen Fast 7B:

> What's the Python syntax 

What's the Python syntax for

for X?

X?


---



## Page 9


**Phase 8: Troubleshooting**

**Problem: Models run on CPU instead of GPU**

**Problem: Out of VRAM errors**

**Problem: Slow responses from MacBook**

**Problem: Continue can 't connect**

powershell

_# Check CUDA is working:_

_# Check CUDA is working:_

nvidia-smi

nvidia-smi

_# Restart Ollama:_

_# Restart Ollama:_

_# (In Services or Task Manager, restart Ollama)_

_# (In Services or Task Manager, restart Ollama)_

_# Check Ollama sees GPU:_

_# Check Ollama sees GPU:_

ollama list

ollama list

_# Look for GPU indicator in output_

_# Look for GPU indicator in output_

bash

_# Check current VRAM usage:_

_# Check current VRAM usage:_

nvidia-smi

nvidia-smi

_# Stop other GPU applications_

_# Stop other GPU applications_

_# Use smaller model:_

_# Use smaller model:_

ollama pull qwen2.5-coder:7b

ollama pull qwen2.5-coder:7b

_# Or use quantized version:_

_# Or use quantized version:_

ollama pull qwen2.5-coder:14b-q4

ollama pull qwen2.5-coder:14b-q4

bash

_# Test network latency:_

_# Test network latency:_

ping

ping ollama.ldmathes.cc

ollama.ldmathes.cc

_# Should be < 20ms_

_# Should be < 20ms_

_# If higher, check WiFi/network_

_# If higher, check WiFi/network_

_# Test direct to Windows:_

_# Test direct to Windows:_

curl

curl https://ollama.ldmathes.cc/api/tags

https://ollama.ldmathes.cc/api/tags

_# Should respond quickly_

_# Should respond quickly_

bash

_# On MacBook, verify config:_

_# On MacBook, verify config:_

cat

cat ~/.continue/config.yaml 

~/.continue/config.yaml | grep

grep apiBase

apiBase

_# Should show: https://ollama.ldmathes.cc_

_# Should show: https://ollama.ldmathes.cc_

_# Test from MacBook:_

_# Test from MacBook:_

curl

curl https://ollama.ldmathes.cc/api/tags

https://ollama.ldmathes.cc/api/tags

_# Should return JSON with model list_

_# Should return JSON with model list_


---



## Page 10


**Phase 9: Future Optimizations**

**Option 1: Run Ollama locally on MacBook (Alternative)**

**Option 2: Increase Context Further**

**Option 3: Add More Specialized Models**

bash

_# If you want everything local on M2:_

_# If you want everything local on M2:_

_# (Not recommended - desktop GPU is better)_

_# (Not recommended - desktop GPU is better)_

_# Install Ollama on MacBook:_

_# Install Ollama on MacBook:_

brew 

brew install

install ollama

ollama

_# Download smaller models:_

_# Download smaller models:_

ollama pull qwen2.5-coder:7b

ollama pull qwen2.5-coder:7b

ollama pull phi3:mini

ollama pull phi3:mini

_# Update config.yaml:_

_# Update config.yaml:_

apiBase: http://localhost:11434

apiBase: http://localhost:11434

_# Trade-off:_

_# Trade-off:_

_# + No network dependency_

_# + No network dependency_

_# - Slower (M2 vs RTX 3060)_

_# - Slower (M2 vs RTX 3060)_

_# - Battery drain_

_# - Battery drain_

_# - Thermal throttling_

_# - Thermal throttling_

bash

_# Create custom 256K context model:_

_# Create custom 256K context model:_

_# (Advanced - may reduce quality)_

_# (Advanced - may reduce quality)_

cat

cat > Modelfile.qwen-256k 

Modelfile.qwen-256k <<

<< 'EOF'

'EOF'

FROM qwen2.5-coder:14b

FROM qwen2.5-coder:14b

PARAMETER num_ctx 262144

PARAMETER num_ctx 262144

PARAMETER rope_frequency_scale 0.125

PARAMETER rope_frequency_scale 0.125

PARAMETER rope_frequency_base 1000000

PARAMETER rope_frequency_base 1000000

EOF

EOF

ollama create qwen-coder-256k -f Modelfile.qwen-256k

ollama create qwen-coder-256k -f Modelfile.qwen-256k

_# Add to config.yaml:_

_# Add to config.yaml:_

\- name: Qwen Coder 256K 

\- name: Qwen Coder 256K (Experimental

Experimental)

model: 

model: "qwen-coder-256k"

"qwen-coder-256k"

contextLength: 

contextLength: 262144

262144


---



## Page 11


**Phase 10: Maintenance & Updates**

**Weekly Tasks**

**Monthly Tasks**

**Quick Reference Card**

**Essential Commands (MacBook)**

**Essential Commands (Windows)**

bash

_# If you work with specific languages:_

_# If you work with specific languages:_

ollama pull codellama:13b-python

ollama pull codellama:13b-python

ollama pull starcoder2:15b

ollama pull starcoder2:15b

_# If you need multimodal:_

_# If you need multimodal:_

ollama pull llava-llama3:13b

ollama pull llava-llama3:13b

ollama pull bakllava:latest

ollama pull bakllava:latest

_# If you need larger models (tight fit):_

_# If you need larger models (tight fit):_

ollama pull qwen2.5-coder:32b 

ollama pull qwen2.5-coder:32b _# Will use 11-12GB_

_# Will use 11-12GB_

bash

_# Check for Ollama updates:_

_# Check for Ollama updates:_

_# Download latest from ollama.ai_

_# Download latest from ollama.ai_

_# Update models:_

_# Update models:_

ollama pull qwen2.5-coder:14b

ollama pull qwen2.5-coder:14b

ollama pull deepseek-coder-v2:16b

ollama pull deepseek-coder-v2:16b

_# Clean up old versions:_

_# Clean up old versions:_

ollama list

ollama list

ollama 

ollama rm

rm old-model:old-version

old-model:old-version

bash

_# Check NVIDIA driver updates_

_# Check NVIDIA driver updates_

_# Update CUDA if needed_

_# Update CUDA if needed_

_# Review model usage:_

_# Review model usage:_

_# Remove unused models_

_# Remove unused models_

_# Add new released models_

_# Add new released models_

_# Backup config:_

_# Backup config:_

cp

cp ~/.continue/config.yaml ~/.continue/config.yaml.backup

~/.continue/config.yaml ~/.continue/config.yaml.backup

bash

cn 

cn _# Start Continue CLI_

_# Start Continue CLI_

^D 

^D _# Exit session_

_# Exit session_

@filename.py 

@filename.py _# Load file context_

_# Load file context_

@codebase 

@codebase _# Search all files_

_# Search all files_


---



## Page 12


**Model Selection Quick Guide**

**Summary: The New Work ﬂow**

**Before (GT 1030):**

• Speed: 2-5 tok/s (painful)

• Models: 1.5-4B (limited)

• Context: 32K (okay)

• Cloud dependency: High (quotas)

**After (RTX 3060):**

• Speed: 25-30 tok/s (smooth)

• Models: 14-16B (excellent)

• Context: 128K (huge)

• Cloud dependency: None (unlimited)

**Result:**

• 10x faster responses

• 4x better model quality

• 4x larger context

• Unlimited usage

• Professional-grade local AI coding

**Installation Checklist**

bash

ollama list 

ollama list _# Show all models_

_# Show all models_

ollama pull model:tag 

ollama pull model:tag _# Download model_

_# Download model_

ollama 

ollama rm

rm model:tag 

model:tag _# Remove model_

_# Remove model_

ollama run model:tag 

ollama run model:tag _# Test model_

_# Test model_

nvidia-smi 

nvidia-smi _# Check GPU usage_

_# Check GPU usage_

bash

_# Default: qwen2.5-coder:14b_

_# Default: qwen2.5-coder:14b_

_# Large context: deepseek-coder-v2:16b_

_# Large context: deepseek-coder-v2:16b_

_# Speed: qwen2.5-coder:7b_

_# Speed: qwen2.5-coder:7b_

_# Reasoning: deepseek-r1:14b_

_# Reasoning: deepseek-r1:14b_

_# Backup: phi3:mini_

_# Backup: phi3:mini_


---



## Page 13


Install RTX 3060 hardware

Install NVIDIA drivers

Install CUDA toolkit

Test nvidia-smi shows GPU

Delete old small models

Download qwen2.5-coder:14b

Download deepseek-coder-v2:16b

Download deepseek-r1:14b

Download qwen2.5:14b

Update conﬁg.yaml on MacBook

Test cn connects and shows new models

Run speed test

Run context test

Verify GPU usage with nvidia-smi

Save this document for reference

**You 're ready to code with unlimited local AI power! **

🚀

🚀