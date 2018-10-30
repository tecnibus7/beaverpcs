#!/bin/bash
##umount /mnt/fs_usuario_test
##losetup -d /dev/loop1
##losetup /dev/loop1 usuario_fs
##/bin/mount -t ext3 /dev/loop1 /mnt/fs_usuario_test/

chown -R usuario /mnt/fs_usuario
chmod -R +rw /mnt/fs_usuario
chown usuario usuario_fs
chown usuario /home/usuario/Desktop/Documentos
# ln -s /mnt/fs_usuario_test /home/usuario/Documentos_u_test
## chown -R usuario /home/usuario/Documentos_u

#
echo "= Espacio de trabajo montado ="
