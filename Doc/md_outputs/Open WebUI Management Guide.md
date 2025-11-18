# Open WebUI Management Guide


_Source: Open WebUI Management Guide.pdf_



---



## Page 1


**Open WebUI Management Guide**

**System Overview**

**Installation Location:** D:\Misc\Python311\**Service Name:** OpenWebUI2**Web Interface:** https://

chat.ldmathes.cc**Local Access:** http://localhost:8080

**Service Management Commands**

**Check Service Status**

**Stop Service**

**Start Service**

**Restart Service**

**Troubleshooting**

**Check if Open WebUI is Running**

**View Error Logs**

**View Standard Output Logs**

**Manual Start (for testing)**

cmd

d:\Misc\nssm.exe status OpenWebUI2

d:\Misc\nssm.exe status OpenWebUI2

cmd

d:\Misc\nssm.exe stop OpenWebUI2

d:\Misc\nssm.exe stop OpenWebUI2

cmd

d:\Misc\nssm.exe start OpenWebUI2

d:\Misc\nssm.exe start OpenWebUI2

cmd

d:\Misc\nssm.exe restart OpenWebUI2

d:\Misc\nssm.exe restart OpenWebUI2

cmd

netstat -ano | findstr :8080

netstat -ano | findstr :8080

cmd

type D:\Misc\openwebui-stderr.log

type D:\Misc\openwebui-stderr.log

cmd

type D:\Misc\openwebui-stdout.log

type D:\Misc\openwebui-stdout.log


---



## Page 2


**Updating Open WebUI**

When a new version is released:

**Open WebUI Features**

**Admin Panel**

• Click your proﬁle icon -> **Admin Panel**

• Manage users and permissions

• Conﬁgure model settings

• Set default models for new chats

• View usage statistics

**Model Selection**

• Located at top of chat interface

• Switch between available Ollama models

• Can select multiple models simultaneously to compare responses

**Document Upload**

• Click the paperclip icon in chat

• Upload PDFs, text ﬁles, Word docs

• RAG (Retrieval Augmented Generation) allows chatting about document contents

• Supports multiple ﬁle formats

**Conversation History**

• Automatically saved in sidebar

• Searchable by content

• Can be exported or deleted

• Organize with folders/tags

**Additional Features**

cmd

set OLLAMA_BASE_URL=http://localhost:11434

set OLLAMA_BASE_URL=http://localhost:11434

D:\Misc\Python311\Scripts\open-webui.exe serve --host 0.0.0.0 --port 8080

D:\Misc\Python311\Scripts\open-webui.exe serve --host 0.0.0.0 --port 8080

cmd

# Stop the service

# Stop the service

d:\Misc\nssm.exe stop OpenWebUI2

d:\Misc\nssm.exe stop OpenWebUI2

# Update Open WebUI

# Update Open WebUI

py -3.11 -m pip install --upgrade open-webui

py -3.11 -m pip install --upgrade open-webui

# Start the service

# Start the service

d:\Misc\nssm.exe start OpenWebUI2

d:\Misc\nssm.exe start OpenWebUI2


---



## Page 3


• **Web Search:** Enable in settings for real-time information

• **Image Generation:** If you have image models installed

• **Voice Input:** Browser-based speech recognition

• **Code Execution:** Run code snippets directly in chat

• **Custom Prompts:** Save frequently used prompts

**Performance Tips**

• **First Response Delay:** Initial responses may be slow as models load into memory

• **Subsequent Responses:** Once loaded, responses are fast

• **New Models:** Models added to Ollama appear automatically in Open WebUI

• **Memory Usage:** Keep an eye on RAM usage with larger models

• **Concurrent Users:** Multiple users can access simultaneously

**Architecture**

**Components**

1\. **Ollama Server** (localhost:11434) - Runs the AI models

2\. **Open WebUI** (localhost:8080) - Web interface

3\. **Cloud ﬂare Tunnel** \- Secure remote access

4\. **NSSM Service** \- Runs Open WebUI as Windows service

**Data Flow**

**Con ﬁguration Files**

**Cloud ﬂare Tunnel Conﬁg**

**Location:** C:�sers\DrDen\\.cloudflared\config.yml

**Open WebUI Data**

**Location:** User data stored in Open WebUI's database (check admin panel for exact path)

**Environment Variables**

• OLLAMA_BASE_URL=http://localhost:11434

**Common Issues & Solutions**

**502 Bad Gateway Error**

User Device -> https://chat.ldmathes.cc 

User Device -> https://chat.ldmathes.cc 

-> Cloudflare 

-> Cloudflare 

-> Cloudflare Tunnel 

-> Cloudflare Tunnel 

-> localhost:8080 (Open WebUI)

-> localhost:8080 (Open WebUI)

-> localhost:11434 (Ollama)

-> localhost:11434 (Ollama)


---



## Page 4


• Check if Open WebUI service is running: d:\Misc\nssm.exe status OpenWebUI2

• Check if port 8080 is available: netstat -ano | findstr :8080

• Restart service: d:\Misc\nssm.exe restart OpenWebUI2

**Models Not Appearing**

• Verify Ollama is running: curl http://localhost:11434/api/tags

• Check OLLAMA_BASE_URL environment variable

• Restart Open WebUI service

**Can 't Access Remotely**

• Verify Cloudﬂare tunnel is running: tasklist | findstr cloudflared

• Check DNS record exists for chat.ldmathes.cc

• Verify ingress rule in Cloudﬂare conﬁg

**Service Won 't Start**

• Check logs: type D:\Misc\openwebui-stderr.log

• Verify Python 3.11 is installed at D:\Misc\Python311\

• Try manual start to see detailed errors

**Security Considerations**

• First user created becomes admin

• Enable authentication in settings

• Consider limiting user registrations

• Keep Open WebUI updated for security patches

• Cloudﬂare provides DDoS protection and SSL

**Backup Recommendations**

**Database Location**

For your Python 3.11 installation, the database is located at: **D:\Misc\Python311\Lib\site-**

**packages\open_webui\data\webui.db**

To verify the exact location, run:

Then in Python:

cmd

py -3.11

py -3.11

python

import

import open_webui

open_webui

print

print(open_webui

open_webui.__file__

__file__)

_# Look in the same directory for the 'data' folder_

_# Look in the same directory for the 'data' folder_


---



## Page 5


The data directory contains:

• webui.db \- Main SQLite database (chat history, users, settings)

• uploads/ \- User uploaded ﬁles

• vector_db/ \- Vector embeddings for RAG/document search

• cache/ \- Temporary cache ﬁles

**What to Backup**

1\. **Open WebUI data directory:** D:\Misc\Python311\Lib\site-packages\open_webui\data\

• Especially webui.db (contains all chat history and settings)

• uploads/ folder (user uploaded documents)

• vector_db/ folder (document embeddings)

2\. **Cloud ﬂare tunnel conﬁg:** C:�sers\DrDen\\.cloudflared\config.yml

3\. **Ollama models** (if customized): Usually in C:�sers\DrDen\\.ollama\models\

**How to Backup**

• **Quick backup:** Copy the entire data directory to another location

• **Database only:** Copy webui.db ﬁle

• Use the export function in Open WebUI admin panel for chat history

• Regularly backup the conﬁg.yml ﬁle

• Consider scheduling automated backups with Task Scheduler

**Support Resources**

• **Open WebUI Documentation:** https://docs.openwebui.com

• **Ollama Documentation:** https://ollama.ai/docs

• **Cloud ﬂare Tunnel Docs:** https://developers.cloudﬂare.com/cloudﬂare-one/connections/connect-apps/

**Quick Reference**

**Task**

**Command**

Check service

d:\Misc\nssm.exe status OpenWebUI2

Restart service

d:\Misc\nssm.exe restart OpenWebUI2

View errors

type D:\Misc\openwebui-stderr.log

Update software

py -3.11 -m pip install --upgrade open-webui

Check port 8080

`netstat -ano

Access locally

http://localhost:8080

Access remotely

https://chat.ldmathes.cc