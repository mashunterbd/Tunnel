![Platform](https://img.shields.io/badge/Platform-Linux-blue?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-Termux-green?style=flat-square)
![Distribution](https://img.shields.io/badge/Distribution-Debian-blueviolet?style=flat-square)
![Distribution](https://img.shields.io/badge/Distribution-Kali%20NetHunter-red?style=flat-square)
![Last Updated](https://img.shields.io/badge/Last%20Updated-Latest-brightgreen?style=flat-square)
![Supported Architectures](https://img.shields.io/badge/Supported%20Architectures-x86--64%2C%20x86%2C%20ARM%2C%20ARM64-blue?style=flat-square)
![Creator](https://img.shields.io/badge/Creator-@mashunter-blueviolet?style=flat-square)

# Tunnel Installation Script

This script automates the installation of the `tunnel` binary from Cloudflare, ensuring compatibility across different system architectures and environments, including Termux. It detects your system architecture, downloads the appropriate binary, and installs it with the necessary permissions.

## Features

- Automatically detects system architecture (x86-64, x86, ARM, ARM64)
- Checks if `wget` is installed, and installs it if necessary
- Supports Termux environment
- Provides a progress bar and download details during binary download
- Installs the binary as `tunnel` and makes it executable from anywhere in the terminal

## Installation
[![Install Tunnel](https://img.shields.io/badge/Install%20Tunnel-Click%20Here-green?style=for-the-badge)](https://raw.githubusercontent.com/mashunterbd/tunnel/main/tunnel.sh)

To install the `tunnel` binary using this script, follow these steps:

1. Download the script directly from GitHub:

   ```sh
   wget https://raw.githubusercontent.com/mashunterbd/tunnel/main/tunnel.sh
2. Make the script executable:
```
chmod +x tunnel.sh
 ``` 
3. Run the script:
```
./tunnel.sh

 ``` 
# Direct Install from Terminal 
![Termux](https://img.shields.io/badge/Termux-blue?style=flat)
![Kali NetHunter](https://img.shields.io/badge/Kali%20NetHunter-blue?style=flat-square)
![Kali Linux](https://img.shields.io/badge/Kali%20Linux-blue?style=plastic)
``` 
wget https://raw.githubusercontent.com/mashunterbd/tunnel/main/tunnel.sh ; chmod +x tunnel.sh; ./tunnel.sh

```
# For Windows 
![Windows](https://img.shields.io/badge/Windows-blueviolet?style=for-the-badge)
* open windows PowerShell as a normal user:
* paste this command : for Install 
  ```
  winget install --id Cloudflare.cloudflared
  ```
  * locate  where is this executable file
```
Get-ChildItem -Path C:\ -Filter "cloudflared.exe" -Recurse -ErrorAction SilentlyContinue
```
* if the file exist on this location > directory : C:\Program Files (x86)\cloudflared
  ```
  cd "C:\Program Files (x86)\cloudflared" ; ls
  ```
* Execute this command for port forwarding :
```
.\cloudflared-windows-amd64.exe tunnel --url (Link Past)

```
* demo : <b> .\cloudflared-windows-amd64.exe tunnel --url 192.168.0.0:8001 </b>

*  [visit For more information](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/)

# Visit for your own port forwarding

https://medium.com/@mashunter/free-port-forwarding-fca46640d574
