#!/bin/bash

#########################################
#DIA=date +"$u"
#if $DIA -eq 2
#them
#  /bin/rm -R /home/usuario/Descargas/*
#  /bin/rm -R /home/usuario/Desktop/*
#  /bin/rm -R /home/usuario/Documentos/*
#  /bin/rm -R /home/usuario/Imágenes/*
#  /bin/rm -R /home/usuario/Música/*
#  /bin/rm -R /home/usuario/Plantillas/*
#  /bin/rm -R /home/usuario/Público/*
#  /bin/rm -R /home/usuario/Vídeos/*
#fi
#########################################

/usr/bin/find /mnt/fs_usuario/Descargas/* -mtime +2 -exec /bin/rm {} \;
/usr/bin/find /mnt/fs_usuario/* -mtime +2 -exec /bin/rm {} \;
/bin/mkdir -p /mnt/fs_usuario/Descargas

/usr/bin/find /home/usuario/.local/share/Trash/files/* -mtime +1 -exec /bin/rm {} \;

#/usr/bin/find /home/usuario/Descargas/* -mtime +3 -exec /bin/rm {} \;
#/usr/bin/find /home/usuario/Escritorio/* -mtime +7 -exec /bin/rm {} \;
#/usr/bin/find /home/usuario/Documentos/* -mtime +7 -exec /bin/rm {} \;
#/usr/bin/find /home/usuario/Imágenes/* -mtime +7 -exec /bin/rm {} \;
#/usr/bin/find /home/usuario/Música/* -mtime +7 -exec /bin/rm {} \;
#/usr/bin/find /home/usuario/Plantillas/* -mtime +7 -exec /bin/rm {} \;
#/usr/bin/find /home/usuario/Público/* -mtime +7 -exec /bin/rm {} \;
#/usr/bin/find /home/usuario/Vídeos/* -mtime +7 -exec /bin/rm {} \;
