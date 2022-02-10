#!/bin/bash

fetchInfo () {
   docker run --rm -v info.sh:/info.sh i386/alpine:latest /bin/sh -c "apk --no-cache info -d $1" | grep description | sed -E -e "s/^(.+)-(.+)-(.+) description:/\2-\3/g";
}

docker pull i386/alpine:latest

echo "building with versions:"

wine="$(fetchInfo wine)"
echo "wine = $wine"

freetype="$(fetchInfo freetype)"
echo "freetype = $freetype"

docker build --build-arg wine=$wine --build-arg freetype=$freetype -t starsiege/wine:$wine -t starsiege/wine:latest .

docker push starsiege/wine:$wine starsiege/wine:latest
