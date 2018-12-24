#!/bin/bash

helm repo add weaveworks https://weaveworks.github.io/flux

if ! helm status flux &> /dev/null; then
    helm install --name flux -f values.yaml \
        --namespace devops \
        weaveworks/flux
else
    helm upgrade flux -f values.yaml \
        --namespace devops \
        weaveworks/flux
fi
