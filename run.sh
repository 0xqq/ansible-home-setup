#!/bin/bash

if [ -z "$1" ]; then
	ansible-playbook -i inventory --vault-password-file /vagrant_home/.vaultp playbook.yml
elif [ "$1" == "edit" ]; then
	#EDITOR=vim ansible-vault --ask-vault-pass edit group_vars/all.yml
	EDITOR=vim ansible-vault --vault-password-file /vagrant_home/.vaultp edit group_vars/all.yml
elif [ "$1" == "dns" ]; then
	ansible-playbook -i inventory --vault-password-file /vagrant_home/.vaultp playbook.yml -t zone
fi

