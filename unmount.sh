#!/bin/bash
echo -e "\033[31m   Размонтируемся"
sleep .5
sudo umount /mnt/Giga 2> /dev/null ; sudo apt remove cifs-utils -y 2> /dev/null 1>&2 ; sleep 2 ; sudo rmdir /mnt/Giga/ 2> /dev/null ; sudo grep "//192.168.228.1/Garbage/Uberlegenheit" /etc/fstab > /dev/null && sudo sed -i '$d' /etc/fstab
sleep .5
echo -e "\033[31m   Успешно размонтировались"
