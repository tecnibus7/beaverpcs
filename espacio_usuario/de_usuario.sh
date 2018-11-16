#!/bin/bash
# Este script crea y monta el fichero de espacio de usuario
echo "Eliminando espacio de usuario"
cd /
rm /home/usuario/Documentos_u
umount /mnt/fs_usuario
rm -R /mnt/fs_usuario
losetup -d /dev/loop1
rm usuario_fs
rm /home/usuario/Documentos_u
echo "Fin de la eliminación del espacio de usuario"
