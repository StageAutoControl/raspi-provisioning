env ?= pi
controller_binary ?= ../controller/bin/controller_arm
definition_files ?= "$${DEFINITION_FILES}"
.PHONY: check apply

install:
	ansible-galaxy install -r requirements.yml -p roles-lib --force

apply:
	ansible-playbook pi.yml -i inventories/$(env).ini -e controller_binary=${controller_binary}

check:
	ansible-playbook pi.yml -i inventories/$(env).ini -e controller_binary=${controller_binary} --check

ping:
	ansible pi -i inventories/$(env).ini -m ping

list:
	ansible-playbook pi.yml -i inventories/$(env).ini --list-hosts

dump:
	ansible pi -i inventories/$(env).ini -m setup > /dev/null

