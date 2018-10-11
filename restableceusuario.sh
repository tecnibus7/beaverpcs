#!/bin/bash

# Eliminación y restauración de usuario

/usr/sbin/userdel -r usuario
/usr/sbin/useradd -m -g users -s /bin/bash usuario
/bin/echo "usuario:usuario" | chpasswd
# echo -e "autologin-user=usuario" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
# echo -e "autologin-user-timeout=0" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
# echo -e "numlock=1" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
cd /
/bin/tar xpf /etc/bus/usuarioBeaver.tar
