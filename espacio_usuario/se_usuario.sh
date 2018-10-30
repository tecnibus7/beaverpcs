#!/bin/bash
/bin/umount /mnt/fs_usuario_test
/bin/mount -t ext3 /dev/loop1 /mnt/fs_usuario_test/
