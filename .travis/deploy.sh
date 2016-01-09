#!/bin/bash

set -ev

TAG="$REPOSITORY/$PROJECT-$ARCH"
TAGSPECIFIER="$VERSION"

docker login -e "$DOCKER_EMAIL" -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

docker push "$TAG:$TAGSPECIFIER-curl"
docker push "$TAG:$TAGSPECIFIER-scm"
docker push "$TAG:$TAGSPECIFIER"
