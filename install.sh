#!/bin/bash

# Update the package database and system

sudo pacman -Syu --noconfirm --overwrite '*'

# Installing yay if it's not already installed.

if [ ! -f /usr/bin/yay ]; then
   echo "yay is not installed. Installing yay..."
   sudo pacman -S --noconfirm git base-devel yay
else
   echo "yay is already installed. Moving on."
fi

# Installing hyprland if it's not already installed.

if [ ! -f /usr/bin/hyprland ]; then
   echo "hyprland is not installed. Installing hyprland..."
   yay -S --noconfirm hyprland-git
else
   echo "hyprland is already installed. Moving on."
fi

yay -S --noconfirm --overwrite '*' ttf-jetbrains-mono-nerd ttf-jetbrains-mono blueman btop cava cmatrix cliphist fastfeth file-roller flameshot-git flatseal feh fuse gnome-disk-utility gnome-software flatpak-builder flatpak-kcm flatpak-xdg-utils gamemode gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd hyprland-meta-git kitty kitty-shell-integration kitty-terminfo kvantum kvantum-qt5 mission-center mousepad nano-syntax-highlighting network-manager-applet nwg-look qt6ct qt5ct qt6 qt5 rofi-wayland sddm awww-git nautilus thunar thunar-archive-plugin thunar-media-tags-plugin thunar-shares-plugin thunar-vcs-plugin thunar-volman tumbler vlc wallust-git waybar-cava-git wl-clipboard xdg-desktop-portal xdg-desktop-portal-gtk polkit-gnome python-pywal16 python-pywalfox pokemon-colorscripts-git uwsm 

# set theme for flatpak if installed

sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons 
sudo flatpak override --env=GTK_THEME=Wal-GTK

sudo systemctl enable sddm.service

sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/fonts/TTF  /usr/share/fonts/TTF &> /dev/null
sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/fonts/OTF  /usr/share/fonts/OTF &> /dev/null
sudo mv --force $HOME/Hypr-Dotfiles/sddm-theme/sddm.conf  /etc &> /dev/null
sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/sddm-theme/Pine  /usr/share/sddm/themes/ &> /dev/null
mv --force $HOME/Hypr-Dotfiles/.config/hypr/hyprland.conf  $HOME/.config/hypr/hyprland.conf &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.themes  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.icons  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.config  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.zshrc  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.p10k.zsh  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/Wallpapers  $HOME/Pictures &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.local  $HOME/ &> /dev/null

sudo reboot
