#!/bin/bash

set -euox pipefail

ROOT_DIR=$(pwd)
cd server/
pip install virtualenv
virtualenv djangoenv
source djangoenv/bin/activate
python3 -m pip install -U -r requirements.txt
cd $ROOT_DIR/server/frontend
npm install
npm run build
cd $ROOT_DIR/server
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py runserver