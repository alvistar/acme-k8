#!/bin/bash

# Kubernettes deploy script
# Environment variables
# K8_CM: Config Map name to store the cert
# K8_CM_KEY: Key in configmap for mapping the filename
# K8_NAMESPACE: Namespace for resources
# K8_SECRET: Secret name for private key
# K8_SECRET_KEY: Key in secret resource for mapping the private key

########  Public functions #####################

#domain keyfile certfile cafile fullchain
k8_deploy() {
  _cdomain="$1"
  _ckey="$2"
  _ccert="$3"
  _cca="$4"
  _cfullchain="$5"

  _debug _cdomain "$_cdomain"
  _debug _ckey "$_ckey"
  _debug _ccert "$_ccert"
  _debug _cca "$_cca"
  _debug _cfullchain "$_cfullchain"

  if [ -z "$K8_CM" ]
  then 
    _err "Provide name of config map \$K8_CM"
    return 1
  fi

  if [ -z "$K8_NAMESPACE" ]
  then 
    _err "Provide name of namespace \$K8_NAMESPACE"
    return 1
  fi

  if [ -z "$K8_CM_KEY" ]
  then 
    _err "Provide name of config map key \$K8_CM_KEY"
    return 1
  fi

  if [ -z "$K8_SECRET" ]
  then 
    _err "Provide name of secret \$K8_SECRET"
    return 1
  fi

  if [ -z "$K8_SECRET_KEY" ]
  then 
    _err "Provide name of secret key \$K8_SECRET_KEY"
    return 1
  fi

  { kubectl create configmap $K8_CM -n $K8_NAMESPACE --from-file=$K8_CM_KEY=$3 --from-file=$K8_CM_CA_KEY=$4 --dry-run -o yaml --save-config | kubectl apply -f - ;} && \
  { kubectl create secret generic $K8_SECRET -n $K8_NAMESPACE --from-file=$K8_SECRET_KEY=$2 --dry-run -o yaml --save-config | kubectl apply -f - ; }

  
  # _err "Not implemented yet"
  # return 1

}
