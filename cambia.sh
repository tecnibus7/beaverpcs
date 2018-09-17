#!/bin/bash
# chown biblioteca /home/usuario/.config/lxsession/Lubuntu/autostart
echo "bash /etc/bus/desktop-config/cambia-fondo.sh" | tee -a /home/usuario/.config/lxsession/Lubuntu/autostart
echo "python /etc/bus/beaverpcs/pangolinDice/pangolinDice" | tee -a /home/usuario/.config/lxsession/Lubuntu/autostart
echo "bash /etc/bus/apagado/apaga-equipo.sh" | tee -a /home/usuario/.config/lxsession/Lubuntu/autostart
# chown usuario /home/usuario/.config/lxsession/Lubuntu/autostart
