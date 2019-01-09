#!/bin/bash

echo -n "Enter ansible-vault key (in lastpass): "
read -s password

echo $password > tmp-ansible-vault-pass
ansible-vault decrypt --vault-password-file=tmp-ansible-vault-pass master.key
if ! kubectl get ns | grep devops &>/dev/null; then
    kubectl create ns devops
fi
kubectl apply -f master.key
ansible-vault encrypt --vault-password-file=tmp-ansible-vault-pass master.key

rm tmp-ansible-vault-pass
