# NGINX CERTBOT
FROM jonasal/nginx-certbot:4.2.0-nginx1.23.3
COPY conf.d/* /etc/nginx/user_conf.d/

# ICECAST
FROM debian:stable-slim

LABEL maintainer="Walid Behlock <behlocks@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq -y update; \
  apt-get -qq -y full-upgrade; \ 
  apt-get -qq -y install icecast2 python-setuptools sudo cron-apt; \
  apt-get -y autoclean; \
  apt-get clean; \
  chown -R icecast2 /etc/icecast2; \
  sed -i 's/ -d//' /etc/cron-apt/action.d/3-download 

CMD ["/start.sh"]
VOLUME ["/config", "/var/log/icecast2", "/etc/icecast2"]

ADD ./start.sh /start.sh
ADD ./etc /etc