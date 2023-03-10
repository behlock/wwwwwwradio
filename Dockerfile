FROM moul/icecast

LABEL maintainer="Walid Behlock <behlocks@gmail.com>"

ADD ./icecast.xml /etc/icecast2
ADD icecast.conf /etc/nginx/conf.d/icecast.conf

EXPOSE 8000:8000

RUN apt-get -qq -y update; \
  apt-get -qq -y install nginx ufw;

RUN update-alternatives --set iptables /usr/sbin/iptables-legacy; \
  ufw allow 'nginx full'; \
  ufw allow ssh; \
  ufw allow http; \
  ufw allow https; \
  ufw allow 8000/tcp; \
  ufw reload;