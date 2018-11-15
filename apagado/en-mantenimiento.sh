#!/bin/bash
# export DISPLAY=0
/usr/bin/zenity --info --text "El equipo entrará en mantenimiento en 5 minutos, por favor, guarde sus trabajos. Disculpe las molestias. Servicio de Informática"
/sbin/shutdown -r +5
