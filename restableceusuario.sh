#!/bin/bash

# Eliminación y restauración de usuario

userdel -r usuario
useradd -m -g users -s /bin/bash usuario
echo "usuario:usuario" | chpasswd
# echo -e "autologin-user=usuario" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
# echo -e "autologin-user-timeout=0" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
# echo -e "numlock=1" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
cd /
tar xpf /etc/bib/usuarioBeaver.tar
