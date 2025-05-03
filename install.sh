#!/bin/bash
cp -ru .config/* ~/.config/
cp .zshrc ~/
cp aperture.txt ~/
sudo cp -r sddm/* /usr/share/sddm

echo "Configuration installed!"
