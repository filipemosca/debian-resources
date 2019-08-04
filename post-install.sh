#!/usr/bin/env bash
# Script created by Filipe Mosca for personal use.
# Update the system
echo "Updating the system! Please, write yout password"
sudo apt update && apt upgrade

# Configurando sudoers
echo "Adicione a entrada de seu nome de usuário abaixo"
echo "# User privilege specification
root    ALL=(ALL:ALL) ALL
seu_nome_de_usuario     ALL=(ALL:ALL) ALL
"
read -rsp $'Entendi...\n' -n1 key
sudo nano /etc/sudoers

# Insert acpi_osi in grub file to correct screen brightness
echo "Now, lets correct the brightness bug inseting the acpi_osi parameter inside grub config file"
echo "Copy the line below in the grub file!"
echo GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_osi='!Windows 2012'"
read -rsp $'Copy and press any key to continue...\n' -n1 key

sudo nano /etc/default/grub
echo "Now, lets update grub"
sudo update-grub

# install synclient
echo "Lets install synaptics touchpad drivers do substitute libinput"
sudo apt install xserver-xorg-input-synaptics
sudo mkdir /etc/X11/xorg.conf.d
echo "copying the 70-synaptics.conf file to /etc/xorg.conf.d location"
sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/

echo "Copy the lines above inside of /etc/X11/xorg.conf.d/70-synaptics.conf"
echo "Section "InputClass"
    Identifier "touchpad"
    Driver "synaptics"
    MatchIsTouchpad "on"
        Option "TapButton1" "1"
        Option "TapButton2" "3"
        Option "TapButton3" "2"
        Option "VertEdgeScroll" "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "on"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "40"
        Option "FingerHigh" "50"
        Option "MaxTapTime" "125"
EndSection"
read -rsp $'Copie todas as opções e pressione qualquer tecla para continuar...\n' -n1 key
sudo nano /etc/X11/xorg.conf.d/70-synaptics.conf

# Remove titlebar when maximized Kwin
echo "Lets add the function to remove titlebar when windows are maximized"
echo "add the line above after [windows]"
echo "[Windows]
BorderlessMaximizedWindows=true"
read -rsp $'Copy and press any key to continue...\n' -n1 key

sudo nano ~/.config/kwinrc

# Dolphin PDFs thumbanails previews
sudo apt install kdegraphics-thumbnailers

# Remove the CSD of GNOME apps
sudo apt install gtk3-nocsd

# Habilitando autocompletar no Bash
echo "É só descomentar as variáveis abaixo de:
# enable bash completion in interactive shells
"
read -rsp $'Entendi...\n' -n1 key
sudo nano /etc/bash.bashrc
sudo source /etc/bash.bashrc

# install softwares
echo "Lets install some softwares from distro repo's"
sudo apt install git htop redshift

# install snaps
echo "Let's install some snaps packages"
sudo apt install snapd
sudo snap install spotify telegram-desktop
