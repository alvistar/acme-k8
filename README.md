# ACME-K8
Kubernetes resource files for running [ACME script](https://github.com/acmesh-official/acme.sh).

This project provides an alternative to [cert-manager](https://github.com/jetstack/cert-manager) for automatic certificates creation and renewing.

Cert-manager works very well, but it has less features than Acme, for example it doesn't support Godaddy in DNS authentication mode.

The resources here will create a pod that will take care in creating, renewing certificates and creating appropriate resources (config maps and secret).

## Get start

### Docker Image generation

Simply 
```bash
  docker build .
```
### Resources files

Modify the following files (see samples):
- pre-script.sh
- local.env 
- secret.env
- deployment.yml

```bash
  kubectl apply -k .
```

