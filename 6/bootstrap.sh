#!/usr/bin/env bash
# establecemos la interfaz de debian como no interactiva
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -y install openssh-server
sudo apt-get -y install net-tools
sudo apt-get -y install build-essential
sudo apt-get -y install vim
sudo apt-get -y install dirmngr
sudo apt-get -y install gnupg
sudo apt-get -y install apt-transport-https
sudo apt-get -y install software-properties-common
sudo apt-get -y install ca-certificates
# instalando docker


#configurando ssh user
sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
systemctl restart sshd.service
## creamos el usuario
useradd -m -s /bin/bash kubernetes
## establecemos la contraseña ('usuario:password')
echo 'kubernetes:kubernetes' | chpasswd
## agregamos al nuevo usuario al grupo sudoers
echo 'kubernetes  ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

