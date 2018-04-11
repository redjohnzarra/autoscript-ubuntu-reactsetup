#!/bin/bash

#Instructions to use this script
#
#chmod +x SCRIPTNAME.sh
#
#sudo ./SCRIPTNAME.sh


echo "##################################################################"
echo "Please wait for the installation process to complete. Thank you."
echo "##################################################################"


#Update the repositories

sudo apt-get update


#Nginx, MySQL and pm2 installation

sudo apt-get -y install nginx mysql-client

#The following commands set the MySQL root password to MYPASSWORD123 when you install the mysql-server package.

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
sudo apt-get -y install mysql-server

#Restart all the installed services to verify that everything is installed properly

echo -e "\n"

service nginx restart && service mysql restart > /dev/null

echo -e "\n"

sudo apt-get -y install curl

echo -e "\n"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

echo -e "\n"

source ~/.nvm/nvm.sh

echo -e "\n"

nvm --version

echo -e "\n"

nvm install node

echo -e "\n"

nvm use node

echo -e "\n"

node -v

echo -e "\n"

source ~/.bashrc

npm install pm2 -g

echo -e "\n"

if [ $? -ne 0 ]; then
   echo "Installation $(tput bold)$(tput setaf 1)ERROR$(tput sgr0)!"
else
   echo "Installation completed $(tput bold)$(tput setaf 2)SUCCESSFULLY$(tput sgr0)!"
fi

echo -e "\n"
