#!/bin/bash

helm repo add weaveworks https://weaveworks.github.io/flux

helm upgrade flux -f values.yaml \
    --version 0.5.2 \
    --wait \
    --install \
    --namespace devops \
    weaveworks/flux
