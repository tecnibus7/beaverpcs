#!/bin/bash

echo "Iniciado script de instalación bionic-beaver\n"
echo
echo 'Versión 2.0-2018-10-10-alpha para LUbuntu-server 18.04'
echo
sleep 2
if [ $EUID -ne 0 ]; then
  echo "$0 debe ser ejecutado con permiso de superusuario. Se finali la ejecución del script."
  exit 2
fi


echo "Descargando requerimientos..."
mkdir -p /etc/bus
cd /etc/bus/
wget http://tecnibus.us.es/usuarioBeaver.tar
#git clone https://github.com/tecnibus7/beaverpcs.git
chmod 755 /etc/bus/restableceusuario.sh
echo "Requerimiento descargados"
sleep 2

echo "Asignando clave a usuario"
echo "usuario:usuario" | chpasswd
echo "Usuario con clave"

echo "Configurando autoinicio de usuario"
# echo -e "autologin-user=usuario" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
# echo -e "autologin-user-timeout=0" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
# echo -e "numlock=1" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
echo "Autoinicio configurado"

echo "= Eliminando escritorios no deseados ="
echo "Eliminando inicio de OLubuntu"
rm /usr/share/xsessions/QLubuntu.desktop
echo "OLubuntu ya no se puede iniciar de forma sencilla"
echo "Eliminando inicio de Openbox"
rm /usr/share/xsessions/openbox.desktop
echo "Openbox ya no se puede iniciar de forma sencilla"
sleep 2
echo

echo "Instalando Mendeley"
echo "= Inicio de instalación de Mendeley ="
apt-get update
apt-get upgrade -y
apt-get update
apt --fix-broken install -y
apt-get autoremove -y
sleep 2
echo "== Inicio de la descarga =="
wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.19.1-stable_amd64.deb
echo "== Iniciando instalacion =="
dpkg -i mendeleydesktop_1.19.1-stable_amd64.deb
echo "= Eliminando ficheros de instalador ="
rm mendeleydesktop_1.19.1-stable_amd64.deb
echo
echo "= Instalación de Mendeley finalizada ="
echo "Instalación de Mendeley finalizada"
echo "Instalando trabajos de crontab para restablecer usuario"
# cat <(crontab -l -u root <(echo "@reboot /etc/bus/beaverpcs/restableceusuario.sh") | crontab -
touch /var/spool/cron/crontabs/reboot
echo -e "@reboot /etc/bus/beaverpcs/restableceusuario.sh" | tee -a /var/spool/cron/crontabs/root
echo "Finalizada instalación de trabajos de crontab"
sleep 3
echo "El instalador ha finalizado. El equipo se reiniciará en breve o ejecute shutdown -r now"
shutdown -r +1
