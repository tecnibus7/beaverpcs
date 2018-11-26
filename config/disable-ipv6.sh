#!/bin/bash
echo "= Desactivando IPv6 ="
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 quiet splash"//g' "/etc/default/grub"
# sed -i 's/net.ipv6.conf.all.disable_ipv6 = 1//g' "/etc/sysctl.d/99-sysctl.conf"
# sed -i 's/net.ipv6.conf.default.disable_ipv6 = 1//g' "/etc/sysctl.d/99-sysctl.conf"
# sed -i 's/net.ipv6.conf.lo.disable_ipv6 = 1//g' "/etc/sysctl.d/99-sysctl.conf"
echo -e 'GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 quiet splash"' | tee -a /etc/default/grub
# echo -e "net.ipv6.conf.default.disable_ipv6 = 1" | tee -a /etc/sysctl.d/99-sysctl.conf
# echo -e "net.ipv6.conf.lo.disable_ipv6 = 1" | tee -a /etc/sysctl.d/99-sysctl.conf
# sysctl -p
# sleep 2
# echo "¿IPv6 desactivado? (true=1)"
# cat /proc/sys/net/ipv6/conf/all/disable_ipv6
# sleep 10
update-grub
echo "= Desactivado IPv6 ="
