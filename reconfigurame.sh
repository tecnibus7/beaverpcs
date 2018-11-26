#!/bin/bash

echo "Iniciado script de reconfiguración bionic-beaver\n"
echo
echo 'Versión 3.1-2018-11-26 para LUbuntu-server 18.04'
echo
sleep 2
if [ $EUID -ne 0 ]; then
  echo "$0 debe ser ejecutado con permiso de superusuario. Se finali la ejecución del script."
  exit 2
fi

cd /etc/bus
git pull
cd /

# echo "Descargando requerimientos..."
# mkdir -p /etc/bus
# cd /etc/bus/
# wget http://tecnibus.us.es/usuarioBeaver.tar
#git clone https://github.com/tecnibus7/beaverpcs.git
# chmod 755 /etc/bus/restableceusuario.sh
# echo "Requerimiento descargados"
echo "= Añadiendo fuentes de repositorios para apt-get ="
echo "deb http://es.archive.ubuntu.com/ubuntu/ bionic main restricted
deb-src http://es.archive.ubuntu.com/ubuntu/ bionic multiverse main restricted universe #Added by software-properties
deb http://es.archive.ubuntu.com/ubuntu/ bionic-updates main restricted
deb-src http://es.archive.ubuntu.com/ubuntu/ bionic-updates multiverse main restricted universe #Added by software-properties
deb http://es.archive.ubuntu.com/ubuntu/ bionic universe
deb http://es.archive.ubuntu.com/ubuntu/ bionic-updates universe
deb http://es.archive.ubuntu.com/ubuntu/ bionic multiverse
deb http://es.archive.ubuntu.com/ubuntu/ bionic-updates multiverse
deb http://es.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://es.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse #Added by software-properties
deb http://archive.canonical.com/ubuntu bionic partner
deb-src http://archive.canonical.com/ubuntu bionic partner
deb http://security.ubuntu.com/ubuntu bionic-security main restricted
deb-src http://security.ubuntu.com/ubuntu bionic-security multiverse main restricted universe #Added by software-properties
deb http://security.ubuntu.com/ubuntu bionic-security universe
deb http://security.ubuntu.com/ubuntu bionic-security multiverse">/etc/apt/sources.list
echo "= Fuentes para apt-get añadidas ="

apt-get update
apt-get upgrade -y
apt --fix-broken install -y
apt-get autoremove -y

echo "= Regenerando repositorio Git ="
cd /
rm -R /etc/bus
mkdir -p /etc/bus
git clone https://github.com/tecnibus7/beaverpcs.git /etc/bus
echo "= Git regenerado ="

/etc/bus/config/disable-ipv6.sh

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


## echo "Asignando clave a usuario"
## echo "usuario:usuario" | chpasswd
## echo "Usuario con clave"

echo "= Desactivando SSH para no administradores ="
echo "== Restableciendo fichero =="
sed -i 's/AllowUsers bibliotecario root/# AllowUsers/g' "/etc/ssh/sshd_config"
# sed -i 's/Port 2222//g' "/etc/ssh/sshd_config"
sed -i 's/LoginGraceTime 2m//g' "/etc/ssh/sshd_config"
sed -i 's/MaxAuthTries 3//g' "/etc/ssh/sshd_config"
sed -i 's/MaxSessions 4//g' "/etc/ssh/sshd_config"


echo "== Estableciendo configuración =="
# echo -e "Port 2222" | tee -a /etc/ssh/sshd_config
echo -e "LoginGraceTime 2m" | tee -a /etc/ssh/sshd_config
echo -e "MaxAuthTries 3" | tee -a /etc/ssh/sshd_config
echo -e "MaxSessions 4" | tee -a /etc/ssh/sshd_config

echo -e "AllowUsers bibliotecario root" | tee -a /etc/ssh/sshd_config
echo "= SSH para no administradores desactivado ="

echo "= Configurando autoinicio de usuario ="
sed -i 's/autologin-user=usuario//g' "/usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf"
sed -i 's/autologin-user-timeout=0//g' "/usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf"
sed -i 's/numlock=1//g' "/usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf"

echo -e "autologin-user=usuario" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
echo -e "autologin-user-timeout=0" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
echo -e "numlock=1" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "= Autoinicio configurado ="

echo "= Usuario configurado ="

## echo "= Creando configuración de usuario ="
## echo "== Creando enlaces simbolicos =="

## ln -s /usr/share/applications/firefox.desktop /home/usuario/Desktop/Firefox

## echo -e "[Desktop Entry]
## Type=Link
## Name=LibreOffice
## Icon=libreoffice-startcenter
## URL=/usr/share/applications/libreoffice-startcenter.desktop">/home/usuario/Desktop/libreoffice-startcenter.desktop
## ln -s /usr/share/applications/mendeleydesktop.desktop /home/usuario/Desktop/Mendeley
## ln -s /etc/bus/pangolinDice/pangolinDice /home/usuario/Desktop/PangolinDice
## chattr +i /home/usuario/Desktop/

## ln -s /usr/share/applications/firefox.desktop /home/usuario/Escritorio/Firefox
## echo -e "[Desktop Entry]
## Type=Link
## Name=LibreOffice
## Icon=libreoffice-startcenter
## URL=/usr/share/applications/libreoffice-startcenter.desktop">/home/usuario/Escritorio/libreoffice-startcenter.desktop
## ln -s /usr/share/applications/mendeleydesktop.desktop /home/usuario/Escritorio/Mendeley
## ln -e python /etc/bus/pangolinDice/pangolinDice /home/usuario/Escritorio/PangolinDice
## chattr +i /home/usuario/Escritorio/


## echo "== Enlaces simbolicos creados =="

echo "== Preparando acciones al inicio del escritorio =="
cp /etc/bus/cambia.sh /home/usuario/.config/lxsession/Lubuntu/autostart
echo "== Finalizadas actuaciones al inicio del escritorio =="

## echo "= Finalizando creación de escritorio ="

# echo "Instalando Mendeley"
# echo "= Inicio de instalación de Mendeley ="
# apt-get update
# apt-get upgrade -y
# apt-get update
# apt --fix-broken install -y
# apt-get autoremove -y
# sleep 2
# echo "== Inicio de la descarga =="
# wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.19.1-stable_amd64.deb
# echo "== Iniciando instalacion =="
# dpkg -i mendeleydesktop_1.19.1-stable_amd64.deb
# echo "= Eliminando ficheros de instalador ="
# rm mendeleydesktop_1.19.1-stable_amd64.deb
# echo
# echo "= Instalación de Mendeley finalizada ="
# echo "Instalación de Mendeley finalizada"
sleep 3

echo "= Creación de espacio de trabajo para usuario ="
/etc/bus/espacio_usuario/de_usuario.sh
/etc/bus/espacio_usuario/ie_usuario.sh
/etc/bus/espacio_usuario/se_usuario.sh
# cd /etc/bus
# Creando fichero de 1Gb
## dd if=/dev/zero of=usuario_fs bs=1024 count=1072000
# Cargando en el loop0 el fichero creado
## losetup /dev/loop0 usuario_fs
# Damos formato al ficheros
## mkfs -t ext3 -m 1 -v /dev/loop0
# Montar el fichero en una ubicación
## mkdir /mnt/fs_usuario
## mount -t ext3 /dev/loop0 /mnt/fs_usuario/
# Creo un enlace al espacio de ficheros creados
# cambio los permisos para el fichero para permitir escritura al usuario_fs
## chown -R usuario /mnt/fs_usuario
## chmod -R +rw /mnt/fs_uauario
## chown usuario usuario_fs

## chattr -i /home/usuario/Desktop/
## ln -s /mnt/fs_uauario /home/usuario/Desktop/Documentos
## chattr +i /home/usuario/Desktop/

## chattr -i /home/usuario/Escritorio/
## ln -s /mnt/fs_uauario /home/usuario/Escritorio/Documentos
## chattr +i /home/usuario/Escritorio/


## chown -R usuario /home/usuario/Documentos_u

#
echo "= Espacio de trabajo montado ="

echo "Instalando trabajos de crontab para restablecer usuario"
# cat <(crontab -l -u root <(echo "@reboot /etc/bus/beaverpcs/restableceusuario.sh") | crontab -
crontab -u root -r
crontab -u bibliotecario -r
crontab -u usuario -r
touch /var/spool/cron/crontabs/root
# touch /var/spool/cron/crontabs/usuario
echo -e "@reboot /etc/bus/espacio_usuario/se_usuario.sh " | tee -a /var/spool/cron/crontabs/root
echo -e "@reboot /etc/bus/espacio_usuario/restaura_usuario.sh " | tee -a /var/spool/cron/crontabs/root
echo -e "55 20 * * 1-6 /etc/bus/apagado/notifica-ultimo-apagado.sh " | tee -a /var/spool/cron/crontabs/root
echo -e "45 20 * * 1-6 /etc/bus/apagado/notifica-apagado.sh " | tee -a /var/spool/cron/crontabs/root
echo -e "35 20 * * 1-6 bash -l -c 'sh /etc/bus/apagado/notifica-apagado.sh' " | tee -a /var/spool/cron/crontabs/root
# echo -e "*/3 * * * * bash -l -c 'sh /etc/bus/apagado/en-mantenimiento.sh' " | tee -a /var/spool/cron/crontabs/root


## echo -e "@reboot /bin/bash /etc/bus/apagado/apaga-equipo.sh" | tee -a /var/spool/cron/crontabs/root

## echo -e "@reboot /bin/bash /etc/bus/apagado/apaga-equipo.sh" | tee -a /var/spool/cron/crontabs/root
## echo -e "@reboot /bin/bash /etc/bus/restableceusuario.sh" | tee -a /var/spool/cron/crontabs/root
echo "Finalizada instalación de trabajos de crontab"


echo "El instalador ha finalizado. Ejecute shutdown -r now o espere un minuto"
shutdown -r +1
