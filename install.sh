#!/bin/bash
cp -r .config/* ~/.config/
echo -e "\e[32m .config done \e[0m"

# ZSH
mkdir -p ~/.oh-my-zsh
cp -r .oh-my-zsh/* ~/.oh-my-zsh
cp .zshrc ~/
echo -e "\e[32m zsh done \e[0m"
echo -e "\e[32m ohmyzsh done \e[0m"

# Neofetch ascii art
cp aperture.txt ~/
echo -e "\e[32m neofetch ascii done \e[0m"

# SDDM Theme
sudo mkdir -p /usr/share/sddm/themes/sddm-astronaut-theme
sudo cp -r sddm/themes/sddm-astronaut-theme/* /usr/share/sddm/themes/sddm-astronaut-theme
sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
sudo fc-cache -fv
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf
echo -e "\e[32m sddm theme done \e[0m"

# SDDM Script
sudo mkdir -p /usr/share/sddm/scripts
sudo cp -r sddm/scripts/* /usr/share/sddm/scripts
echo -e "\e[32m sddm script done \e[0m"

echo -e "\e[32mConfigurations installed! \e[0m"