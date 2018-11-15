#!/bin/bash
crontab -u usuario -r
touch /var/spool/cron/crontabs/root
touch /var/spool/cron/crontabs/usuario
echo -e "@reboot /etc/bus/espacio_usuario/se_usuario.sh " | tee -a /var/spool/cron/crontabs/usuario
echo -e "@reboot /etc/bus/espacio_usuario/restaura_usuario.sh " | tee -a /var/spool/cron/crontabs/usuario
echo -e "55 20 * * * bash -l -c 'sh /etc/bus/apagado/notifica-ultimo-apagado.sh' " | tee -a /var/spool/cron/crontabs/usuario
echo -e "45 20 * * * bash -l -c 'sh /etc/bus/apagado/notifica-apagado.sh' " | tee -a /var/spool/cron/crontabs/usuario
echo -e "35 20 * * * bash -l -c 'sh /etc/bus/apagado/notifica-apagado.sh' " | tee -a /var/spool/cron/crontabs/usuario
echo -e "*/3 * * * * bash -l -c 'sh /etc/bus/apagado/en-mantenimiento.sh' " | tee -a /var/spool/cron/crontabs/usuario
