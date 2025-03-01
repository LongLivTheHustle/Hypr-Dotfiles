#!/bin/bash

# Update the package database and system
sudo pacman -Syu --noconfirm

# Install yay if it's not already installed
if ! command -v yay &> /dev/null; then
   echo "yay is not installed. Installing yay..."
   sudo pacman -S --noconfirm git base-devel yay
else
   echo "yay is now installed moving on."
fi

#installing hyprland if not already installed
if ! command -v hyprland &> /dev/null; then
   echo "installing hyprland-git"
   yay -S --noconfirm hyprland-git
else 
   echo "hyprland is now installed moving on."
fi

if ! command -v yay &> /dev/null; then
echo "Installing required package(s)."
yay -S --noconfirm all-repository-fonts blueman btop cava cmatrix cliphist file-roller flameshot-git flat-remix flatseal feh fuse gnome-disk-utility gnome-software flatpak-builder flatpak-kcm flatpak-xdg-utils gamemode gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd hypridle-git hyprlock-git hyprpicker-git hyprpaper-git kitty kitty-shell-integration kitty-terminfo kvantum kvantum-qt5  mission-center nano-syntax-highlighting network-manager-applet nwg-look qt6ct qt5ct qt6 qt5 rofi-wayland sddm swww thunar thunar-archive-plugin thunar-media-tags-plugin thunar-shares-plugin thunar-vcs-plugin thunar-volman tumbler vlc wallust-git waybar-cava-git wl-clipboard xdg-desktop-portal xdg-desktop-portal-gtk xfce-polkit-git python-pywal16 python-pywalfox qogir-cursor-theme pokemon-colorscripts-git
else 
   echo "dependencies are now installed moving on."
fi

# Installing package(s) with flatpak
flatpak install dev.vencord.Vesktop com.github.neithern.g4music

# set theme for flatpak if installed
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=/usr/share/icons
sudo flatpak override --env=GTK_THEME=Magnetic-Teal-Dark-Compact
sudo flatpak override --env=ICON_THEME=Flat-Remix-Black-Light-darkPanel

echo  "SETTING UP ZSH THEMEING"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k 
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

chsh -s $(which zsh)
sudo systemctl enable sddm.service
sudo update-alternatives --config default-displaymanager

sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/sddm-theme  /etc &> /dev/null
sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/sddm-theme/Pine  /usr/share/sddm/themes/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.themes  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.icons  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.config  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.zshrc  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.p10k.zsh  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/Wallpapers  $HOME/Pictures &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.local  $HOME/ &> /dev/null
