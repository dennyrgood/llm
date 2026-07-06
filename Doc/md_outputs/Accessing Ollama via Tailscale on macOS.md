Guide: Accessing Ollama via Tailscale on macOS

This document explains how to expose your local macOS Ollama instance to
other machines on your Tailscale network (Tailnet).

1\. The Core Requirement

By default, the Ollama macOS app only listens on 127.0.0.1 (localhost).
To make it reachable over Tailscale, you must change the OLLAMA_HOST
environment variable to 0.0.0.0. 

2\. Permanent Setup (Recommended)

Since macOS GUI apps do not read your .zshrc or .bash_profile, you must
use a **LaunchAgent** to ensure the setting persists across reboots and
applies to the menu bar app.

Step-by-Step Instructions:

1.  **Create the Plist File:**\
    Open Terminal and run:

> bash
>
> touch \~/Library/LaunchAgents/com.ollama.network.plist
>
> Use code with caution.

2.  **Add Configuration:**\
    Open the file:

> bash
>
> open -e \~/Library/LaunchAgents/com.ollama.network.plist
>
> Use code with caution.
>
> Paste the following XML and save:
>
> xml
>
> \<?xml version=\"1.0\" encoding=\"UTF-8\"?\>
>
> \<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\"
> \"http://www.apple.com\"\>
>
> \<plist version=\"1.0\"\>
>
> \<dict\>
>
> \<key\>Label\</key\>
>
> \<string\>com.ollama.network\</string\>
>
> \<key\>ProgramArguments\</key\>
>
> \<array\>
>
> \<string\>/bin/launchctl\</string\>
>
> \<string\>setenv\</string\>
>
> \<string\>OLLAMA_HOST\</string\>
>
> \<string\>0.0.0.0\</string\>
>
> \</array\>
>
> \<key\>RunAtLoad\</key\>
>
> \<true/\>
>
> \</dict\>
>
> \</plist\>
>
> Use code with caution.

3.  **Activate & Restart:**

    - Load the agent: launchctl load
      \~/Library/LaunchAgents/com.ollama.network.plist

    - **Quit Ollama** from the menu bar and relaunch it.

3\. Connecting from Other Machines

Once the host is set to 0.0.0.0, follow these steps to connect:

1.  **Get your Tailscale IP:** Run tailscale ip -4 on your Mac.

2.  **Test the Port:** From a different machine on your Tailnet, run:

> bash
>
> curl http://\[YOUR-MAC-TAILSCALE-IP\]:11434/api/tags
>
> Use code with caution.

3.  **Configure Frontend Apps:** In tools like **Open WebUI** or
    **AnythingLLM**, set the OLLAMA_BASE_URL to
    http://\[YOUR-MAC-TAILSCALE-IP\]:11434. 

4\. Troubleshooting

- **Verify Variable:** Run launchctl getenv OLLAMA_HOST. It should
  return 0.0.0.0.

- **Firewall:** Ensure the macOS Firewall (System Settings \> Network \>
  Firewall) isn\'t blocking incoming connections on port **11434**.

- **Shell vs. GUI:** Remember that setting export OLLAMA_HOST in .zshrc
  only affects terminal commands, not the background Ollama app. 

Current session fix:

launchctl setenv OLLAMA_HOST \"0.0.0.0\"

then launch/relaunch ollama
