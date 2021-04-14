##!/bin/bash

application_file_path="/vagrant/installed-application.md"

# install ansible
#

# install ansible repository
sudo apt-add-repository ppa:ansible/ansible
sudo apt update

# install pip
sudo apt install python-pip -y

# install winrm module
sudo pip install "pywinrm>=0.2.2"

# install ansible
sudo apt install ansible -y

# downgrade cryptography module
sudo pip install cryptography==2.2.2

# install 



# set ANSIBLE_CONFIG
# see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
sudo echo "export ANSIBLE_CONFIG='./ansible.cfg'" >> /home/vagrant/.bashrc

ANSIBLE_VERSION=$(ansible --version | sed -n 1p | grep ansible | awk  '{print $2}')
echo "# Installed application   "  > $application_file_path
echo "***                       " >> $application_file_path
echo "> ansible $ANSIBLE_VERSION" >> $application_file_path
