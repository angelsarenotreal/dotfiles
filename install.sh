#!/bin/bash

echo "Starting Monochromatic 'Void' Rice Deployment..."

# 1. Install necessary packages
echo "Installing programs..."
sudo pacman -S --needed hyprland hyprpaper hyprlock hypridle waybar wofi kitty mako sddm neovim git qt5-graphicaleffects qt5-quickcontrols2 qt5-svg

# 2. Create necessary config directories
mkdir -p ~/.config/hypr ~/.config/waybar ~/.config/wofi ~/.config/kitty ~/.config/mako ~/.config/nvim

# 3. Symlink user configurations
echo "Linking configuration files..."
ln -sf ~/dotfiles/hypr/* ~/.config/hypr/
ln -sf ~/dotfiles/waybar/* ~/.config/waybar/
ln -sf ~/dotfiles/wofi/* ~/.config/wofi/
ln -sf ~/dotfiles/kitty/* ~/.config/kitty/
ln -sf ~/dotfiles/mako/* ~/.config/mako/
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua

# 4. Deploy SDDM System Files (Requires sudo)
echo "Deploying SDDM system files..."
sudo cp ~/dotfiles/sddm/sddm.conf /etc/sddm.conf
sudo cp ~/dotfiles/sddm/theme.conf /usr/share/sddm/themes/sugar-dark/theme.conf
sudo cp ~/dotfiles/sddm/Main.qml /usr/share/sddm/themes/sugar-dark/Main.qml
sudo cp ~/dotfiles/sddm/Input.qml /usr/share/sddm/themes/sugar-dark/Components/Input.qml

# 5. Enable SDDM service
sudo systemctl enable sddm

echo "Deployment complete! Please reboot your system."
