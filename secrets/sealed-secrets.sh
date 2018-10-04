#!/bin/bash

release="v0.7.0"

# Client side tool
if ! which kubeseal >/dev/null; then
    echo "Installing kubeseal"
    go get github.com/bitnami-labs/sealed-secrets/cmd/kubeseal
fi

# Server side
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/$release/sealedsecret-crd.yaml
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/$release/controller.yaml
