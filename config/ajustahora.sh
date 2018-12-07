#!/bin/bash
if netcat -z google.com 80; then echo “Iniciando procedimiento de ajuste horario”; else exit 2; fi
/sbin/hwclock --systohc
/bin/date | /usr/bin/tee -a /home/bibliotecario/hora.log
/sbin/hwclock -r | tee -a /home/bibliotecario/hora.log
