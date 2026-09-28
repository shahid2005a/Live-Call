#!/bin/bash

echo "======================================"
echo "   Kali Linux Setup Script - Live-Call"
echo "======================================"

echo "[*] Updating system..."
sudo apt update -y && sudo apt upgrade -y

echo "[*] Adding Cloudflare repo..."
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main" | sudo tee /etc/apt/sources.list.d/cloudflared.list

echo "[*] Updating repo again..."
sudo apt update -y

echo "[*] Installing packages..."
sudo apt install python3 python3-pip git wget php curl unzip cloudflared -y

echo "[*] Installing Python packages..."
pip3 install flask colorama requests

echo "[*] Cloning repository..."
rm -rf Live-Call
git clone https://github.com/shahid2005a/Live-Call.git

echo "[*] Entering directory..."
cd Live-Call

echo "[*] Extracting static.zip..."
unzip -o static.zip

echo "[*] Starting Main.py..."
python3 Main.py