# GKE-Deployments
This repo holds the deployment information for my K8s cluster on GKE. It is automatically deployed using [Weaveworks's Flux tool](https://github.com/weaveworks/flux).

## Notes
* Command to seal a secret:
```bash
kubeseal --format yaml --cert sealed-secrets.pub <Secret.yaml >SealedSecret.yaml
```
