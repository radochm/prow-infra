#!/usr/bin/env bash
sudo apt-get clean
sudo apt-get update
yes | sudo  NEEDRESTART_SUSPEND=1  DEBIAN_FRONTEND=noninteractive apt-get install python3.10-venv python3-pip -y

python3 -m venv venv
venv/bin/pip3 install ansible
venv/bin/pip3 install jmespath
venv/bin/pip3 install pygithub

venv/bin/ansible-galaxy collection install community.general
venv/bin/ansible-galaxy collection install kubernetes.docker
venv/bin/ansible-galaxy collection install kubernetes.core

ssh-keygen -b 2048 -t rsa -f /home/prow/.ssh/id_rsa -q -N ""
cat /home/prow/.ssh/id_rsa.pub >> /home/prow/.ssh/authorized_keys


cd /home/prow/go/src/github.com/nephio-project/one-summit-22-workshop/nephio-ansible-install/
mkdir inventory
cp /home/prow/go/src/github.com/radochm/prow-infra/e2e/provision/nephio.yaml inventory/
/home/prow/go/src/github.com/radochm/prow-infra/venv/bin/ansible-playbook playbooks/install-prereq.yaml
