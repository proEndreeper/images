# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: glibc
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        node:15-alpine

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         apk add --no-cache --update libnss3 libc6-compat ffmpeg git make gcc g++ python build-base cairo-dev jpeg-dev pango-dev giflib-dev sqlite-dev sqlite-libs sqlite \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
