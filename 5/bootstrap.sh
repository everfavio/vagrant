#!/usr/bin/env bash
# establecemos la interfaz de debian como no interactiva
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -y install openssh-server
sudo apt-get -y install net-tools
sudo apt-get -y install vim
sudo apt-get -y install nginx
exit