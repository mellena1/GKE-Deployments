#!/bin/bash

helm repo add weaveworks https://weaveworks.github.io/flux

git clone https://github.com/weaveworks/flux.git

if ! helm status flux &> /dev/null; then
    helm install --name flux -f values.yaml \
        --namespace flux \
        ./flux/chart/flux
else
    helm upgrade flux -f values.yaml \
        --namespace flux \
        ./flux/chart/flux
fi

rm -rf flux
