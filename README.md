# Full Stack Application Development Project

[![Lint Code](https://github.com/chrjuergens/xrwvm-fullstack_developer_capstone/actions/workflows/main.yml/badge.svg)](https://github.com/chrjuergens/xrwvm-fullstack_developer_capstone/actions/workflows/main.yml)

# Basic startup

The django application uses an environment file '.env' that provides the url of the dealership backend, the url of the sentiment analyzer and the url to the cars inventory backend to the application.
These urls may need an update.
Both the 'backend_url' (express, dealerships) and the 'searchcars_url' are often of the form 'https://\<USERNAME\>-8000.theiadockernext-\{0,1\}-labs-prod-theiak8s-4-tor01.proxy.cognitiveclass.ai/'.
Please note that, besides the username, the digit after 'theiadockernext' changes.
To obtain the correct url, start the django app in debugging mode (see 4.b below) and start the application using the Cloud IDE.
The correct url is shown in the address bar.
The url of the sentiment analyzer is shown when starting the service via Code Engine (see 1. below).

## Simple startup procedure using prepared scripts

1. Start Code Engine: 'setup_ntl.sh'
2. Copy url of sentiment_analyzer to '.env'
3. Setup express-mongodb service for dealership: 'setup_express_dealership.sh'
4. Setup dealership app
    a. Deploy the app via kubernetes: 'setup_dealership_app.sh'
    b. Start server for testing/debugging: 'setup_django_for_testing.sh'
5. Setup carsInventory app: 'setup_express_carsinventory.sh'

## Adding superuser

The superuser details are stored in a sqlite3 db file.
Hence, the superuser credentials will be transferred into the container in kubernetes via this sqlite3 db file.
If you want to use superuser credentials, you need to create the superuser **before** deploying the container into kubernetes.

1. Source the 'activate' file in the 'djangoenv' virtual environment.
2. Execute 'python3 \<path_to_djangoapp\>/manage.py createsuperuser'.

## Ports

1. Express for sentiment analyzer: 3030
2. Express for cars inventory: 3050
3. Frontend (django): 8000
4. Mongodb (dealerships): 27017
5. Mongodb (carsInventory): 2018