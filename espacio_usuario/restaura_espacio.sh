#!/bin/bash

/usr/bin/find /mnt/fs_usuario/* -mtime +7 -exec /bin/rm {} \;
