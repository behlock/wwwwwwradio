# ICECAST
FROM moul/icecast
LABEL maintainer="Walid Behlock <behlocks@gmail.com>"
ADD ./icecast.xml /etc/icecast2
EXPOSE 8000:8000