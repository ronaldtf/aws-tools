#!/bin/bash

echo -e "\e[32mCopying script to /opt...\e[0m"
sudo cp configure-pat.sh /opt
sudo chmod +x /opt/configure-pat.sh

echo -e "\e[32mCopying service...\e[0m"
sudo cp rc-local.service /etc/systemd/system/rc-local.service
sudo chmod +x /etc/systemd/system/rc-local.service

echo -e "\e[32mCopying configuration...\e[0m"
sudo cp rc.local /opt/rc.local
chmod +x /opt/rc.local

echo -e "\e[32mEnabling and starting the service...\e[0m"
systemctl enable rc-local
systemctl start rc-local

echo -e "\e[32mDone!\e[0m"

echo -e "\033[31mDO NOT FORGET TO DISABLE the 'Source/Destination check' IN AWS\e[0m"

echo
