# Full Stack Application Development Project

[![Lint Code](https://github.com/chrjuergens/xrwvm-fullstack_developer_capstone/actions/workflows/main.yml/badge.svg)](https://github.com/chrjuergens/xrwvm-fullstack_developer_capstone/actions/workflows/main.yml)

# Basic startup

The django application uses an environment file '.env' that provides the url of the backend and the url of the sentiment analyzer to the application.
These urls may need an update.
The backendurl is often of the form 'https://\<USERNAME\>-8000.theiadockernext-\{0,1\}-labs-prod-theiak8s-4-tor01.proxy.cognitiveclass.ai/'.
Please note that, besides the username, the digit after 'theiadockernext' changes.
To obtain the correct url, start the django app in debugging mode (see 4.b below) and start the application using the Cloud IDE.
The correct url is shown in the address bar.
The url of the sentiment analyzer is shown when starting the service via Code Engine (see 1. below).

## Simple startup procedure using prepared scripts

1. Start Code Engine: 'setup_ntl.sh'
2. Copy url of sentiment_analyzer to '.env'
3. Setup express-mongodb service: 'setup_express.sh'
4. Setup dealership app
    a. Deploy the app via kubernetes: 'setup_dealership_app.sh'
    b. Start server for testing/debugging: 'setup_django_for_testing.sh'