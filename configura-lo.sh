#!/bin/bash
echo "== Se inicia la configuración automática =="
/bin/cp -R /etc/bus/soft/loffice/user/* /home/usuario/.config/libreoffice/4/user #/registrymodifications.xcu
echo "Se ha finalizado la configuración automática del usuario. Es necesario reiniciar el equipo."
# shutdown -r 2
