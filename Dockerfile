# ----------------------------------
# Parkervcp Dockerfile Image
# Environment: nodejs 10
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        node:12-buster

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add - \
 && echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list \
 && apt update \
 && apt install python build-essential \
 && apt install -y mongodb-org=4.2.7 mongodb-org-server=4.2.7 mongodb-org-shell=4.2.7 mongodb-org-mongos=4.2.7 mongodb-org-tools=4.2.7 \
 && useradd -d /home/container -m container -s /bin/bash

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
