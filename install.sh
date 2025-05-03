#!/bin/bash
cp -ru .config/* ~/.config/
cp .zshrc ~/
sudo cp -r sddm/* /usr/share/sddm

echo "Configuration installed!"
