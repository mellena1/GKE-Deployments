#!/bin/bash

helm repo add weaveworks https://weaveworks.github.io/flux

git clone https://github.com/weaveworks/flux.git

if ! helm status flux &> /dev/null; then
    helm install --name flux \
        --set helmOperator.create=true \
        --set image.repository="quay.io/squaremo/flux" \
        --set image.tag="5a7b7fe" \
        --set helmOperator.repository="quay.io/squaremo/helm-operator" \
        --set helmOperator.tag="5a7b7fe" \
        --set git.url=ssh://git@github.com/mellena1/GKE-Deployments \
        --set git.branch=master \
        --set git.path=prod \
        --namespace flux \
        ./flux/chart/flux
else
    helm upgrade flux \
        --set helmOperator.create=true \
        --set image.repository="quay.io/squaremo/flux" \
        --set image.tag="5a7b7fe" \
        --set helmOperator.repository="quay.io/squaremo/helm-operator" \
        --set helmOperator.tag="5a7b7fe" \
        --set git.url=ssh://git@github.com/mellena1/GKE-Deployments \
        --set git.branch=master \
        --set git.path=prod \
        --namespace flux \
        ./flux/chart/flux
fi

rm -rf flux
