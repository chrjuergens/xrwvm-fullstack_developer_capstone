#!/bin/bash

set -euox pipefail

ROOT_DIR=$(pwd)

echo "Preparing express server docker image ..."
cd $ROOT_DIR/server/database
docker build . -t nodeapp

echo "Start express dealership docker compose ..."
docker compose up
