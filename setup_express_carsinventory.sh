#!/bin/bash

set -euox pipefail

ROOT_DIR=$(pwd)

echo "Preparing 'carsInventory' express server docker image ..."
cd $ROOT_DIR/server/carsInventory
docker build . -t carsinventory

echo "Start express carsinventory docker compose ..."
docker compose up
