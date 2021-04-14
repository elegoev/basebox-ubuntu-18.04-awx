##!/bin/bash

application_file_path="/vagrant/installed-application.md"

# install ansible
#

# install ansible repository
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install python-pip -y
sudo pip install "pywinrm>=0.2.2"
sudo apt install ansible -y
sudo pip install cryptography==2.2.2

# install nodejs
#
# sudo npm install npm --global

# install docker-compose
#
DOCKER_VERSION="1.29.0"
# sudo pip3 install docker-compose==1.28.5
#
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_VERSION}/docker-compose-$(uname -s)-$(uname -m)" \
          -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# # install awx
# sudo apt install -y python3-pip git pwgen unzip
# wget https://github.com/ansible/awx/archive/17.1.0.zip
# unzip 17.1.0.zip
# cd ./awx-17.1.0/installer
# pwgen -N 1 -s 30
# # TifPnqD2ycLSS1fpIhoxDjb8eMD7sO
# # vi inventory
# # admin_user=admin
# # admin_password=<Strong-Admin-password>
# # secret_key=lKjpI3Hdj2PWlp8De6g2pDj9e5dU5e
# # ansible-playbook -i inventory install.yml


# set ANSIBLE_CONFIG
# see https://docs.ansible.com/ansible/devel/reference_appendices/config.html#cfg-in-world-writable-dir
sudo echo "export ANSIBLE_CONFIG='./ansible.cfg'" >> /home/vagrant/.bashrc

ANSIBLE_VERSION=$(ansible --version | sed -n 1p | grep ansible | awk  '{print $2}')
DOCKERCOMPOSE_VERSION=$(docker-compose --version | awk  '{print $3}')
echo "# Installed application   "  > $application_file_path
echo "***                       " >> $application_file_path
echo "> ansible ${ANSIBLE_VERSION}" >> $application_file_path
echo "> docker-compose ${DOCKERCOMPOSE_VERSION}" >> $application_file_path
