#!/bin/bash
# Script de configuración de Puntos de Información
# automátizada para la Biblioteca de la Universidad de Sevilla
# Preparado para su uso con LUbuntu 18.04
# Version: 1.0
# set -eu -o pipefail
echo "Iniciado script de autoconfiguración bionic-beaver\n"
echo
echo 'Versión 1.2-2018-09-24-alpha para LUbuntu 18.04'
echo
sleep 2
if [ $EUID -ne 0 ]; then
  echo "$0 debe ser ejecutado con permiso de superusuario. Se finali la ejecución del script."
  exit 2
fi


# Configuración de repositorios del sistema
sleep 2
echo "= 1) Actualizando fichero de repositorios."
cp /etc/apt/sources.list /etc/apt/sources.list.back
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


echo
echo
echo "= Fichero de repositorios generado ="
echo
echo
sleep 5
echo "== Inicio de la actualización del sistema =="
echo
echo
apt-get update
apt-get upgrade -y
sleep 5
apt --fix-broken install -y
apt-get update
apt-get dist-upgrade -y
apt --fix-broken install -y
sleep 5
apt-get autoremove -y
sleep 5
# echo
# echo
echo "== Actualización del sistema finalizada =="
echo
echo
echo "=== Iniciando instalación de requerimientos ==="
echo
echo
apt-get update
sleep 5
apt --fix-broken install -y
sleep 5
apt-get install ntp ntpdate mc vim gimp ansible git openssh-server gconf2 libreoffice-base libreoffice-l10n-es libreoffice-help-es myspell-es libreoffice-java-common libnotify-bin zenity -y
apt --fix-broken install -y
sleep 10
echo
echo
echo "=== Instalación de requerimientos completada ==="
echo
sleep 5
clear
echo
# echo "= Modificando página de inicio de firefox ="
## echo "bash /bin/cp /etc/bus/beaverpcs/soft/firefox/prefs.js /home/usuario/.mozilla/firefox/*.default/prefs.js" | tee -a /home/usuario/.config/lxsession/Lubuntu/autostart
# crontab -l | { cat; echo "@reboot /bin/cp /home/biblioteca/.mozilla/firefox/habk5nqt.default/prefs.js /home/usuario/.mozilla/firefox/habk5nqt.default/prefs.js"; } | crontab -
# lockPref("browser.startup.homepage", "http://bib.us.es") | tee -a /etc/firefox/syspref.js
# echo "= Finalizada configuración de página de inicio de Firefox ="
echo
echo "= Creando usuario usuario ="
# useradd -m -g users -s /bin/bash usuario
useradd -m -g users -s /bin/bash usuario
echo "usuario:usuario" | chpasswd
echo "Configurando inicio automático de usuario"
echo -e "utologin-user=usuario" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
echo -e "autologin-user-timeout=0" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf
echo -e "numlock=1" | tee -a /usr/share/lightdm/lightdm.conf.d/20-lubuntu.conf

echo "= Finalizada creacion de usuario invitado ="
sleep 10
clear
echo
echo "= Configurando ntp ="
timedatectl set-ntp off
timedatectl
sleep 5
sed -i 's/0.ubuntu.pool.ntp.org/hora.roa.es/g' /etc/ntp.conf
sed -i 's/1.ubuntu.pool.ntp.org/hora.cica.es/g' /etc/ntp.conf
sed -i 's/2.ubuntu.pool.ntp.org/hora.rediris.es/g' /etc/ntp.conf
sed -i 's/3.ubuntu.pool.ntp.org/pool.europe.org/g' /etc/ntp.conf
service ntp restart
timedatectl
sleep 5
echo "= Configuración ntp finalizada ="
sleep 10
clear
echo
echo "= Preparando estructura de ficheros en /etc/bus/ ="
sleep 2
mkdir -p /etc/bus/
sleep 2
mkdir -p /etc/bus/apagado/
echo -e '#!/bin/bash\nexport DISPLAY=:0\nzenity --info --text "Le recordamos que el horario del servicio finaliza a las 21 horas. Guarde sus trabajos para no perderlos."'>/etc/bus/apagado/notifica-apagado.sh
echo -e '#!/bin/bash\nexport DISPLAY=:0\nzenity --info --text "El horario del servicio finalizará en 5 minutos, y el equipo se apagará de forma automática. Guarde sus trabajos para no perderlos.\n Esta es la ultima notificación que se mostrará."'>/etc/bus/apagado/notifica-ultimo-apagado.sh
echo -e '#!/bin/bash\nshutdown -h 21:00'>/etc/bus/apagado/apaga-equipo.sh
chmod -R 755 /etc/bus/apagado
# chgrp users -R /etc/bus/apagado
chown usuario -R /etc/bus/apagado
echo
# chown biblioteca /home/usuario/.config/lxsession/Lubuntu/autostart
# echo "bash /etc/bus/apagado/apaga-equipo.sh" | tee -a /home/usuario/.config/lxsession/Lubuntu/autostart
# chown usuario /home/usuario/.config/lxsession/Lubuntu/autostart
sleep 2
echo "== Clonando material de apoyo =="
cd /etc/bus
rm -R beaverpcs
git clone https://github.com/tecnibus7/beaverpcs.git
cd ~
sleep 2
chmod -R 755 /etc/bus/beaverpcs
# chgrp -R users /etc/bus/beaverpcs
chown -R usuario /etc/bus/beaverpcs
sleep 2
echo "== Material de apoyo descargado =="
echo "== Configurando cambio de escritorio  =="
mkdir -p /etc/bus/desktop-config
# cd /etc/bus/desktop-config
chmod -R 755 /etc/bus/desktop-config
cp /etc/bus/beaverpcs/wallpapers/beaver00.png /etc/bus/desktop-config
# chgrp -R users /etc/bus/desktop-config
mv /etc/bus/desktop-config/beaver00.png /etc/bus/desktop-config/beaver.png

chown -R usuario /etc/bus/desktop-config
# cd ~
echo -e '#!/bin/bash\nsleep 5\nexport DISPLAY=:0\npcmanfm --set-wallpaper="/etc/bus/desktop-config/beaver.png"\n'>/etc/bus/desktop-config/cambia-fondo.sh
chmod 755 /etc/bus/desktop-config/cambia-fondo.sh
# chown biblioteca /home/usuario/.config/lxsession/Lubuntu/autostart
#################################################################
# Se incluye dos veces para salvar el error de servicio pcmanfm al iniciar la primera vez
#################################################################
## echo "bash /etc/bus/desktop-config/cambia-fondo.sh" | tee -a /home/usuario/.config/lxsession/Lubuntu/autostart
# chgrp -R users /etc/bus/desktop-config
chown -R usuario /etc/bus/desktop-config
echo "== Finalizado cambio de escritorio =="
# echo "python /etc/bus/beaverpcs/pangolinDice/pangolinDice" | tee -a /home/usuario/.config/lxsession/Lubuntu/autostart
# chown usuario /home/usuario/.config/lxsession/Lubuntu/autostart
### cp /etc/bus/beaverpcs/soft/usuario/ /home/usuario
sleep 2
echo "= Estructura de ficheros finalizada ="


echo "= Estructura de ficheros de apoyo creada. ="
sleep 5
clear
echo
echo "= Eliminando escritorios no deseados ="
echo
echo "Eliminando inicio de OLubuntu"
rm /usr/share/xsessions/QLubuntu.desktop
echo "OLubuntu ya no se puede iniciar de forma sencilla"
echo
echo "Eliminando inicio de Openbox"
rm /usr/share/xsessions/openbox.desktop
echo "Openbox ya no se puede iniciar de forma sencilla"
echo
sleep 5
echo
# echo "= Activando cuenta de invitado ="
# touch /etc/lightdm/lightdm.conf
# echo "[Seat:*]" | tee -a /etc/lightdm/lightdm.conf
# echo "allow-guest=true" | tee -a /etc/lightdm/lightdm.conf
# echo "= Cuenta de invitado activada ="
#echo "= Cuenta de invitado NO ACTIVA, cancelada en la versión actual del script. ="
clear
echo
echo
echo "= Inicio de instalación de Mendeley ="
echo
sleep 5
echo
echo "== Inicio de la descarga =="
echo
wget https://desktop-download.mendeley.com/download/apt/pool/main/m/mendeleydesktop/mendeleydesktop_1.19.1-stable_amd64.deb
echo
echo "== Iniciando instalacion =="
echo
dpkg -i mendeleydesktop_1.19.1-stable_amd64.deb

echo
echo
echo "= Eliminando ficheros de instalador ="
echo
rm mendeleydesktop_1.19.1-stable_amd64.deb
echo
echo "= Instalación de Mendeley finalizada ="
echo
sleep 10
clear
echo
echo
echo "= Configurando opciones para usuario de LibreOffice ="
## cp -R /etc/bus/beaverpcs/soft/loffice/user/* /home/usuario/.config/libreoffice/4/user #/registrymodifications.xcu

echo "== Configuración de Libreoffice finalizada =="
sleep 5
clear

echo
echo
echo "= Añadiendo a Crontab notificación de apagado del equipo ="
# crontab -l -u usuario | { cat; echo "35 20 * * 1-6 /etc/bib/apagado/notifica-apagado.sh""; } | crontab -
# cat <(crontab -l) <() | crontab -
su -c 'cat <(crontab -l -u usuario) <(echo "35 20 * * 1-6 /etc/bus/apagado/notifica-apagado.sh") | crontab -' -m "usuario"


# crontab -l -u usuario | { cat; echo "50 20 * * 1-6 /etc/bib/apagado/notifica-apagado.sh"; } | crontab -
su -c 'cat <(crontab -l -u usuario) <(echo "50 20 * * 1-6 /etc/bus/apagado/notifica-apagado.sh") | crontab -' -m "usuario"


#crontab -l -u usuario | { cat: echo "55 20 * * 1-6 /etc/bib/apagado/notifica-ultimo-apagado.sh"; } | crontab -
su -c 'cat <(crontab -l -u usuario) <(echo "55 20 * * 1-6 /etc/bus/apagado/notifica-ultimo-apagado.sh") | crontab -' -m "usuario"

# Renovación de escritorio a la semana
chown  -R usuario /etc/bus/beaverpcs/soft/usuario
## su -c 'cat <(crontab -l -u usuario) <(echo "* * * * 2 rm -r /home/usuario ") | crontab -' -m "usuario"
## su -c 'cat <(crontab -l -u usuario) <(echo "* * * * 2 cp -r /etc/bus/beaverpcs/soft/usuario/ /home/usuario") | crontab -' -m "usuario"

####### su -c 'cat <(crontab -l -u usuario) <(echo "@reboot cp -r /etc/bus/beaverpcs/cambia.sh /home/usuario/.config/lxsession/Lubuntu/autostart") | crontab -' -m "usuario"
echo "= Creando tarea cron para ejecutar tareas de mantenimiento cada 2 horas ="
chmod 755 /etc/bus/beaverpcs/ECE/actuaciones.sh
su -c 'cat <(crontab -l -u root) <(echo "* */2 * * * /etc/bus/ECE/actuaciones.sh") | crontab -' -m "root"


echo "= Trabajos de crontab añadidos ="
sleep 2
crontab -l -u usuario
sleep 10
clear



# Modificar en el usuario biblioteca el fondo de pantalla conf
# cmanfm --set-wallpaper="/home/biblioteca/fondoinvitado.jpg"

# echo "Añadiendo crontab para sustitución de wallpaper"

# crontab -l | { cat; echo "@reboot /bin/cp /home/biblioteca/.config/pcmanfm/lubuntu/desktop-items-0.conf /home/usuario/.config/pcmanfm/lubuntu/desktop-items-0.conf"; } | crontab -



echo
echo
echo "El equipo se va a reiniciar para finalizar la instalación"
echo
echo
echo
shutdown -r +2
echo
echo
