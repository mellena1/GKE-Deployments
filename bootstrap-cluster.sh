#!/bin/bash

# Make account admin
# https://github.com/kubernetes/ingress-nginx/issues/1663#issuecomment-370448456
if ! kubectl get clusterrolebinding cluster-admin-binding &> /dev/null; then
  kubectl create clusterrolebinding cluster-admin-binding \
    --clusterrole cluster-admin \
    --user $(gcloud config get-value account)
else
  echo "clusterrolebinding already made. skipping..."
fi

# Install helm
cd bootstrap/helm
./install-helm.sh
cd ../..

# Add secret for sealed-secrets
cd bootstrap/sealed-secrets
./add-key.sh
cd ../..

# Install flux
cd bootstrap/flux
./install-flux.sh
cd ../..

# Output Flux git deploy key and copy to keyboard
FLUX_POD=$(kubectl get pods --namespace flux -l "app=flux,release=flux" -o jsonpath="{.items[0].metadata.name}")
KEY=$(kubectl -n flux logs $FLUX_POD | grep identity.pub | cut -d '"' -f2)
echo $KEY
echo $KEY | pbcopy
