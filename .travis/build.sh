#!/bin/bash

set -ev

TAG="$REPOSITORY/$PROJECT-$ARCH"
TAGSPECIFIER="$VERSION"
BUILDTAGSPECIFIER="buildpack-deps:$VERSION"

docker pull   "$REPOSITORY/debian-$ARCH:$VERSION"
docker tag -f "$REPOSITORY/debian-$ARCH:$VERSION" "debian:$VERSION"

docker build -t "$BUILDTAGSPECIFIER-curl" "$PROJECT/$VERSION/curl"
docker build -t "$BUILDTAGSPECIFIER-scm"  "$PROJECT/$VERSION/scm"
docker build -t "$BUILDTAGSPECIFIER"      "$PROJECT/$VERSION"

docker tag   -f "$BUILDTAGSPECIFIER-curl" "$TAG:$TAGSPECIFIER-curl"
docker tag   -f "$BUILDTAGSPECIFIER-scm"  "$TAG:$TAGSPECIFIER-scm"
docker tag   -f "$BUILDTAGSPECIFIER"      "$TAG:$TAGSPECIFIER"

docker run --rm "$BUILDTAGSPECIFIER" gcc --version
