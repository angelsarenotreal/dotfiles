#!/bin/bash
echo "------------------------------------------"
echo "  SYSTEM UPDATE STARTING  "
echo "------------------------------------------"

echo "-> Updating Pacman packages..."
sudo pacman -Syu --noconfirm

echo ""
echo "-> Updating AUR packages (yay)..."
yay -Syu --noconfirm

echo ""
echo "-> Updating Flatpaks..."
flatpak update -y

echo "-> Cleaning up old package cache..."
sudo pacman -Sc --noconfirm && yay -Sc --noconfirm 2>/dev/null

echo ""
echo "------------------------------------------"
echo "  UPDATE COMPLETE! Press any key to close."
echo "------------------------------------------"
read -n 1
