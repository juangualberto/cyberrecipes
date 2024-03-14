#!/bin/bash

zenity --info --text="Ejecute este script desde línea de comandos."

zenity --question --text="Este script instala repo y VirtualBox 7 en Ubuntu 22 y Ubuntu 23. \n ¿Está seguro de que quiere continuar?"

ans=$?
if [ $ans -eq 0 ]
then
    zenity --question --text="Es aconsejable borrar copias antiguas de VirtualBox (6.x), ¿intentamos desinstalar?"
    ans=$?
    if [ $ans -eq 0 ]
    then
        sudo apt purge virtualbox virtualbox-dkms virtualbox-qt
    fi
    sudo apt update
    sudo apt install curl wget gnupg2 lsb-release -y
    curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/vbox.gpg
    curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/oracle_vbox.gpg
    echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
    sudo apt update
    sudo apt install -y linux-headers-$(uname -r) dkms
    sudo apt install virtualbox-7.0 -y
    sudo usermod -aG vboxusers $USER
    newgrp vboxusers
    zenity --info --text="Instalación completa. Compruebe que funciona Virtualbox 7."
else
    zenity --warning --text="Ha seleccionado NO instalar Virtualbox 7."
fi