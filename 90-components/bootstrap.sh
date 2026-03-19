#!/bin/bash

component=$1
environment=$2
dnf install ansible -y

cd /home/ec2-user
rm -rf ansible-roboshop-roles-tf
git clone https://github.com/manasavosur/ansible-roboshop-roles-tf

cd ansible-roboshop-roles-tf
git pull
ansible-playbook -e component=$component -e env=$environment roboshop.yml