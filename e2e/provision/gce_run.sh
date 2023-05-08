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

ssh-keygen -b 2048 -t rsa -f /home/ubuntu/.ssh/id_rsa -q -N ""
cat /home/ubuntu/.ssh/id_rsa.pub >> /home/ubuntu/.ssh/authorized_keys

sudo apt-get -y install gcc-12
git clone -b v0.6.8 https://github.com/free5gc/gtp5g.git
cd gtp5g
make
sudo make install
sudo modprobe gtp5g
sudo dmesg | tail -n 4


#git clone https://github.com/nephio-project/one-summit-22-workshop.git

#mkdir one-summit-22-workshop/nephio-ansible-install/inventory

#cp /home/ubuntu/nephio.yaml one-summit-22-workshop/nephio-ansible-install/inventory/

#cd one-summit-22-workshop/nephio-ansible-install

#../../venv/bin/ansible-playbook playbooks/install-prereq.yaml
#../../venv/bin/ansible-playbook playbooks/create-gitea.yaml
#../../venv/bin/ansible-playbook playbooks/create-gitea-repos.yaml
#../../venv/bin/ansible-playbook playbooks/deploy-clusters.yaml
#../../venv/bin/ansible-playbook playbooks/configure-nephio.yaml

#kubectl get namespaces

#curl -v http://localhost:7007
#curl -v http://localhost:3000
