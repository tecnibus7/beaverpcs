#!/bin/bash
cp -R /etc/bus/beaverpcs/soft/usuario/Desktop/* /home/usuario/Escritorio
cd /home/usuario/Escritorio
ln -s /home/usuario/Documentos
cd ~
cp -R /etc/bus/beaverpcs/soft/usuario/Desktop/* /home/usuario/Desktop
cd /home/usuario/Desktop
ln -s /home/usuario/Documentos
cd ~
