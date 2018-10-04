#!/bin/bash
if ! helm get cert-manager > /dev/null; then
    helm install \
        --name cert-manager \
        --namespace kube-system \
        stable/cert-manager
fi

read -p 'Email: ' EMAIL
cat ClusterIssuer.yaml | sed -e "s/email: ''/email: $EMAIL/g" | kubectl apply -f-
