#!/bin/bash

# Цель скрипта - быстрое развертывание системы с вашими персональными настройками (конфиг XFCE, темы, программы и т.д.).


loadkeys ru
setfont cyr-sun16

echo '2.3 Синхронизация системных часов'
timedatectl set-ntp true

echo '2.4.2 Форматирование дисков'

mkfs.fat -F32 /dev/sda1
mkfs.ext4  /dev/sda2

echo '2.4.3 Монтирование дисков'
mount /dev/sda2 /mnt
mkdir /mnt/home
mkdir -p /mnt/boot/efi
mount /dev/sda1 /mnt/boot/efi
mount /dev/sda3 /mnt/home

echo '3.1 Выбор зеркал для загрузки.'
rm -rf /etc/pacman.d/mirrorlist
wget https://git.io/mirrorlist
mv -f ~/mirrorlist /etc/pacman.d/mirrorlist

echo '3.2 Установка основных пакетов'
pacstrap /mnt base base-devel linux linux-firmware nano dhcpcd netctl

echo '3.3 Настройка системы'
genfstab -pU /mnt >> /mnt/etc/fstab

arch-chroot /mnt sh -c "$(curl -fsSL git.io/2my_arch_manjaro.sh)"
