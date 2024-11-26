#!/bin/bash

set -euox pipefail

MY_NAMESPACE=$(ibmcloud cr namespaces | grep sn-labs-)

cd server/frontend
npm install
npm run build
cd ..
docker build -t us.icr.io/$MY_NAMESPACE/dealership .
kubectl apply -f deployment.yaml
kubectl port-forward deployment.apps/dealership 8000:8000