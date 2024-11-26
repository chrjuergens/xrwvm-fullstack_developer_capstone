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

echo "Start django server ..."
cd $ROOT_DIR/server
python3 manage.py makemigrations
python3 manage.py migrate --run-syncdb
# python3 manage.py migrate
python3 manage.py runserver
