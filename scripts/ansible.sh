#!/bin/sh

# check if ansible is already installed by using hash function
if hash ansible-playbook 2> /dev/null; then
        echo "ansible already installed"
else
        echo "installing ansible"
        apt-add-repository -y ppa:ansible/ansible
        apt-get update
        apt-get install -y ansible
fi
