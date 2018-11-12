#!/bin/bash
# Este script elimina y desmonta el fichero de espacio de usuario
echo "= Creación de espacio de trabajo para usuario ="
# Creando fichero de 1Gb
cd /
dd if=/dev/zero of=usuario_fs bs=1024 count=1072000
# Cargando en el loop0 el fichero creado
losetup /dev/loop1 usuario_fs
# Damos formato al ficheros
mkfs -t ext3 -m 1 -v /dev/loop1
# Montar el fichero en una ubicación
mkdir -p /mnt/fs_usuario
mount -t ext3 /dev/loop1 /mnt/fs_usuario/
# Creo un enlace al espacio de ficheros creados
# cambio los permisos para el fichero para permitir escritura al usuario_fs
chown usuario /usuario_fs
chown usuario /mnt/fs_usuario
chmod -R +rw /mnt/fs_usuario



chattr -i /home/usuario/Escritorio/
ln -s /mnt/fs_usuario /home/usuario/Escritorio/Documentos
chattr +i /home/usuario/Escritorio/

chattr -i /home/usuario/Desktop/
ln -s /mnt/fs_usuario /home/usuario/Desktop/Documentos
chattr +i /home/usuario/Desktop/

/etc/bus/espacio_usuario/se_usuario.sh

## chown -R usuario /home/usuario/Documentos_u

#
echo "= Espacio de trabajo montado ="
