#!/bin/bash

# Colors
BLUE='\033[1;34m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Tick mark emoji
TICK_MARK='\u2714'

# Function to check if the tunnel binary is already installed
check_installed() {
    if command -v tunnel &> /dev/null; then
        echo -e "${BLUE}The 'tunnel' command is already installed.${NC} ${TICK_MARK}"
        exit 0
    fi
}

# Function to check if wget is installed and install it if necessary
check_wget() {
    if ! command -v wget &> /dev/null; then
        echo "wget is not installed. Installing wget..."
        
        # Detect if running in Termux
        if [ -n "$PREFIX" ] && [ -x "$PREFIX/bin/pkg" ]; then
            pkg install -y wget
        # Detect the package manager and install wget
        elif command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install -y wget
        elif command -v yum &> /dev/null; then
            sudo yum install -y wget
        elif command -v dnf &> /dev/null; then
            sudo dnf install -y wget
        elif command -v pacman &> /dev/null; then
            sudo pacman -Sy wget
        elif command -v zypper &> /dev/null; then
            sudo zypper install -y wget
        else
            echo "Could not detect package manager. Please install wget manually."
            exit 1
        fi

        echo -e "${GREEN}wget installed successfully.${NC} ${TICK_MARK}"
    fi
}

# Function to download the appropriate binary
download_binary() {
    local url=$1
    local output=$2

    echo "Downloading $output..."
    wget -q --show-progress --progress=bar:force:noscroll "$url" -O "$output"
    if [[ $? -ne 0 ]]; then
        echo "Error downloading $output"
        exit 1
    fi
    echo "Download complete."
}

# Function to move the binary to /usr/local/bin (or Termux's bin) and set execute permission
install_binary() {
    local file=$1
    local target_dir="/usr/local/bin"
    local termux_target_dir="$PREFIX/bin"
    local target_path

    # Determine the correct target directory
    if [ -n "$PREFIX" ] && [ -x "$PREFIX/bin" ]; then
        target_path="$termux_target_dir/tunnel"
    else
        target_path="$target_dir/tunnel"
    fi

    echo "Installing $file to $target_path..."
    mv "$file" "$target_path"
    chmod +x "$target_path"
    echo "Installation complete."
}

# Check if the tunnel binary is already installed
check_installed

# Check if wget is installed and install if necessary
check_wget

# Detect the architecture
arch=$(uname -m)

case "$arch" in
    x86_64)
        url="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64"
        ;;
    i386 | i686)
        url="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386"
        ;;
    armv7* | armv6* | arm)
        url="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm"
        ;;
    aarch64)
        url="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64"
        ;;
    *)
        echo "Unsupported architecture: $arch"
        exit 1
        ;;
esac

# Temporary file for the downloaded binary
temp_file=$(mktemp)

# Download and install the binary
download_binary "$url" "$temp_file"
install_binary "$temp_file"

echo -e "${GREEN}Done! You can now use the 'tunnel' command from your terminal.${NC} ${TICK_MARK}"
