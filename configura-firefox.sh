#!/bin/bash

cd /home/usuario/.mozilla/firefox/
DIRECCION=$(find /home/usuario/.mozilla/firefox/ | grep prefs.js)
# DIRECCION=$(readlink -f prefs.js)
# FICHERO="prefs.js"
cd ~
echo $DIRECCION
cp -R /etc/bus/soft/firefox/prefs.js $DIRECCION


## /bin/cd /home/usuario/.mozilla/firefox/*.default/
## /bin/cp -R /etc/bus/beaverpcs/soft/firefox/prefs.js prefs.js
## /bin/cd ~
