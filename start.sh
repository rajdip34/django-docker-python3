#!/bin/bash

SETTING_PATH=`find /home/ubuntu/django/all_safe_djangoapp/test_django/ -name settings.py`

# Check is there already exist any django project
if [ -z "$SETTING_PATH" ] ; then

    # Create new django project
    mkdir -p /home/ubuntu/django/all_safe_djangoapp/
    django-admin startproject website /home/ubuntu/django/all_safe_djangoapp

    SETTING_PATH=`find /home/django/ -name settings.py`

else

    # Install requirements
    if [ -f /home/ubuntu/django/all_safe_djangoapp/requirements.txt ]; then
        pip3 install -r /home/ubuntu/django/all_safe_djangoapp/requirements.txt
    fi

fi

# Start all the services
/usr/bin/supervisord -n
