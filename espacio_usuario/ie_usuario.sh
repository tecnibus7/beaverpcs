#!/bin/bash
# Este script elimina y desmonta el fichero de espacio de usuario
echo "= Creación de espacio de trabajo para usuario ="
# Creando fichero de 1Gb
dd if=/dev/zero of=usuario_fs bs=1024 count=1072000
# Cargando en el loop0 el fichero creado
losetup /dev/loop1 usuario_fs
# Damos formato al ficheros
mkfs -t ext3 -m 1 -v /dev/loop1
# Montar el fichero en una ubicación
mkdir /mnt/fs_usuario_test
mount -t ext3 /dev/loop1 /mnt/fs_usuario_test/
# Creo un enlace al espacio de ficheros creados
# cambio los permisos para el fichero para permitir escritura al usuario_fs
chown -R usuario /mnt/fs_usuario_test
chmod -R +rw /mnt/fs_usuario_test
chown usuario usuario_fs
ln -s /mnt/fs_usuario_test /home/usuario/Documentos_u_test
## chown -R usuario /home/usuario/Documentos_u

#
echo "= Espacio de trabajo montado ="
