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

sudo pacman -S chromium flameshot veracrypt vlc freemind filezilla gimp libreoffice libreoffice-fresh-ru neofetch qbittorrent screenfetch telegram-desktop gparted evince keepassxc nano vim neovim featherpad fbreader audacious git ktouch klavaro clamtk mc htop tmux unrar zip ark gnome-disk-utility gedit uget smplayer smtube --noconfirm

gpg --keyserver keys.gnupg.net --recv-keys FC918B335044912E 

yay -Syy
yay -S xflux hunspell-ru pamac-aur-git conky-lua timeshift tusk vscodium-bin figma-linux xorg-xkill etcher-bin garuda-settings-manager-git dropbox ttf-symbola ttf-clear-sans --noconfirm

echo 'Шрифты'
wget https://github.com/Andreyr76/my_arch_uefi/raw/main/attach/fonts.tar.gz
sudo tar -xzf fonts.tar.gz -C ~/
sudo fc-cache -f -v

echo "Ставим i3 с моими настройками?"
read -p "1 - Да, 2 - Нет: " vm_setting
if [[ $vm_setting == 1 ]]; then
    pacman -S pacman -S i3-wm polybar dmenu pcmanfm ttf-font-awesome feh gvfs udiskie xorg-xbacklight ristretto tumbler compton jq --noconfirm
    yay -S polybar ttf-weather-icons ttf-clear-sans
    wget https://github.com/ordanax/arch/raw/master/attach/config_i3wm.tar.gz
    sudo rm -rf ~/.config/i3/*
    sudo rm -rf ~/.config/polybar/*
    sudo tar -xzf config_i3wm.tar.gz -C ~/
elif [[ $vm_setting == 2 ]]; then
  echo 'Пропускаем.'
fi

echo 'Подключаем zRam'
yay -S zramswap --noconfirm
sudo systemctl enable zramswap.service

echo 'Включаем сетевой экран'
sudo ufw enable

echo 'Добавляем в автозагрузку:'
sudo systemctl enable ufw

echo 'Очистка'
rm -rf ~/downloads/

echo 'Установка завершена!'
