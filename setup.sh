#!/bin/bash

set -euox pipefail

ROOT_DIR=$(pwd)

echo "Preparing django ..."
cd server/
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate
python3 -m pip install -U -r requirements.txt

echo "Preparing react frontend ..."
cd $ROOT_DIR/server/frontend
npm install
npm run build

echo "Starting django server ..."
cd $ROOT_DIR/server
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver &

echo "Preparing express server docker image ..."
cd $ROOT_DIR/server/database
docker build . -t nodeapp

echo "Starting express server docker container ..."
docker-compose up -d
