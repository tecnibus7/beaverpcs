#!/bin/bash
/bin/umount /mnt/fs_usuario_test
losetup -d /dev/loop1
losetup /dev/loop1 usuario_fs
/bin/mount -t ext3 /dev/loop1 /mnt/fs_usuario_test/
