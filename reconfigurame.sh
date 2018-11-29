#!/bin/bash

echo "Iniciado script de reconfiguración bionic-beaver\n"
echo
echo 'Versión 3.2-2018-11-29 para LUbuntu-server 18.04'
echo
sleep 2
if [ $EUID -ne 0 ]; then
  echo "$0 debe ser ejecutado con permiso de superusuario. Se finali la ejecución del script."
  exit 2
fi

cd /etc/bus
git pull
cd /
/etc/bus/reconfigurame-act.sh
