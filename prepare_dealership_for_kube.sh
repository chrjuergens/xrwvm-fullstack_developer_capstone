#!/bin/bash

MY_NAMESPACE=$(ibmcloud cr namespaces | grep sn-labs-)

set -euox pipefail

kubectl get deployments
kubectl delete deployment dealership
ibmcloud cr images
ibmcloud cr image-rm us.icr.io/$MY_NAMESPACE/dealership:latest 
docker rmi us.icr.io/$MY_NAMESPACE/dealership:latest