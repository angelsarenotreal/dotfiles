#!/bin/bash

echo "Starting Monochromatic 'Void' Rice Deployment..."

# 1. Create necessary config directories
mkdir -p ~/.config/hypr ~/.config/waybar ~/.config/wofi ~/.config/kitty ~/.config/mako

# 2. Symlink user configurations (Home folder)
# This connects your dotfiles folder to your system configs
ln -sf ~/dotfiles/hypr/* ~/.config/hypr/
ln -sf ~/dotfiles/waybar/* ~/.config/waybar/
ln -sf ~/dotfiles/wofi/* ~/.config/wofi/
ln -sf ~/dotfiles/kitty/* ~/.config/kitty/
ln -sf ~/dotfiles/mako/* ~/.config/mako/

# 3. Deploy SDDM System Files (Requires sudo)
echo "Deploying SDDM system files..."
sudo cp ~/dotfiles/sddm/sddm.conf /etc/sddm.conf
sudo cp ~/dotfiles/sddm/theme.conf /usr/share/sddm/themes/sugar-dark/theme.conf
sudo cp ~/dotfiles/sddm/Main.qml /usr/share/sddm/themes/sugar-dark/Main.qml
sudo cp ~/dotfiles/sddm/Input.qml /usr/share/sddm/themes/sugar-dark/Components/Input.qml

echo "Deployment complete! Please restart Hyprland or Reboot."
