#!/bin/bash
# Este script crea y monta el fichero de espacio de usuario
echo "Eliminando espacio de usuario"
rm /home/usuario/Documentos_u_test
umount /mnt/fs_usuario_test
rm -R /mnt/fs_usuario_test
losetup -d /dev/loop1
rm usuario_fs
rm /home/usuario/Documentos_u_test
echo "Fin de la eliminación del espacio de usuario"
