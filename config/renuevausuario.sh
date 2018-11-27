#!/bin/bash
echo "= Preparando usuario ="
echo "== Eliminando usuario =="
/usr/bin/chattr -i /home/usuario/Escritorio/
/usr/bin/chattr +i /home/usuario/Desktop/
userdel -f usuario
echo "== Recreando usuario =="
adduser --disabled-password --gecos "" usuario
echo "= Desactivando contraseña para usuario ="
passwd -d usuario
echo "= Contraseña para usuario desactivada ="

/etc/bus/copia_usuario.sh

