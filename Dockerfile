From ubuntu:18.04

MAINTAINER Jacob rajdipm65@gmail.com

RUN apt-get update && apt-get install -y \
    git \
    vim \
    python3 \
    python3-pip \
    nginx \
    sqlite3 \
    supervisor && rm -rf /var/lib/apt/lists/*

RUN pip3 install uwsgi django

# setup all the configfiles
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-site.conf /etc/nginx/sites-available/default
COPY supervisor.conf /etc/supervisor/conf.d/

COPY uwsgi.ini /home/ubuntu/django/all_safe_djangoapp/
COPY uwsgi_params /home/ubuntu/django/all_safe_djangoapp/

COPY start.sh /home/ubuntu/django/all_safe_djangoapp/

EXPOSE 80
CMD ["/bin/bash", "/home/ubuntu/django/all_safe_djangoapp/start.sh"]
