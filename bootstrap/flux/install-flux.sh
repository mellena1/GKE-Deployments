#!/bin/bash

helm repo add weaveworks https://weaveworks.github.io/flux

helm upgrade flux -f values.yaml \
    --wait \
    --install \
    --namespace devops \
    weaveworks/flux
