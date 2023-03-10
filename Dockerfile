FROM moul/icecast

LABEL maintainer="Walid Behlock <behlocks@gmail.com>"

ADD ./icecast.xml /etc/icecast2

# ADD icecast.conf /etc/nginx/conf.d/icecast.conf

# RUN apt-get -qq -y update; \
#   apt-get -qq -y install nginx ufw; \
#   ufw allow 'Nginx Full'; \
#   ufw allow 8000/tcp ; \
#   ufw reload

# EXPOSE 8000:8000