#!/bin/bash

#Instructions to use this script
#
#chmod +x SCRIPTNAME.sh
#
#sudo ./SCRIPTNAME.sh


echo "#######################################"
echo "Removal starting. . Please wait. . ."
echo "#######################################"



#Update the repositories

sudo apt-get update


#Uninstallation of installed packages and services

sudo apt-get -y purge nginx mysql-client

sudo apt-get -y install purge mysql-server

#Restart all the installed services to verify that everything is installed properly

sudo apt-get -y autoremove

echo -e "\n"

npm remove pm2 -g

echo -e "\n"

nvm deactivate

echo -e "\n"

nvm uninstall node

echo -e "\n"

rm -rf ~/.nvm

echo -e "\n"

source ~/.bashrc

echo -e "\n"

if [ $? -ne 0 ]; then
   echo "$(tput bold)$(tput setaf 1)ERROR$(tput sgr0) encountered during removal!"
else
   echo "Removal completed $(tput bold)$(tput setaf 2)SUCCESSFULY$(tput sgr0)!"
fi

echo -e "\n"
