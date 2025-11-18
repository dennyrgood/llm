# Open WebUI Installation Guide for Windows 11


_Source: Open WebUI Installation Guide for Windows 11.pdf_



---



## Page 1


**Open WebUI Installation Guide for Windows 11**

**Overview**

This guide documents the complete installation process for setting up Open WebUI as a ChatGPT-style interface

to your local Ollama server, with remote access via Cloudﬂare Tunnel.

**Prerequisites**

• Windows 11 machine

• Ollama already installed and running (e.g., at localhost:11434 )

• Cloudﬂare tunnel already conﬁgured

• Administrative access to Windows

**Step 1: Install Python 3.11 (Side-by-side with existing Python)**

**Why Python 3.11?**

Open WebUI requires Python 3.11 or 3.12. If you have Python 3.13 (or any other version), install 3.11 alongside

it without interfering with existing Python scripts.

**Installation Steps**

1\. Download Python 3.11.x from python.org/downloads

2\. During installation:

•

✅ **CHECK** "Install launcher for all users"

•

❌ **UNCHECK** "Add python.exe to PATH" (critical!)

• Click "Customize installation"

• Check all optional features

• On "Advanced Options":

• Choose custom location: C:\Python311\ or D:\Misc\Python311\

• **Uncheck** "Add Python to environment variables"

• Complete installation

3\. Verify both Python versions work:

**Step 2: Install Open WebUI**

cmd

# Your default Python (3.13 or whatever you have)

# Your default Python (3.13 or whatever you have)

python --version

python --version

# Python 3.11 specifically

# Python 3.11 specifically

py -3.11 --version

py -3.11 --version

# Or use full path

# Or use full path

C:\Python311\python.exe --version

C:\Python311\python.exe --version


---



## Page 2


**Installation Command**

**Set Environment Variable**

**Note:** Close and reopen Command Prompt after setting environment variable.

**Step 3: Test Open WebUI Locally**

**Start Open WebUI Manually**

**Verify Local Access**

1\. Open browser to http://localhost:8080

2\. Create your ﬁrst account (becomes admin)

3\. Verify you can see your Ollama models

4\. Test a chat message

**Keep this window open for now**

**Step 4: Con ﬁgure Cloudﬂare Tunnel**

**Add DNS Record in Cloud ﬂare**

1\. Go to Cloudﬂare Dashboard

2\. Select your domain (e.g., ldmathes.cc )

3\. Click **DNS** in left menu

4\. Click **Add record**

5\. Conﬁgure:

• **Type:** CNAME

• **Name:** chat

• **Target:** [your-tunnel-id].cfargotunnel.com

• **Proxy status:** Proxied (orange cloud ON)

• **TTL:** Auto

6\. Click **Save**

cmd

py -3.11 -m pip install open-webui

py -3.11 -m pip install open-webui

cmd

setx OLLAMA_BASE_URL "http://localhost:11434"

setx OLLAMA_BASE_URL "http://localhost:11434"

cmd

# Using Python launcher

# Using Python launcher

py -3.11 -m open-webui serve --host 0.0.0.0 --port 8080

py -3.11 -m open-webui serve --host 0.0.0.0 --port 8080

# Or using full path

# Or using full path

D:\Misc\Python311\Scripts\open-webui.exe serve --host 0.0.0.0 --port 8080

D:\Misc\Python311\Scripts\open-webui.exe serve --host 0.0.0.0 --port 8080


---



## Page 3


**Update Tunnel Con ﬁg File**

**Location:** C:�sers\\[YourUsername]\\.cloudflared\config.yml

Add the chat hostname to your ingress rules:

**Validate and Restart Tunnel**

Or if running manually:

**Step 5: Test Remote Access**

**Wait for DNS Propagation**

DNS should propagate in 2-10 minutes. Test with:

You should see Cloudﬂare IPs (104.x.x.x or 172.x.x.x)

**Access Your Chat Interface**

Visit https://chat.yourdomain.com from any device

yaml

tunnel

tunnel: [your

your-tunnel

tunnel-idid]

credentials-file

credentials-file: C

C:�sers\

�sers\[YourUsername

YourUsername]\\.cloudflared\

\\.cloudflared\[your

your-tunnel

tunnel-idid].json

.json

protocol

protocol: http2 

http2 

ingress

ingress:

_# Your existing hostnames..._

_# Your existing hostnames..._

\- hostname

hostname: ollama.yourdomain.com

ollama.yourdomain.com

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

_# Add this for Open WebUI_

_# Add this for Open WebUI_

\- hostname

hostname: chat.yourdomain.com

chat.yourdomain.com

service

service: http

http://localhost

//localhost:8080

8080

_# Catch-all rule (must be last)_

_# Catch-all rule (must be last)_

\- service

service: http_status

http_status:404

404

cmd

# Validate configuration

# Validate configuration

cloudflared tunnel ingress validate

cloudflared tunnel ingress validate

# Restart cloudflared service

# Restart cloudflared service

net stop cloudflared

net stop cloudflared

net start cloudflared

net start cloudflared

cmd

taskkill /F /IM cloudflared.exe

taskkill /F /IM cloudflared.exe

cloudflared tunnel run [your-tunnel-id]

cloudflared tunnel run [your-tunnel-id]

cmd

# From any machine

# From any machine

nslookup chat.yourdomain.com 8.8.8.8

nslookup chat.yourdomain.com 8.8.8.8


---



## Page 4


**Troubleshooting DNS Cache**

If it doesn't work on a speciﬁc device:

**Windows:**

**macOS:**

**Or:** Cycle VPN connection if using one

**Step 6: Set Up as Windows Service (Auto-start)**

**Download NSSM**

1\. Download from nssm.cc/download

2\. Extract to a permanent location (e.g., D:\Misc\nssm.exe )

**Install Service**

Open Command Prompt **as Administrator** :

**Verify Service is Running**

**Test Remote Access Again**

Visit https://chat.yourdomain.com \- should work from all devices now

cmd

ipconfig /flushdns

ipconfig /flushdns

bash

sudo

sudo dscacheutil -flushcache

dscacheutil -flushcache; sudo

sudo killall

killall -HUP mDNSResponder

-HUP mDNSResponder

cmd

# If you get "service already exists" error, delete it first:

# If you get "service already exists" error, delete it first:

sc delete OpenWebUI

sc delete OpenWebUI

# Wait 10-30 seconds, then install:

# Wait 10-30 seconds, then install:

d:\Misc\nssm.exe install OpenWebUI2 "D:\Misc\Python311\Scripts\open-webui.exe" "serve --host 0.0.0.0 --port 8080"

d:\Misc\nssm.exe install OpenWebUI2 "D:\Misc\Python311\Scripts\open-webui.exe" "serve --host 0.0.0.0 --port 8080"

d:\Misc\nssm.exe set OpenWebUI2 AppDirectory "D:\Misc\Python311\Scripts"

d:\Misc\nssm.exe set OpenWebUI2 AppDirectory "D:\Misc\Python311\Scripts"

d:\Misc\nssm.exe set OpenWebUI2 AppEnvironmentExtra OLLAMA_BASE_URL=http://localhost:11434

d:\Misc\nssm.exe set OpenWebUI2 AppEnvironmentExtra OLLAMA_BASE_URL=http://localhost:11434

d:\Misc\nssm.exe set OpenWebUI2 AppStdout "D:\Misc\openwebui-stdout.log"

d:\Misc\nssm.exe set OpenWebUI2 AppStdout "D:\Misc\openwebui-stdout.log"

d:\Misc\nssm.exe set OpenWebUI2 AppStderr "D:\Misc\openwebui-stderr.log"

d:\Misc\nssm.exe set OpenWebUI2 AppStderr "D:\Misc\openwebui-stderr.log"

d:\Misc\nssm.exe start OpenWebUI2

d:\Misc\nssm.exe start OpenWebUI2

cmd

d:\Misc\nssm.exe status OpenWebUI2

d:\Misc\nssm.exe status OpenWebUI2

# Should show: SERVICE_RUNNING

# Should show: SERVICE_RUNNING


---



## Page 5


**Installation Complete!**

✅

✅

You now have:

•

✅ Python 3.11 installed alongside your existing Python

•

✅ Open WebUI installed and running as a Windows service

•

✅ ChatGPT-style interface at https://chat.yourdomain.com

•

✅ Accessible from any device (desktop, mobile, tablet)

•

✅ Auto-starts when Windows boots

**Post-Installation Con ﬁguration**

**First-Time Setup**

1\. Visit https://chat.yourdomain.com

2\. Create admin account (ﬁrst user becomes admin)

3\. Conﬁgure settings:

• Default model selection

• User registration (enable/disable)

• Authentication requirements

• Interface preferences

**Admin Panel Access**

• Click proﬁle icon -> **Admin Panel**

• Manage users, models, and system settings

**Key File Locations**

**Item**

**Location**

Python 3.11

D:\Misc\Python311\

Open WebUI executable

D:\Misc\Python311\Scripts\open-webui.exe

Database & data

D:\Misc\Python311\Lib\site-packages\open_webui\data\

Service logs

D:\Misc\openwebui-stdout.log and openwebui-stderr.log

Cloudflare config

C:�sers\\[Username]\\.cloudflared\config.yml

NSSM

D:\Misc\nssm.exe

**Common Installation Issues**

**Issue: Python version con ﬂict**

**Solution:** Install Python 3.11 to custom directory, don't add to PATH, use py -3.11 explicitly

**Issue: "Service marked for deletion"**

**Solution:** Run sc delete OpenWebUI , wait 30 seconds, try again

**Issue: 502 Bad Gateway after service install**

**Solution:** Check logs at D:\Misc\openwebui-stderr.log , verify service is running with nssm status OpenWebUI2


---



## Page 6


**Issue: Models not appearing**

**Solution:** Verify Ollama is running, check OLLAMA_BASE_URL environment variable, restart service

**Issue: DNS not resolving**

**Solution:** Wait 5-10 minutes, test with nslookup chat.yourdomain.com 8.8.8.8 , ﬂush DNS cache

**Updating Open WebUI**

When updates are available:

**Alternative: Manual Startup (Without Service)**

If you prefer not to use NSSM, create a batch ﬁle:

**File:** start-openwebui.bat

Place in Windows Startup folder: C:�sers\\[Username]\AppData\Roaming\Microsoft\Windows\Start 

Menu\Programs\Startup

**Architecture Diagram**

**Security Notes**

cmd

# Stop service

# Stop service

d:\Misc\nssm.exe stop OpenWebUI2

d:\Misc\nssm.exe stop OpenWebUI2

# Update Open WebUI

# Update Open WebUI

py -3.11 -m pip install --upgrade open-webui

py -3.11 -m pip install --upgrade open-webui

# Start service

# Start service

d:\Misc\nssm.exe start OpenWebUI2

d:\Misc\nssm.exe start OpenWebUI2

batch

@echo

echo off

off

set

set OLLAMA_BASE_URL

OLLAMA_BASE_URL=http:

http://localhost

/localhost:11434

11434

D:\Misc\Python311\Scripts\open-webui.exe

:\Misc\Python311\Scripts\open-webui.exe serve 

serve \--host

\--host 0.0.0.0 --port

\--port 8080

8080

pause

pause

User Device (Browser)

User Device (Browser)

↓

↓

https://chat.yourdomain.com

https://chat.yourdomain.com

↓

↓

Cloudflare Edge Servers (SSL, DDoS protection)

Cloudflare Edge Servers (SSL, DDoS protection)

↓

↓

Cloudflare Tunnel (encrypted)

Cloudflare Tunnel (encrypted)

↓

↓

Windows 11 Machine

Windows 11 Machine

├─ localhost:8080 (Open WebUI - Python 3.11)

├─ localhost:8080 (Open WebUI - Python 3.11)

└─ localhost:11434 (Ollama AI Models)

└─ localhost:11434 (Ollama AI Models)


---



## Page 7


• First user registered becomes admin automatically

• Consider disabling public registration after creating accounts

• All trafﬁc encrypted via Cloudﬂare SSL

• Cloudﬂare provides DDoS protection

• No ports exposed directly to internet (tunnel only)

• Keep Open WebUI and Ollama updated regularly

**Next Steps**

1\. Explore Open WebUI features (document upload, multi-model chat, etc.)

2\. Download additional Ollama models as needed

3\. Conﬁgure user preferences and default settings

4\. Set up regular backups of the database

5\. Share access with team members if desired

**Support Resources**

• **Open WebUI Docs:** https://docs.openwebui.com

• **Ollama Docs:** https://ollama.ai/docs

• **Cloud ﬂare Tunnel Docs:** https://developers.cloudﬂare.com/cloudﬂare-one/

• **Python Launcher:** https://docs.python.org/3/using/windows.html#launcher