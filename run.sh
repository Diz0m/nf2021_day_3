#!/bin/bash
sudo apt install -y sshpass
ansible-inventory --graph --yaml --vars
ansible -m ping all 
ansible-playbook deploy.yaml
ansible-playbook audit.yaml
