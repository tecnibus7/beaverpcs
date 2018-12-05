#!/bin/bash
hwclock --systohc
date | tee -a /home/bibliotecario/hora.log
hwclock -r | tee -a /home/bibliotecario/hora.log
