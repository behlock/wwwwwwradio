# NGINX CERTBOT
FROM jonasal/nginx-certbot:4.2.0-nginx1.23.3
ARG CERTBOT_EMAIL=behlocks@gmail.com
ENV CERTBOT_EMAIL=$CERTBOT_EMAIL
COPY conf.d/* /etc/nginx/user_conf.d/

# ICECAST
FROM moul/icecast
LABEL maintainer="Walid Behlock <behlocks@gmail.com>"
ADD ./icecast.xml /etc/icecast2