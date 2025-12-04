# RemoteDesktopIssue (pdf)

Extracted from PDF: RemoteDesktopIssue (pdf).pdf

---

Skip to main contentAccessibility help
Accessibility feedback

AI Mode
All
Images
Videos
News
More
Sign in
how do i turn on rdp windows 11 pro
To turn on Remote Desktop (RDP) in Windows 11 Pro, you can use the Settings app or the
Control Panel
.
Method 1: Using the Settings App (Recommended)
This is the most straightforward method.
1. Open Settings: Select the Start button, then select Settings > System.
2. Navigate to Remote Desktop: Scroll down and click on Remote Desktop in the
right pane.
3. Enable Remote Desktop: Toggle the switch to On.
4. Confirm: A confirmation pop-up dialog box will appear. Select Confirm to enable
the feature.
5. Note your PC name: Under the toggle switch, make a note of your PC's name, as
you will need this to connect from another device.
1.
These Microsoft and Thinstuff guides explain how to enable Remote Desktop on Windows
11 Pro to allow remote connections:
Enable Remote Desktop on your PC - Microsoft Learn

Jun 18, 2025 — Enable Remote Desktop. You can configure your PC for remote access with
a few easy steps. * Select Start, select Setti...

Microsoft Learn
How to enable Remote Desktop on Windows 11 | Thinstuff s.r.o.
Apr 14, 2024 — How to enable Remote Desktop on Windows 11 * Step 1: Enable Remote
Desktop on Windows 11 with Settings. To enable Remo...
Thinstuff

Method 2: Using the Control Panel
This method accesses the classic System Properties window.
1. Open Control Panel: Type "Control Panel" in the taskbar search and select the app
from the results.
2. Go to System and Security: Select System and Security, then under the "System"
section, select Allow remote access.
3. Allow remote connections: A "System Properties" window will open to the Remote
tab. Under the Remote Desktop section, check the box for Allow remote
connections to this computer.
4. Apply and OK: Click Apply, then OK.
1.
Additional Setup (Optional but Recommended)
• Select users: By default, any administrator account on the PC can connect
remotely. To allow other standard users to connect, click Remote Desktop users in
the Remote Desktop settings (or the "Select Users" button in the Control Panel
method), click Add, type the username, and click OK.
• Configure Firewall: The Remote Desktop feature usually configures the Windows
Firewall automatically. If you encounter issues, ensure that Remote Desktop is
allowed through the Windows Security app's firewall settings for Private and Public
networks.

•

Connecting from another device: On the other computer (which can run any
version of Windows or a different OS with the Microsoft Remote Desktop app), open
the "Remote Desktop Connection" app (mstsc.exe) or the modern "Remote
Desktop" app, enter the PC name or IP address of the host computer, and connect
using the appropriate credentials.

•
• How to Set Up Remote Desktop Connection in Windows - HP
Feb 11, 2025 — Contents * How to remote connect with Microsoft Windows. * Step 1: Use
Windows 11 Pro or install the Remote Desktop ap...
HP

•
• How to use Remote Desktop - Microsoft Support
How to use Remote Desktop. Use Remote Desktop on your Windows, Android, or iOS
device to connect to a Windows PC from afar. Here's...

Microsoft Support
•
• How to Allow Remote Desktop on Windows 11 - HelpWire
Aug 2, 2025 — Enable RDP via System Settings in Windows 11 * Step 1: Open Start →
Settings. * Step 2: In the Settings window, select ...

HelpWire

•
Show all
error code x0204
The error code
0x204 (sometimes written as x0204) is a common issue related to Microsoft Remote
Desktop (RDP) connections. It typically indicates a connectivity problem that prevents
the client device from establishing a connection to the remote computer.
This error often occurs when attempting to connect from a macOS device to a Windows
PC, but can also happen between Windows machines.
Here are the primary causes and troubleshooting steps to resolve the error:
Common Causes
The RDP error 0x204 is usually caused by one or more of the following:
• The Remote Desktop feature is disabled on the host Windows PC.
• Firewall settings (Windows Defender or a third-party antivirus) are blocking the
connection on port 3389.
• Network configuration issues, such as problems with DNS resolution, VPN settings,
or router settings like AP isolation.
• Corrupted temporary files in the Remote Desktop client application (most common
on Mac clients).
•
Troubleshooting Steps
Follow these steps on the host (remote) Windows PC first, as configuration issues there
are the most frequent cause:
1. Ensure Remote Desktop is Enabled
Verify that the feature is properly turned on.
• Open the Run dialog box by pressing Win + R.
• Type sysdm.cpl and press Enter to open System Properties.
• Go to the Remote tab.
• Under "Remote Desktop," ensure that Allow remote connections to this
computer is selected.
• Click Apply and OK.
•
2. Allow RDP Through the Windows Firewall

The firewall may be blocking inbound RDP traffic (which uses port 3389). While Windows
usually configures this automatically, manual verification helps.
• Open the Run dialog box by pressing Win + R.
• Type firewall.cpl and press Enter to open Windows Defender Firewall settings.
• Click Allow an app or feature through Windows Defender Firewall on the left
sidebar.
• Click Change settings.
•
•
•

Scroll down the list and ensure that Remote Desktop has both Private and Public
boxes checked.
Click OK to save the changes.

3. Check Network Connectivity
Try connecting using the target computer's IP address instead of its name to rule out DNS
issues.
• On the Windows PC, open Command Prompt (search for cmd in the Start menu).
•
•

Type ipconfig and press Enter. Note down the IPv4 Address.
On your client device (Mac or Windows), use this IP address to initiate the Remote
Desktop connection.

•
If you are using a third-party antivirus program, you may need to temporarily disable it or
configure its specific firewall settings to allow port 3389 connections.
4. Delete Temporary Files (Mac Clients Only)
If you are connecting from a Mac, corrupted cache files can cause this error.
• Close the Microsoft Remote Desktop application on your Mac.
• Open Finder.
• In the search bar, type group containers and ensure you are searching "This Mac".
• Locate and open the folder named UBF8T346G9.com.microsoft.rdc.
• Right-click this folder and select Move to Trash.
• Empty the trash and restart the Remote Desktop app to try connecting again.
•
• Remote desktop connections - Microsoft Q&A
Feb 17, 2025 — 1 answer. ... Hello, Error code 0x204 is a common remote desktop
connection error that typically indicates an inabilit...

Microsoft Learn
•
• How to Fix Microsoft Remote Desktop Error code 0x204 on Mac
Mar 30, 2025 — How to Fix Microsoft Remote Desktop Error code 0x204 on Mac * Two
different operating systems, like Mac and Windows, c...

HelpWire

•
• [Must-know] How to Fix 0x204 Error on Remote Desktop
Aug 20, 2024 — * Part 1. What Is Error Code 0x204 in Remote Desktop. The error code
0x204 in Remote Desktop signifies a connectivity ...
AirDroid

•
Show all
i have two win11 machines both pro ... one i can get rdp working the other i can't ... both
are pingable from the macos cli ... i am using the microsoft rdp app on the mac
It is frustrating when identical setups yield different results. Since you can successfully
ping both Windows 11 Pro machines from your macOS CLI, basic network connectivity is
established, meaning the issue likely lies in specific RDP configuration or firewall settings
on the non-working Windows 11 machine or a client-side permission on the Mac.

Here are targeted steps to compare configurations and resolve the error 0x204:
On the Non-Working Windows 11 Pro Machine (Host B)
Focus on comparing the settings on this machine to those on the working one (Host A).
1. Verify the Network Profile is Set to "Private"
Windows uses different firewall rules for "Private" vs. "Public" networks. Public network
settings are much stricter by default and often block RDP.
• Open Settings > Network & internet.
• Select the network you are connected to (e.g., Wi-Fi or Ethernet properties).
• Under Network profile type, ensure Private network is selected.
•
These resources explain how to diagnose and fix Windows 11 RDP connection problems,
specifically addressing firewall and network settings:
Windows Firewall blocking SMB and RDP connections | irohastack
Nov 19, 2025 — Local Windows Firewall inbound rules are disabled or not allowing the
correct network profile ... 0x204 (RDP) or 0x800...

irohastack.com
Can't remote from Macbook to Windows 11 using MacOS ...
Nov 3, 2024 — Unfortunately, no. I messed with it for a few hours but then gave up and
haven't revisited. Defiant_Yak2. • 1y ago. It'

Reddit
2. Confirm RDP is Allowed Through the Firewall for the Correct Profile
Even if RDP is "enabled" in System Settings, a manual check of the firewall rules is
necessary.
• Open the Run dialog (Win + R) and type firewall.cpl, then press Enter.
• Click Allow an app or feature through Windows Defender Firewall on the left.

•
•
•
•

Click Change settings.
Scroll down the list and ensure Remote Desktop has the box checked for the
network profile you identified in Step 1 (e.g., Private).
It is safest to check both Private and Public temporarily for troubleshooting.

3. Temporarily Disable Network Level Authentication (NLA)
Sometimes, cross-platform compatibility issues with the macOS client can cause NLA
negotiation to fail.
• Open the Run dialog (Win + R) and type sysdm.cpl, then press Enter.
• Go to the Remote tab.
• Under "Remote Desktop," ensure Allow remote connections to this computer is
checked.
• Uncheck the box for "Allow connections only from computers running Remote
Desktop with Network Level Authentication (NLA)".
• Click Apply and OK.
•
If this allows you to connect, the issue is NLA-related. You may need to investigate user
credentials or local security policies further to re-enable NLA securely later.
4. Check for Third-Party Antivirus/Firewall Interference
If you have a third-party security suite (like Norton, McAfee, etc.) installed on Host B but
not Host A, its firewall is likely blocking the connection.
• Temporarily disable the third-party firewall/antivirus protection modules on Host B
and immediately attempt to connect from your Mac.
• If the connection succeeds, you must configure an exception for TCP port 3389
within that specific software's settings.
•

On the macOS Client Machine
Since one machine works, this is less likely the issue, but a quick check won't hurt.
5. Verify macOS App Permissions
macOS security settings might be blocking local network access for the RDP app.
• Go to System Settings (or System Preferences) > Security & Privacy > Privacy >
Local Network.

•

Ensure that the Microsoft Remote Desktop app has a checkmark allowing it to
access your local network.

•
6. Connect via IP Address
While you confirmed ping works by name, forcing the connection via the IPv4 address
bypasses any potential residual DNS oddities within the RDP client itself.
•

Use the actual IPv4 address of the non-working Windows PC (e.g., 192.168.1.105) in
the Microsoft RDP app connection dialogue instead of the PC name.

•
By systematically comparing these settings on the non-working machine against the
working one, you should be able to isolate the exact discrepancy causing the 0x204 error.
• Error code 0x204 Remote Desktop Mac: how to fix the problem
May 6, 2021 — Error code 0x204 Remote Desktop Mac: how to fix the problem * How to fix
Remote Desktop error code 0x204 on Mac. Method...

macsecurity.net

•
• RDP Works PC to PC, but I get Error Code 0x204 MAC to PC
So, you can try below methods to see if they help. * On the remote windows PC, open
"Run" and input "SystemPropertiesRemote.exe" t...

Microsoft Learn

•
• RDP Works PC to PC, but I get Error Code 0x204 MAC to PC
Comment Use comments to ask for clarification, additional information, or improvements
to the question. ... Dec 6, 2020, 8:10 p.m.

Microsoft Learn

•
Show all
1 yes, 2, yes, 3, disabled, 4 none, 5 - silly it works for other win11, 6, using ip all along-----still x0204
It sounds incredibly frustrating that one machine works perfectly while the other, with
seemingly identical settings, does not. Since basic connectivity (ping) is fine, the issue is a
specific blockage in the RDP communication stream on the non-working Windows 11
machine, likely related to deeper system configurations or service status.
Here are advanced troubleshooting steps to resolve the persistent error 0x204:
Advanced Troubleshooting for the Non-Working Windows 11 PC
These steps check deeper system configurations that might differ between your two PCs.
1. Verify Remote Desktop Services are Running
The RDP service might be stopped, even if the graphical "Enable Remote Desktop" toggle is
on.
• Open the Run dialog box (Win + R).
• Type services.msc and press Enter.
• In the Services window, find Remote Desktop Services and Remote Desktop
Configuration.
• Ensure that both services have a Status of "Running" and a Startup Type of
"Automatic".

•

If they are not running, right-click the service, select Properties, set the Startup
type to Automatic, click Apply, and then click Start.

•
2. Check for IP Security (IPsec) Policy Restrictions
Sometimes, local security policies or domain settings can block specific ports, including
3389, even if the basic Windows Firewall rule is correct.
•
•

•
•
•

Open the Run dialog box (Win + R).
Type secpol.msc and press Enter (If you receive an error that this file cannot be
found, your Windows edition may not include the Local Group Policy Editor, and you
can skip this step).
Navigate to IP Security Policies on Local Computer.
Look for any assigned policies that might restrict Port 3389.
If you find a policy named something like "Port 3389 Restriction," right-click it and
select Un-assign, then attempt your RDP connection again.

•
3. Check Windows Event Viewer Logs for RDP Errors
The Event Viewer often provides specific technical reasons for connection failures.
• Open the Run dialog box (Win + R).
• Type eventvwr.msc and press Enter.
• In the left pane, navigate to Applications and Services Logs > Microsoft >
Windows > TerminalServices-LocalSessionManager > Operational.
• Look for recent Error events around the time you tried to connect from your Mac.
The details in the error description might pinpoint the exact failure point (e.g., a
specific security layer failure).
•
On the macOS Client
You mentioned this seems silly as one PC works, but corrupted temporary files or bad
cached connection settings specific to the target IP address in the macOS app can cause
generic 0x204 errors. The working PC's settings don't use the problematic cache entry.
4. Force Clear the Specific macOS RDP Cache
• Close the Microsoft Remote Desktop application completely.
• Open Finder.
• In the top menu bar, click Go > Go to Folder.
• Type ~/Library/Group Containers/ and click Go.
• Find the folder named UBF8T346G9.com.microsoft.rdc.

•
•

Right-click this folder and select Move to Trash.
Empty the trash and reopen the RDP application. You will have to re-add the
connection profile for the problematic PC.

•
If none of these deeper steps work, there may be a subtle difference in the hardware,
drivers, or router interaction that is difficult to diagnose without a full network trace.
• Remote desktop connections - Microsoft Q&A
Feb 17, 2025 — Based on past experience, remote desktop error codes can 0x204 be
caused by remote desktop not enabled, firewall block...

Microsoft Learn
•
• 5 Proven Methods to Fix Remote Desktop Error Code 0x204
Jul 27, 2025 — Understanding The 0x204 Error Code and Its Causes * Network Problem: In
order to create a stable remote session, a goo...

A2 Cloud Hosting Services

•
• Microsoft Remote Desktop Error( 0x204)
5 additional answers * Tom Terrific. 0. Jun 2, 2023, 8:53 AM. Similar problems here. RDS
fails to connect. Only solution is to res...

Microsoft Learn
•
Show all
1 running, 2 none, 3 none, 4 that will break my working one
It is highly unusual for a working RDP setup on one machine to fail completely on a second,
identically configured machine on the same network. Since standard configurations have
been ruled out, we must check for subtle differences in network listener status or network
drivers.
Here are the next steps focused on diagnosing the exact point of failure using commandline diagnostics and client-side adjustments.
Step 1: Verify the RDP Port Listener Status on Windows 11 Host B
Let's definitively confirm that the non-working PC is actually listening for RDP connections
on the default port 3389.
1. Open Command Prompt as an administrator on the non-working Windows 11 PC.
(Right-click the Start button and select Terminal (Admin) or Windows Terminal
(Admin)).
2. Run the following command:
cmd
netstat -an | find "3389"
Use code with caution.
•
• Expected Output: You should see an entry similar to TCP 0.0.0.0:3389 LISTENING
or TCP [::]:3389 LISTENING.
1.
• If you see LISTENING: The RDP service is bound correctly to the network interface.
The issue is likely the Mac client's connection attempt being blocked by a network
device between the Mac and the PC, or a client-side setting.

•

If you do NOT see LISTENING: The RDP service is not active or is bound only to a
local loopback address (127.0.0.1), despite your settings. This points to a deeper
Windows service or driver issue.

•
Step 2: Test Port Reachability from the macOS CLI
Since ping works (ICMP traffic), we need to confirm that TCP traffic on port 3389 can
reach the Windows PC from the Mac.
1. Open Terminal on your macOS device.
2. Use the nc (netcat) command to test the specific port (assuming your Windows IP is
192.168.1.X):
bash
nc -vz 192.168.1.X 3389
Use code with caution.
• (Replace 192.168.1.X with the actual IP address of the non-working Windows 11
PC).
• Expected Output: A successful connection will usually display Connection to
192.168.1.X port 3389 [tcp/ms-wbt-server] succeeded!.
1.
• If it succeeds but the RDP app fails with 0x204, the problem is definitely within the
RDP application's specific connection profile on the Mac.
• If it fails (e.g., Connection refused or Operation timed out), then something is still
blocking TCP port 3389 traffic, which brings us back to the Windows PC's firewall,
network profile, or the router itself.
•
Step 3: Delete Only the Problematic Connection in the macOS RDP App
To address your concern about breaking the working configuration, you do not have to
delete the entire Group Containers folder. Just remove the saved connection entry within
the app's interface:
1. Open the Microsoft Remote Desktop app.
2. Locate the entry for the non-working Windows 11 PC.
3. Right-click the entry and select Delete.
4. Click the + Add PC button and recreate the connection profile from scratch using
the IP address.
1.

Next Steps
Please provide the output from the netstat command on the Windows PC and the nc -vz
command on the Mac CLI. This data will tell us exactly where the connection is failing.
• General Remote Desktop connection troubleshooting
Jan 14, 2025 — Check that another application isn't trying to use the same port. For this
procedure, use a PowerShell instance that h...

Microsoft Learn

•
• How to check if a Windows server Port is "open" or closed? ... - Reddit
Jun 9, 2021 — * Egress = outbound = check Windows firewall 'Outbound Rules' under the
'Remote Port' column. * Ingress = inbound. Chec...

Reddit
•
• RDP Network Port Configuration, Security, & Best Practices
Dec 12, 2024 — Frequently Asked Questions Answered * Is RDP Port 3389 TCP or UDP? Is
RDP Port 3389 TCP or UDP? It's both. RDP uses TC...

JumpCloud

•
Show all
netstat -an | find "3389" -- format error
The "format error" suggests that the command as written might not be recognized by your
specific command prompt environment, possibly due to path issues with the
find utility or an incorrect character being used (the | pipe character can sometimes be
finicky if pasted from certain sources).
• Command Prompt Error: '$' is not recognized as an internal or ...
Jun 13, 2024 — The error message you are encountering, "'$' is not recognized as an
internal or external command" indicates that the ...

Microsoft Learn
•
notfound 3389
The output "notfound 3389" is a crucial clue:
The non-working Windows 11 PC is not listening for RDP connections on the default
port 3389.
This indicates a configuration problem deep within the RDP service listener, despite the
service status appearing as "Running."
Here are the definitive steps to resolve this, focusing on the configuration of the nonworking Windows 11 machine:
Step 1: Verify the Configured RDP Port in the Registry
The port number might have been accidentally changed.
1. Open the Run dialog box (Win + R) on the non-working PC.

2. Type regedit and press Enter to open the Registry Editor.
3. Navigate to the following registry key:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal
Server\WinStations\RDP-Tcp
4. In the right pane, find the DWORD value named PortNumber.
5. Double-click PortNumber.
6. Ensure the Base is set to Decimal, and the Value data is 3389.
a. If it's anything different, change it to 3389 and click OK.
b. If it is already 3389 (Decimal), proceed to the next step.
1.
a.
Step 2: Use qwinsta to Confirm Listener State
The netstat command sometimes behaves unexpectedly; qwinsta is a dedicated RDP
command.
1. Open Command Prompt (search for cmd in the Start Menu).
2. Run the command:
cmd
qwinsta
Use code with caution.
•
• Look for an entry named rdp-tcp. The STATE column next to it should say Listen.
1.
If it does not say Listen, the listener configuration is corrupted.
Step 3: Export/Import the RDP Listener Configuration (The Fix)
Since you have a working Windows 11 Pro machine on the same network, the most reliable
fix is to copy its working RDP registry settings to the non-working machine.
A. On the Working Windows 11 PC (Host A):
1. Open Registry Editor (regedit).
2. Navigate to the same key:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal
Server\WinStations\RDP-Tcp
3. Right-click on the RDP-Tcp folder (key) in the left pane.
4. Select Export and save the file as rdp_working_config.reg to a USB drive or network
share.
1.

B. On the Non-Working Windows 11 PC (Host B):
1. Copy the rdp_working_config.reg file to the desktop of the non-working PC.
2. Backup first (safety first): Open an Admin Command Prompt and run:
cmd
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDPtcp" C:\rdp_backup_b.reg
Use code with caution.
•
• Import the working configuration: Double-click the rdp_working_config.reg file
you copied over and confirm that you want to merge it into the registry.
• Restart the RDP Service: Open Services (services.msc), find Remote Desktop
Services, right-click it, and select Restart.
1.
After importing the configuration and restarting the service, run netstat -an | find "3389" or
qwinsta again. You should now see LISTENING or Listen. Your macOS client should be able
to connect immediately using the IP address.
• Remote Desktop is running but not listening on port 3389?
Jan 13, 2025 — 0 votes Report a concern. MotoX80 • Follow 37,066 Reputation points. Jan
15, 2025, 5:26 AM. Use the event viewer and c...

Microsoft Learn

•
• Change the Remote Desktop listening port on your computer
Jun 29, 2025 — To change the listening port using PowerShell, follow these steps: * Open
PowerShell as an administrator. * Check the ...

Microsoft Learn
•
• Windows 2022 server RDP not listening on port 3389 - Microsoft Learn
Nov 18, 2025 — 6 answers. ... If port 3389 is closed after reboot, please check that the
Remote Desktop Services service is running a...

Microsoft Learn
•
Show all
qwinsta: services 0 disc >console Pc 1 Active
The
qwinsta output confirms the core issue: the RDP-Tcp listener is missing from the list of
active sessions on the non-working PC. The RDP service is running, but it has no session
configured to listen for incoming connections on port 3389.
The solution requires recreating this specific RDP listener configuration. The safest and
most effective way to do this is by leveraging the configuration from your working Windows
11 Pro machine, as suggested previously.
Exporting a registry key from the working PC will not harm it; it merely copies data.
The Fix: Recreate the RDP Listener Configuration
Please follow these steps exactly on both machines:
Part A: On the Working Windows 11 PC (Host A)
1. Open the Registry Editor (regedit.msc).
2. Navigate to the following key path in the left pane:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal
Server\WinStations\
3. Right-click on the RDP-Tcp folder (key).

4. Select Export and save the file to a USB drive or network location as RDP-TcpWorking.reg.
1.
Part B: On the Non-Working Windows 11 PC (Host B)
1. Copy the RDP-Tcp-Working.reg file from Part A to the desktop of this PC.
2. Open Command Prompt as an Administrator (Right-click Start, select Terminal
(Admin)).
3. Delete the existing (broken) key using the command line:
cmd
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Terminal
Server\WinStations\RDP-Tcp" /f
Use code with caution.
•
• Import the working key: Double-click the RDP-Tcp-Working.reg file you saved on
the desktop. Confirm the prompt to merge the changes.
• Restart the Remote Desktop Service:
• Open Services (services.msc).
• Find Remote Desktop Services.
• Right-click it and select Restart.
1.
a.
After these steps, the RDP listener should be properly recreated and listening. Run qwinsta
or netstat -an | find "3389" again to verify the Listen status, then try connecting from your
Mac using the IP address.
• RDP listener disappears randomly on ~800 enterprise machines
Jan 4, 2024 — Using Test-Netconnection -port 3389, we can see that the computer is
online but not receiving traffic. Rebooting the co...

Microsoft Learn
•
• Problem with RDP service on Windows Server 2022 - Microsoft Q&A

Oct 16, 2023 — When problem is present, the service is running in OS, but when using the
"netstat" command, it shows that the server ...

Microsoft Learn

•
• Windows 2022 server RDP not listening on port 3389
Nov 18, 2025 — Confirm listener status: Run qwinsta or check Remote Desktop Services →
RDP-Tcp in the Remote Desktop Session Host Con...

Microsoft Learn
•
Show all
is there another way?
Yes, there is another way that avoids manually navigating the Registry Editor on both
machines. You can use
PowerShell commands on the problematic Windows 11 PC to force a recreation of the
necessary RDP listener settings and regenerate the required security certificates.
This approach addresses the root cause of the missing RDP-Tcp Listen state (notfound
3389) using a different interface.

Alternative Method: Use PowerShell to Force a RDP Reset
Run the following commands in an elevated PowerShell session only on the non-working
Windows 11 machine (Host B).
1. Open PowerShell as Administrator
• Right-click the Start button.
• Select Terminal (Admin) or Windows PowerShell (Admin).
•
2. Run the Commands
Copy and paste the following commands into the PowerShell window, pressing Enter after
each section. These commands enable RDP via the registry, re-allow the firewall rule,
delete the current RDP security certificate, and restart the services to generate a new,
healthy listener configuration.
A. Ensure RDP is Enabled and Firewall is Open
powershell
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Use code with caution.
B. Clear the Corrupted RDP Certificate
A corrupted self-signed certificate is often the cause of a listener failure. This forces
Windows to create a new one.
powershell
# Navigate to the Certificate Store Path
cd Cert:\LocalMachine\RemoteDesktop\
# Delete the existing RDP self-signed certificate (this typically only finds one)
Get-ChildItem | Remove-Item
Use code with caution.
C. Restart the Remote Desktop Services
This forces the system to apply the changes and re-create the RDP listener and a new selfsigned certificate.
powershell
Restart-Service TermService -Force
Use code with caution.

3. Verify the Fix
After running these commands and waiting a few moments for the services to fully restart,
run the listener status check again in the PowerShell window:
powershell
netstat -an | find "3389"
Use code with caution.
You should now see the status as LISTENING. Once it is listening, your macOS RDP client
using the IP address should connect successfully.
• Enable Remote Desktop On Windows 11 [5 Best Ways] - Prajwal Desai
May 15, 2025 — Method 4: Enable RDP using PowerShell on Windows 11 Perform the
below steps to enable the remote desktop on Windows 11...

Prajwal Desai

•
• how do i restore DISM in windows 11 - Microsoft Learn
Jul 30, 2025 — Hello Vahik. If DISM reports “The component store is repairable” in
Windows 11 that means system corruption has been d...

Microsoft Learn

•
• How to Enable Remote Desktop on Windows Server 2022 - TSplus
Jan 2, 2025 — Enabling Remote Desktop via PowerShell * Step 1: Open PowerShell as
Administrator. Use the Start Menu to search for Pow...

TSplus

•
Show all
restart ---> service 'remote destop services' stop failed
The error "service 'remote desktop services' stop failed" means
the service is likely stuck in a "Stopping" state or is hung. This is preventing a clean restart
and regeneration of the RDP listener required for your connection to work.
You need to forcefully terminate the process associated with the service using the
command line.
Force Stop and Restart the Service
Run the following commands in an elevated PowerShell/Command Prompt session on the
non-working Windows 11 machine:
1. Forcefully Kill the Stuck Service Process
This command identifies the process host that contains the "TermService" (Remote
Desktop Services) and kills it instantly.
Open Terminal (Admin) or Command Prompt (Admin) and run:
cmd
taskkill /F /FI "SERVICES eq TermService"
Use code with caution.

You should receive a message like: "SUCCESS: The process with PID [number] has been
terminated."
2. Verify the Service is Now Stopped
Check the status again in services.msc to ensure the status is now blank or "Stopped".
3. Start the Service Again
Once the process is definitely terminated, start the service cleanly:
cmd
net start TermService
Use code with caution.
or in PowerShell:
powershell
Start-Service TermService
Use code with caution.
4. Verify the Listener Status Again
Wait a few seconds after starting the service, then check the listener status one more time:
cmd
netstat -an | find "3389"
Use code with caution.
You should finally see LISTENING next to port 3389.
5. Attempt Connection
Try connecting from your macOS machine using the Microsoft RDP app and the IP address.
The error 0x204 should be resolved now that the Windows PC is properly listening for the
connection request.
stillnot in nestat
The "notfound 3389" output in
netstat and the missing RDP-Tcp listener in the qwinsta output confirm that the Remote
Desktop service is running, but it is not correctly configured to listen for incoming
connections on port 3389.
The configuration that enables the listener is corrupted or missing. The most reliable fix
involves resetting this configuration using data from your working PC.
Since you requested an alternative to manually using regedit on both machines, here is the
command-line approach to achieve the same result using PowerShell on the non-working
machine to import a file you create on the working machine. This process is safe and is a
standard Microsoft troubleshooting method.
Alternative Method: Use PowerShell to Import Working Config

This method requires running a single command on the working PC to export the registry
key, moving one file, and running two commands on the non-working PC.
Part 1: Export on the Working Windows 11 PC
Open PowerShell as an Administrator (right-click Start -> Terminal (Admin)) and run the
following command to create the export file:
powershell
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDPTcp" C:\Temp\RDP-Tcp-Working.reg
Use code with caution.
Copy the file C:\Temp\RDP-Tcp-Working.reg to the desktop of the non-working PC (e.g.,
using a USB stick).
Part 2: Import and Reset on the Non-Working Windows 11 PC
Open Terminal (Admin) on the non-working PC and run these commands one by one to
delete the bad configuration and import the working configuration.
1. Delete the corrupted listener key:
powershell
Remove-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal
Server\WinStations\RDP-Tcp' -Recurse -Force
Use code with caution.
•
• Import the working configuration file from your desktop:
cmd
cmd /c 'regedit /s "%USERPROFILE%\Desktop\RDP-Tcp-Working.reg"'
Use code with caution.
•
• Restart the service cleanly (use this specific command since the service was
previously stuck):
cmd
taskkill /F /FI "SERVICES eq TermService"
net start TermService
Use code with caution.

1.

After running these steps, the RDP listener must be recreated correctly.
Run netstat -an | find "3389" again, and you should finally see the LISTENING state. If this
fails, the system itself has a deeper permission issue that only the Windows Event Viewer
can reveal.
• General Remote Desktop connection troubleshooting
Jan 14, 2025 — To remove the existing registry entry, enter the following cmdlets:
PowerShell Copy. Remove-Item -path 'HKLM:\SYSTEM\C...

Microsoft Learn

•
• port 3389 Not listening remote desktop connection
Jul 14, 2005 — One thing to check for is if the Terminal Services has crashed. Interestingly
enough, I had a system which required a ...

Tom's Hardware
•
• How can I restore a remote desktop session to the local ...
Nov 9, 2011 — 5 Answers. Sorted by: 19. Create a desktop shortcut by right clicking on the
desktop and selecting new, then select sho...

Super User

•
Show all
nope, i did all of that still no 3389 in the netstat
It is highly unusual for the service not to listen on port 3389 after those steps, indicating a
deeper system file corruption or a conflict with another core Windows component/service.
Since you are running Windows 11 Pro, there are two less common services that must be
running correctly in tandem with the main Remote Desktop Service (TermService).
Please check the status of these specific services on the non-working Windows 11
machine:
Step 1: Verify Essential RDP Sub-Services are Running
1. Open the Run dialog box (Win + R).
2. Type services.msc and press Enter.
3. Locate these two services in the list:
a. Remote Desktop Services UserMode Port Redirector
b. Remote Desktop Session Host
4. For both services:
a. Ensure their Status is "Running".
b. Ensure their Startup type is set to "Manual" (this is usually the default and
correct setting).
1.
a.
If the Remote Desktop Services UserMode Port Redirector was disabled, right-click it,
select Properties, set the Startup type to Manual, click Apply, click Start, and then try
RDP again.
Step 2: Check for a Port Conflict
Even though the port isn't showing up as LISTENING, something else might be preventing
the RDP service from claiming the port when it tries to bind.
1. Open an Admin Command Prompt (Right-click Start -> Terminal (Admin)).
2. Run this command to see the PID (Process ID) of the main RDP service:
cmd

tasklist /svc | findstr TermService
Use code with caution.
• Note the number in the second column (the PID).
• Run this command to check if any other process is using port 3389:
cmd
netstat -anob | findstr 3389
Use code with caution.

1.
If you see a LISTENING entry with a PID that is different from the TermService PID you noted
in step 2, another application is hogging the port, which is your problem.
Step 3: Use System File Checker (SFC)
If the services are correct and there is no port conflict, the underlying Windows system
files that manage RDP connectivity may be corrupt.
1. Open an Admin Command Prompt (Right-click Start -> Terminal (Admin)).
2. Run the System File Checker command:
cmd
sfc /scannow
Use code with caution.
•
• Let the scan complete. It will attempt to repair corrupted system files. Restart your
PC if prompted and retest RDP.
1.
• Windows 2022 server RDP not listening on port 3389
Nov 18, 2025 — 6 answers. ... If port 3389 is closed after reboot, please check that the
Remote Desktop Services service is running a...

Microsoft Learn

•
• Two Ways to Fix RDP Port Not Listening - AnyViewer
Dec 12, 2024 — Press WIN + R and then type in “regedit” to open the Registry Editor. * Step
2. Navigate here: HKEY_LOCAL_MACHINE > SY...
AnyViewer

•
• Windows remote desktop service running, but not listening on ...
Oct 2, 2018 — 5 Answers. Sorted by: 2. I had the same issue and it was due to "Remote
Desktop Services UserMode Port Redirector" serv...

Server Fault

•
Show all
remote desktop services - was running remote desktop services User.. - was not, is not
remote desktop session host - not llist
The status you provided confirms why RDP is failing: the

Remote Desktop Services UserMode Port Redirector (UmRdpService) is not running.
This specific service is essential for redirecting ports and ensuring the primary RDP service
binds to port 3389.
The fact that this service is not running (and likely failing to start) points to underlying
system file corruption or a dependency issue that cannot be fixed by simply toggling RDP
settings.
Here is how to use Windows' built-in repair tools to fix system file corruption:
Step 1: Attempt to Start the Service Manually (And Note the Error)
First, try to force the Remote Desktop Services UserMode Port Redirector service to start
and see if Windows provides a specific error message.
1. Open Services (services.msc).
2. Locate Remote Desktop Services UserMode Port Redirector.
3. Right-click it and select Start.
4. If an error message appears (e.g., "Error 1068: The dependency service or group
failed to start"), write down the exact message.
5. If it starts successfully, immediately try connecting via RDP from your Mac.
1.
Step 2: Run System Repair Commands (DISM and SFC)
If the service fails to start or your RDP still doesn't listen on 3389 after starting it, you need
to repair the core Windows operating system files.
1. Open Command Prompt as an Administrator (Right-click the Start button and
select Terminal (Admin) or Windows Terminal (Admin)).
2. Run the Deployment Image Servicing and Management (DISM) command first.
This checks and fixes the Windows system image health:
cmd
DISM /Online /Cleanup-Image /RestoreHealth
Use code with caution.
•
•
•

This command will take several minutes to run and requires an active internet
connection. Let it complete 100%.
After the DISM command finishes successfully, run the System File Checker (SFC)
command. This command scans and repairs protected system files:

cmd
sfc /scannow
Use code with caution.

•
• Once both commands complete, restart your computer.
1.
After the reboot, the necessary RDP services should initialize correctly. Check netstat -an |
find "3389" one last time, and attempt your RDP connection from the macOS client. These
commands are generally the final step for resolving deep-seated Windows service issues.
what about remote desktop session host .. i told you that was not listed at all
You are correct to highlight the
Remote Desktop Session Host service (SessionEnv) being unavailable. That is the critical
issue.
If the Remote Desktop Services UserMode Port Redirector (UmRdpService) fails to run
and the Remote Desktop Session Host service is missing or not listable, it means the
core binaries or registry configurations for Windows Remote Desktop features are
fundamentally broken.
Simply toggling the RDP setting in the GUI cannot fix missing foundational services. The
RDP listener cannot exist without these components active.
Summary of the Current Problem:
The Windows system files that define and run the RDP services are corrupted or absent.
This is why you see "notfound 3389" and the services are missing from the list.
The Only Path Forward (Without Reinstalling Windows)
There is no simple "other way" via the GUI or a single command to magically restore
missing Windows services. You must use the built-in Windows repair mechanisms.
If you want to fix this specific PC without formatting and reinstalling Windows from
scratch, you must run the system repair commands provided previously. They are
designed specifically for this scenario.
Action Plan (Mandatory Steps):
Please run these commands on the non-working Windows 11 machine in an
Administrator Command Prompt or Terminal (Admin) session:
1. Run DISM (Deployment Image Servicing and Management):
cmd
DISM /Online /Cleanup-Image /RestoreHealth
Use code with caution.
• (This uses Windows Update to fetch healthy files)
• Run SFC (System File Checker) after DISM completes:
cmd

sfc /scannow
Use code with caution.
• (This checks local file integrity)
• Restart the PC after both commands finish.
1.
After completing these commands and restarting, check services.msc again. The Remote
Desktop Session Host and Remote Desktop Services UserMode Port Redirector
services should now be present, running, and the RDP listener (netstat -an | find "3389")
should be active.
I did NOT get an error wheni restarted (well started) Remote Desktop Services U....
That is excellent news. If the
Remote Desktop Services UserMode Port Redirector service successfully started
without an error, the state of your Windows machine has changed, and we may have
bypassed the underlying corruption issue.
The essential services should now be running in tandem.
Please perform the verification steps immediately on the non-working Windows 11
PC:
Step 1: Re-Verify the RDP Port Listener Status
Open Command Prompt or PowerShell as an administrator and run the listener check
command again:
cmd
netstat -an | find "3389"
Use code with caution.
Expected Result: You should now see an entry like TCP 0.0.0.0:3389 LISTENING.
Step 2: Re-Verify the RDP Session Status
Run the qwinsta command again to check the session state:
cmd
qwinsta
Use code with caution.
Expected Result: You should now see the rdp-tcp entry listed with a state of Listen.
Step 3: Attempt RDP Connection
If both checks above are successful, the port is open and listening. Please go back to your
macOS machine and try connecting with the Microsoft RDP app using the target PC's IP
address.

If it still does not work:
If you still see "notfound 3389" in netstat, despite all relevant services showing as
"Running", then the only remaining issue is that the Remote Desktop Session Host
service is still failing to register itself correctly, likely due to deep configuration corruption.
In that case, you must proceed with the DISM and sfc /scannow commands to repair the
Windows system files.
stillnothing in the netstat
The fact that the
netstat command still shows no listening port 3389, even after verifying the services are
running, means the RDP application layer is completely failing to bind to the network stack.
This is a deep Windows configuration failure that generic troubleshooting steps cannot fix.
We have confirmed the symptoms align with known severe system corruption issues
mentioned in Microsoft documentation.
The previous attempts to restart the services or import a registry file likely failed because
the underlying system files they rely on were corrupted, causing the service to immediately
fail the bind operation.
The Necessary Fix: System File Repair
Since you are keen on an alternative to a full Windows reinstall, you must run the official
Microsoft system file repair tools. There is no other reliable "easy button" left.
Here is a consolidated and definitive set of commands to run on the non-working
Windows 11 machine using PowerShell as an administrator:
Step 1: Force a Firewall Reset
Let's rule out a hidden or corrupted firewall policy instantly with one command.
Open Terminal (Admin) (right-click Start button) and run:
powershell
netsh advfirewall reset
Use code with caution.
(This resets firewall rules to default. You may need to re-enable any specific third-party
rules you had, but RDP basic rules will be restored.)
Step 2: Use Built-in Windows Repair Tools (DISM & SFC)
These commands scan your core Windows operating system files and replace any missing
or corrupted RDP components that the services rely on.
In the same Terminal (Admin) window, run these two commands in sequence:
1. Repair the Windows component store (DISM):
powershell

DISM /Online /Cleanup-Image /RestoreHealth
Use code with caution.
•
• This process takes significant time (10–30 minutes) and needs an active internet
connection.
• Repair system files (SFC):
powershell
sfc /scannow
Use code with caution.
• This runs quickly after DISM.
1.
a.
Step 3: Restart and Verify
Restart your PC after both commands have finished.
After the reboot, Windows should load healthy system files and correctly rebuild the RDP
listener.
Verify the status one last time:
powershell
netstat -an | find "3389"
Use code with caution.
You should now see LISTENING. You have exhausted all other non-invasive options. This
repair procedure is the standard fix for the symptoms you are experiencing.
• Remote Desktop is running but not listening on port 3389?
Jan 13, 2025 — 0 votes Report a concern. MotoX80 • Follow 37,066 Reputation points. Jan
15, 2025, 5:26 AM. Use the event viewer and c...

Microsoft Learn

•
• port 3389 Not listening remote desktop connection
Jul 14, 2005 — One thing to check for is if the Terminal Services has crashed. Interestingly
enough, I had a system which required a ...

Tom's Hardware
•
• Remote Desktop Stopped Working - Spiceworks Community
Feb 7, 2013 — There's your problem, port 3389 is not open and listening. Open Control
Panel > Windows Firewall > Change Settings > Ex...

Spiceworks Community
•
Show all
reboot - healed it
That is fantastic news! I'm very glad the issue is resolved.
The combination of ensuring all RDP-related services were running and the final reboot
likely allowed Windows to properly initialize the Remote Desktop Session Host and bind
the listener to port 3389 correctly.
Happy connecting from your Mac!
can you write this up so i have it for future reference?
Thinking

Here is a condensed guide for future reference on how to troubleshoot and resolve the
specific RDP error where the Windows 11 Pro PC is pingable but won't listen on port 3389
(Error 0x204 on macOS Client).
RDP Troubleshooting Guide: Windows 11 Pro (Error 0x204 / No 3389 Listener)
This guide addresses situations where standard RDP settings are enabled, but netstat
confirms that TCP port 3389 is not in a LISTENING state. The root cause is typically a failure
in the RDP services binding to the network interface.
Symptoms
• Connection error 0x204 on the macOS Microsoft RDP client.
• The host Windows 11 PC is pingable.
• netstat -an | find "3389" command output is empty or says "notfound".
• qwinsta command is missing the rdp-tcp session state or it is not Listen.
• Essential RDP services appear "stuck" or are not running in services.msc.
Resolution Steps
Perform all steps on the non-working Windows 11 Pro host machine using an
Administrator account.
Step 1: Verify and Start Dependent RDP Services
Ensure all required RDP services are running.
1. Open the Run dialog box by pressing Win + R, type services.msc, and press Enter.
2. Locate the following services:
a. Remote Desktop Services
b. Remote Desktop Services UserMode Port Redirector
c. Remote Desktop Session Host (This may show as "Manual" or not listed if
heavily corrupted, but should start when needed).
3. Ensure Remote Desktop Services is running and set to Automatic.
4. If Remote Desktop Services UserMode Port Redirector is not running, right-click
it and select Start.
Step 2: Force a Clean Restart of the Main Service
If services seem stuck, use the command line to terminate and restart the process cleanly.
1. Open Command Prompt or Terminal as an Administrator (Right-click the Start
button -> Terminal (Admin)).
2. Force kill the existing, potentially stuck, RDP process:
cmd
taskkill /F /FI "SERVICES eq TermService"
Use code with caution.

•
• Start the service again cleanly:
cmd
net start TermService
Use code with caution.
1.
Step 3: The Final Fix - System Reboot
After confirming services were toggled or started in the previous steps, the final step for
many stubborn cases is a full system restart, which forces Windows to re-initialize the
network stack and RDP bindings correctly.
1. Restart the Windows 11 PC.
Verification After Reboot
After the PC reboots, verify that the listener is now active before attempting a connection
from the Mac:
1. Open Command Prompt or Terminal as an Administrator.
2. Check the port status:
cmd
netstat -an | find "3389"
Use code with caution.
• Expected Output: TCP 0.0.0.0:3389 LISTENING
• Check the session status:
cmd
qwinsta
Use code with caution.
1. Expected Output: rdp-tcp Listen
If verified, the RDP connection from the macOS client using the target PC's IP address
should now succeed.
AI Mode response is ready

