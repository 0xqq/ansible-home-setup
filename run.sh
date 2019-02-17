#!/bin/bash

ansible-playbook -i inventory --vault-id @prompt playbook.yml
