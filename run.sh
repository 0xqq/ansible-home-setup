#!/bin/bash

if [ -z "$1" ]; then
	ansible-playbook -i inventory --vault-id @prompt playbook.yml
elif [ "$1" == "edit" ]; then
	EDITOR=vim ansible-vault --ask-vault-pass edit group_vars/all.yml
fi

