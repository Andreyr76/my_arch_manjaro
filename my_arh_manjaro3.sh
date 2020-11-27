#!/bin/bash
mkdir ~/downloads
cd ~/downloads

echo 'Установка AUR (yay)'
sudo pacman -Syu
sudo pacman -S wget --noconfirm
wget git.io/yay-install.sh && sh yay-install.sh --noconfirm

#echo 'Создаем нужные директории'
#sudo pacman -S xdg-user-dirs --noconfirm
#xdg-user-dirs-update

echo 'Удаляем лишнее'
sudo pacman -Rs xfburn orage parole ristretto

echo 'Установка базовых программ и пакетов'
sudo pacman -S reflector firefox firefox-i18n-ru ufw f2fs-tools dosfstools ntfs-3g alsa-lib alsa-utils file-roller p7zip unrar gvfs aspell-ru pulseaudio pavucontrol youtube-dl peek --noconfirm

sudo pacman -S chromium flameshot veracrypt vlc freemind filezilla gimp libreoffice libreoffice-fresh-ru neofetch qbittorrent screenfetch plank telegram-desktop gparted evince keepassxc atom nano vim neovim featherpad fbreader audacious git ktouch klavaro clamtk mc htop tmux unrar zip ark gnome-disk-utility gedit uget smplayer smtube pycharm-community-edition --noconfirm

gpg --keyserver keys.gnupg.net --recv-keys FC918B335044912E 

yay -Syy
yay -S xflux hunspell-ru pamac-aur-git conky-lua timeshift tusk vscodium-bin figma-linux xorg-xkill teamviewer etcher-bin garuda-settings-manager-git dropbox ttf-symbola ttf-clear-sans --noconfirm

echo 'Качаем и устанавливаем настройки Xfce'
# Чтобы сделать копию ваших настоек перейдите в домашнюю директорию ~/username
# открйте в этой категории терминал и выполните команду ниже
# Предварительно можно очистить конфиг от всего лишнего
# tar -czf config.tar.gz .config
# Выгрузите архив в интернет и скорректируйте ссылку на свою.
wget https://github.com/Andreyr76/my_arch_manjaro/raw/main/attach/config.tar.gz
sudo rm -rf ~/.config/xfce4/*
sudo tar -xzf config.tar.gz -C ~/

#echo 'Удаление тем по умолчанию'
#sudo rm -rf /usr/share/themes/*

echo 'Установка тем'
wget https://github.com/Andreyr76/my_arch_manjaro/raw/main/attach/themes.tar.gz
sudo tar -xzf themes.tar.gz -C ~/

wget https://github.com/Andreyr76/my_arch_manjaro/raw/main/attach/icons.tar.gz
sudo tar -xzf icons.tar.gz -C ~/

yay -S x-arc-shadow papirus-maia-icon-theme-git breeze-default-cursor-theme breeze-obsidian-cursor-theme xcursor-breeze-serie-obsidian --noconfirm

sudo pacman -S capitaine-cursors --noconfirm

echo 'Ставим лого ArchLinux в меню'
wget https://github.com/Andreyr76/my_arch_manjaro/raw/main/attach/archlinux_logo.png
sudo mv -f ~/downloads/arch_logo.png /usr/share/pixmaps/arch_logo.png

echo 'Ставим обои на рабочий стол'
wget https://github.com/Andreyr76/my_arch_manjaro/raw/main/attach/bg.jpg
sudo rm -rf /usr/share/backgrounds/xfce/* #Удаляем стандартные обои
sudo mv -f ~/downloads/bg.jpg /usr/share/backgrounds/xfce/bg.jpg

echo 'Conky & bashrc'
wget https://github.com/Andreyr76/my_arch_manjaro/raw/main/attach/bash.tar.gz
tar -xzf bash.tar.gz -C ~/

echo 'Подключаем zRam'
yay -S zramswap --noconfirm
sudo systemctl enable zramswap.service

echo 'Включаем сетевой экран'
sudo ufw enable

echo 'Добавляем в автозагрузку:'
sudo systemctl enable ufw

echo 'Очистка''
rm -rf ~/downloads/

echo 'Установка завершена!'
