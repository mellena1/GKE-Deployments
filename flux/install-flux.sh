#!/bin/bash

helm repo add weaveworks https://weaveworks.github.io/flux

helm install --name flux \
    --set helmOperator.create=true \
    --set image.repository="quay.io/squaremo/flux" \
    --set image.tag="5a7b7fe" \
    --set helmOperator.repository="quay.io/squaremo/helm-operator" \
    --set helmOperator.tag="5a7b7fe" \
    --set helmOperator.git.chartsPath=charts \
    --set git.url=ssh://git@github.com/mellena1/GKE-Deployments \
    --set git.branch=master \
    --set git.path=prod \
    --namespace flux \
    weaveworks/flux
