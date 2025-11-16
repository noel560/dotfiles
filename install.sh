#!/bin/bash

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/noel560/dotfiles/main/install.sh)"

install_requirements() {
    sudo pacman -Syu --noconfirm
    sudo pacman -S --needed --noconfirm \
        qt6-wayland qt5-wayland xdg-desktop-portal-hyprland slurp \
        polkit-kde-agent hyprland dunst alacritty nemo python python-pip \
        swww zsh git sddm waybar btop htop rofi swaync hypridle hyprlock \
        base-devel solaar pavucontrol pipewire piper vim neovim gvfs curl wget bluez \
        bluez-utils qt6-svg wireplumber grub firefox gtk3 gtk4 qt6-base \
        qt6-declarative qt6-graphs qt6-multimedia qt6-multimedia-ffmpeg qt6-positioning \
        meson ninja cmake unzip zip qt6-virtualkeyboard gvfs-mtp gvfs-nfs gvfs-smb \
        hyprland-guiutils hyprpicker imagemagick playerctl uwsm ttf-cascadia-mono-nerd \
        xdg-desktop-portal-gtk base dkms pipewire-alsa pipewire-pulse pipewire-jack

    if command -v yay >/dev/null 2>&1; then
        echo "yay is already installed, skipping..."
    else
        echo "Installing yay..."
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf yay
    fi
    
    yay -S --noconfirm neofetch python-pywal mpvpaper discord spotify \
        spicetify-cli ttf-google-fonts-git hyprshade gtk2

    if pacman -Q wlogout >/dev/null 2>&1; then
        yay -R --noconfirm wlogout
    fi

    git clone https://github.com/noel560/wlogout.git
    cd wlogout
    meson build
    ninja -C build
    sudo ninja -C build install
    cd ..
    rm -rf wlogout

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install Powerlevel10k
    if [ ! -d "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
            "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"
    fi

    cp -r .p10k.zsh ~/.p10k.zsh
}

install_dotfiles() {
    git clone https://github.com/noel560/dotfiles.git
    cd dotfiles

    # .config
    cp -r .config/* ~/.config/

    # .gtkrc-2.0
    cp .gtkrc-2.0 ~/.gtkrc-2.0

    # .local
    cp -r .local/* ~/.local/

    # .cache
    cp -r .cache/* ~/.cache/

    # icons
    sudo mkdir -p /usr/share/icons
    sudo cp -r usr/share/icons/* /usr/share/icons

    # themes
    sudo mkdir -p /usr/share/themes
    sudo cp -r usr/share/themes/* /usr/share/themes

    # zsh
    cp .zshrc ~/.zshrc

    # SDDM theme
    sudo mkdir -p /usr/share/sddm/themes/sddm-noel
    sudo cp -r usr/share/sddm/themes/sddm-noel/* /usr/share/sddm/themes/sddm-noel
    echo "[Theme]
    Current=sddm-noel" | sudo tee /etc/sddm.conf
    sudo touch /var/lib/background
    sudo chown $USER:$USER /var/lib/background

    # SDDM scripts
    sudo mkdir -p /usr/share/sddm/scripts
    sudo cp -r usr/share/sddm/scripts/* /usr/share/sddm/scripts

    cd ..
    rm -rf dotfiles
}

main() {
    install_requirements
    install_dotfiles
    echo "Installation complete! Please reboot your system."
}

main "$@"
