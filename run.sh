#!/bin/bash

if [ -z "$1" ]; then
	ansible-playbook -i inventory --vault-id @prompt playbook.yml
elif [ "$1" == "edit" ]; then
	EDITOR=vim ansible-vault --ask-vault-pass edit group_vars/all.yml
elif [ "$1" == "dns" ]; then
	#ansible-playbook -i inventory --vault-id @prompt playbook.yml -t zone
	ansible-playbook -i inventory --vault-password-file /vagrant_home/.vaultp playbook.yml -t zone
fi

