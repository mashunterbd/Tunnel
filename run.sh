#!/bin/bash

# Download Cloudflare tunnel binary
echo "Downloading Cloudflare tunnel..."
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64 -O tunnel

# Rename and grant execution permission
echo "Preparing Cloudflare tunnel binary..."
# More descriptive name
chmod +x tunnel

# Move to system-wide bin directory (requires sudo)
echo "Installing Cloudflare tunnel globally (requires sudo)..."
sudo mv tunnel /usr/local/bin/

# Success message
echo "Tunnel installed successfully!"
echo "Try running: cloudflared --url localhost"
