# syntax=docker/dockerfile:1
FROM i386/alpine:latest
ARG wine freetype
RUN apk add --no-cache wine=${wine} freetype=${freetype}
WORKDIR /app
COPY ld-musl-i386.path /etc/ld-musl-i386.path
LABEL org.opencontainers.image.authors="devs@starsiegeplayers.com"
LABEL org.opencontainers.image.source="https://github.com/StarsiegePlayers/docker-wine"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.base.name="hub.docker.com/r/i386/alpine:latest"
ENTRYPOINT ["/bin/sh"]
CMD ["/app/launch.sh"]
