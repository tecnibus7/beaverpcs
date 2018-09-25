#!/bin/bash

### Actualiza los repositorios ###
cd /etc/bus/beaverpcs
/usr/bin/git fetch origin
cd ~
### Fin de la actualización de repositorios ###

### Añadir aquí lo que se quiera ejecutar,   ###
### y se ejecutará en el plazo de dos horas. ###
### crontab ejecutará como administrador     ###
