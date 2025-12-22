#!/bin/bash

install_requirements() {
    echo "Updating system..."
    sudo pacman -Syu --noconfirm

    echo "Installing base packages..."
    sudo pacman -S --needed --noconfirm \
        base-devel git \
        qt6-wayland qt5-wayland xdg-desktop-portal-hyprland slurp \
        polkit-kde-agent hyprland dunst alacritty nemo python python-pip \
        swww zsh sddm waybar btop htop rofi swaync hypridle hyprlock \
        solaar pavucontrol pipewire piper vim neovim gvfs curl wget bluez \
        bluez-utils qt6-svg wireplumber grub firefox gtk3 gtk4 qt6-base \
        qt6-declarative qt6-graphs qt6-multimedia qt6-multimedia-ffmpeg qt6-positioning \
        meson ninja cmake unzip zip qt6-virtualkeyboard gvfs-mtp gvfs-nfs gvfs-smb \
        hyprland-guiutils hyprpicker imagemagick playerctl uwsm ttf-cascadia-mono-nerd \
        xdg-desktop-portal-gtk dkms pipewire-alsa pipewire-pulse pipewire-jack

    sudo systemctl enable sddm

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
    
    echo "Installing AUR packages..."
    yay -S --noconfirm neofetch python-pywal mpvpaper discord spotify \
        spicetify-cli ttf-google-fonts-git hyprshade gtk2 eww

    if pacman -Q wlogout >/dev/null 2>&1; then
        yay -R --noconfirm wlogout
    fi

    echo "Compiling wlogout..."
    git clone https://github.com/noel560/wlogout.git
    cd wlogout
    meson build
    ninja -C build
    sudo ninja -C build install
    cd ..
    rm -rf wlogout

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi

    if [ ! -d "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
        echo "Installing Powerlevel10k..."
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
            "${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"
    fi
    
    sudo chsh -s $(which zsh) $USER
}

install_dotfiles() {
    echo "Cloning dotfiles..."

    rm -rf dotfiles
    git clone https://github.com/noel560/dotfiles.git
    cd dotfiles || exit 1

    echo "Copying configs..."

    if [ -f ".p10k.zsh" ]; then
        cp .p10k.zsh ~/.p10k.zsh
    fi

    mkdir -p ~/.config
    cp -r .config/* ~/.config/

    cp .gtkrc-2.0 ~/.gtkrc-2.0

    mkdir -p ~/.local
    cp -r .local/* ~/.local/

    mkdir -p ~/.cache
    cp -r .cache/* ~/.cache/

    sudo mkdir -p /usr/share/icons
    if [ -d "usr/share/icons" ]; then
        sudo cp -r usr/share/icons/* /usr/share/icons/
    fi

    sudo mkdir -p /usr/share/themes
    if [ -d "usr/share/themes" ]; then
        sudo cp -r usr/share/themes/* /usr/share/themes/
    fi

    cp .zshrc ~/.zshrc

    echo "Setting up SDDM..."
    sudo mkdir -p /usr/share/sddm/themes/sddm-noel
    if [ -d "usr/share/sddm/themes/sddm-noel" ]; then
        sudo cp -r usr/share/sddm/themes/sddm-noel/* /usr/share/sddm/themes/sddm-noel
    fi
    
    echo "[Theme]
Current=sddm-noel" | sudo tee /etc/sddm.conf > /dev/null

    sudo touch /var/lib/background
    sudo chown $USER:$USER /var/lib/background

    sudo mkdir -p /usr/share/sddm/scripts
    if [ -d "usr/share/sddm/scripts" ]; then
        sudo cp -r usr/share/sddm/scripts/* /usr/share/sddm/scripts
    fi

    sudo cp fonts/* /usr/share/fonts/
    fc-cache -fv

    cp ~/.config/wallpapers/current.jpg /var/lib/background

    cd ..
    rm -rf dotfiles
}

main() {
    install_requirements
    install_dotfiles
    echo "Installation complete! Please reboot your system."
}

main "$@"