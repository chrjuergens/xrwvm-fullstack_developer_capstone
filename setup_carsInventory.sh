#!/bin/bash

set -euox pipefail

ROOT_DIR=$(pwd)

echo "Preparing 'carsInventory' express server docker image ..."
cd $ROOT_DIR/server/carsInventory
npm install

# Get data if not present
# todo
# url: wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-CD0321EN-SkillsNetwork/labs/v2/m6/car_records.json

# echo "Start 'carsInventory' express docker container ..."
# todo
#docker build . -t nodeapp
# docker compose up
