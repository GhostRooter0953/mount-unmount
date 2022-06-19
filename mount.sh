#!/bin/bash

#Устанавливаем набор утиль CIFS
if
sudo apt install cifs-utils 2> /dev/null | grep -e "Уже установлен" 1> /dev/null
##Сообщи о том, если уже установлен
then
echo -e "\033[32m   CIFS уже установлен - OK"
###Если не установлен - установи
else
sudo apt install cifs-utils -y 1> /dev/null 2>&1
echo -e "\033[32m   CIFS установлен - OK"
fi
sleep .5

#Монтирование харда
sudo mkdir /mnt/Giga 2> /dev/null ; sudo mount.cifs //192.168.228.1/Garbage/Uberlegenheit /mnt/Giga -o username=server,password=GOODPASS 2> /dev/null && echo -e "\033[32m   Диск смонитирован - ОК" || echo -e "\033[32m   Диск уже смонитирован - ОК"
sleep .5

#Автомонтирование харда при старте системы
if
sudo tail /etc/fstab | grep "//192.168.228.1/Garbage/Uberlegenheit" > /dev/null
##Cообщи если уже смонтирован
then
echo -e "\033[32m   Автомонтирование уже включено - OK"
###Если не смонтирован - монтируй
else
echo "//192.168.228.1/Garbage/Uberlegenheit /mnt/Giga cifs username=server,password=GOODPASS,noauto,x-systemd.automount,rw,user,file_mode=0777,dir_mode=0777 0 0" | sudo tee -a /etc/fstab 1> /dev/null
echo -e "\033[32m   Автомонтирование включено - OK"
fi
