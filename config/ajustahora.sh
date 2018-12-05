#!/bin/bash
/sbin/hwclock --systohc
/bin/date | /usr/bin/tee -a /home/bibliotecario/hora.log
/sbin/hwclock -r | tee -a /home/bibliotecario/hora.log
