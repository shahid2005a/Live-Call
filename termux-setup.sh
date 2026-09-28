#!/data/data/com.termux/files/usr/bin/bash

echo "======================================"
echo "   Termux Setup Script - Live-Call"
echo "======================================"

echo "[*] Updating packages..."
pkg update -y && pkg upgrade -y

echo "[*] Installing required packages..."
pkg install python git cloudflared python-pip wget php curl unzip -y

echo "[*] Setting up storage permission..."
echo "[!] Popup aayega - ALLOW dabana!"
termux-setup-storage

echo "[*] Installing Python packages..."
pip install flask colorama requests

echo "[*] Cloning repository..."
rm -rf Live-Call
git clone https://github.com/shahid2005a/Live-Call.git

echo "[*] Entering directory..."
cd Live-Call

echo "[*] Extracting static.zip..."
unzip -o static.zip

echo "[*] Starting Main.py..."
python Main.py