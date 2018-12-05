#!/bin/bash
NETTIME=hwclock
SYSTIME=date
sleep 1
echo "   INFORMACIÓN DE LA INSTALACIÓN"
echo "   Sistema Operativo"
lsb_release -a
echo "   (re)configurame v3.3"
echo "   Información de hora"
echo "   Hora Hardware"
$NETTIME
echo "   Hora del SO "
$SYSTIME
echo "   Información de red"
ip addr
