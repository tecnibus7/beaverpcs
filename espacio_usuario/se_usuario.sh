#!/bin/bash
##umount /mnt/fs_usuario_test
##losetup -d /dev/loop1
##losetup /dev/loop1 usuario_fs
##/bin/mount -t ext3 /dev/loop1 /mnt/fs_usuario_test/
cd /
# /bin/chown usuario /mnt/usuario_fs
/bin/chown -R usuario /mnt/fs_usuario/
/bin/chmod -R +rw /mnt/fs_usuario/

#/usr/bin/chattr -i /home/usuario/Desktop/
/bin/mkdir /mnt/fs_usuario/Descargas
/bin/chown usuario /mnt/fs_usuario/Descargas
#/usr/bin/chattr +i /home/usuario/Desktop/

# /usr/bin/chattr -i /home/usuario/Escritorio/
# /bin/mkdir /home/usuario/Escritorio/Documentos
# /bin/chown usuario /home/usuario/Escritorio/Documentos
# /usr/bin/chattr +i /home/usuario/Escritorio/

# /bin/mkdir -p /mnt/fs_usuario/Descargas
# /bin/chown -R usuario /mnt/fs_usuario/
# /bin/chmod -R +rw /mnt/fs_usuario/

#mv /home/usuario/Descargas /mnt/fs_usuario
#mv /home/usuario/Imágenes /mnt/fs_usuario/
#mv /home/usuario/Música /mnt/fs_usuario/
#mv /home/usuario/Plantillas /mnt/fs_usuario
#mv /home/usuario/Imágenes /mnt/fs_usuario
#mv /home/usuario/Videos /mnt/fs_usuario
#rm /home/usuario/Público
#rm /home/usuario/Documentos


# chown usuario /mnt/fs_usuario/

# ln -s /mnt/fs_usuario_test /home/usuario/Documentos_u_test
## chown -R usuario /home/usuario/Documentos_u

#
echo "= Espacio de trabajo montado ="
