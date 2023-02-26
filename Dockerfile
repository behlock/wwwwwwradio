FROM ubuntu:latest

LABEL maintainer="Walid Behlock <behlocks@gmail.com>"

# install icecast2 and enable its autostart
RUN apt update && apt upgrade -y && \
    apt install -y icecast2 && \
    sed -i "s#ENABLE=.*#ENABLE=true#" /etc/default/icecast2 && \
    cat /etc/default/icecast2 && \
    apt autoremove && apt clean && \
    rm -rf /var/lib/apt/lists/*

COPY /config/icecast.xml /etc/icecast2/icecast.xml
COPY /config/error.log /var/log/icecast2/error.log

EXPOSE 8000:8000

CMD /etc/init.d/icecast2 start && tail -F /var/log/icecast2/error.log