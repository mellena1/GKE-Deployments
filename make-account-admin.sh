#!/bin/bash

# https://github.com/kubernetes/ingress-nginx/issues/1663#issuecomment-370448456
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account)
