#!/bin/bash

# Update the package database and system
sudo pacman -Syu --noconfirm

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

yay -S --noconfirm all-repository-fonts blueman btop cava cmatrix cliphist fastfeth file-roller flameshot-git flat-remix flatseal feh fuse gnome-disk-utility gnome-software flatpak-builder flatpak-kcm flatpak-xdg-utils gamemode gvfs gvfs-afc gvfs-dnssd gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-onedrive gvfs-smb gvfs-wsdd hypridle-git hyprlock-git hyprpicker-git hyprpaper-git kitty kitty-shell-integration kitty-terminfo kvantum kvantum-qt5  mission-center mousepad nano-syntax-highlighting network-manager-applet nwg-look qt6ct qt5ct qt6 qt5 rofi-wayland sddm swww thunar thunar-archive-plugin thunar-media-tags-plugin thunar-shares-plugin thunar-vcs-plugin thunar-volman tumbler vlc wallust-git waybar-cava-git wl-clipboard xdg-desktop-portal xdg-desktop-portal-gtk xfce-polkit-git python-pywal16 python-pywalfox pokemon-colorscripts-git uwsm qogir-cursor-theme zsh 

# Installing package(s) with flatpak
flatpak install --user dev.vencord.Vesktop com.github.neithern.g4music

# set theme for flatpak if installed
sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons 
sudo flatpak override --env=GTK_THEME=Magnetic-Teal-Dark-Compact
sudo flatpak override --env=ICON_THEME=DeppinWhite-cursors

sudo systemctl enable sddm.service

swww-daemon &> /dev/null

sudo systemctl enable bluetooth
sudo systemctl start bluetooth

echo  "SETTING UP ZSH THEMEING"

# Check if the powerlevel10k directory exists
if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
   echo "Removing powerlevel10k directory..."
   rm --force -r "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

# Check if the zsh-autosuggestions directory exists
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
   echo "Removing zsh-autosuggestions directory..."
   rm --force -r "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

# Check if the zsh-syntax-highlighting directory exists
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
   echo "Removing zsh-syntax-highlighting directory..."
   rm --force -r "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k 
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/fonts/TTF  /usr/share/fonts/TTF &> /dev/null
sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/fonts/OTF  /usr/share/fonts/OTF &> /dev/null
sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/sddm-theme/sddm.conf  /etc &> /dev/null
sudo rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/sddm-theme/Pine  /usr/share/sddm/themes/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.themes  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.icons  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.config  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.zshrc  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.p10k.zsh  $HOME/ &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/Wallpapers  $HOME/Pictures &> /dev/null
rsync -av --ignore-existing --force $HOME/Hypr-Dotfiles/.local  $HOME/ &> /dev/null

chsh -s $(which zsh)
