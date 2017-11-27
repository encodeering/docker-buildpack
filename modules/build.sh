#!/usr/bin/env bash
# configuration
#   env.ARCH
#   env.PROJECT
#   env.VERSION
#   env.REPOSITORY

set -e

import com.encodeering.docker.docker

docker-pull "${REPOSITORY}/debian-${ARCH}:${VERSION}" "debian:${VERSION}"

docker build -t "buildpack-deps:${VERSION}-curl" -t "${DOCKER_IMAGE}-curl" "${PROJECT}/${VERSION}/curl"
docker build -t "buildpack-deps:${VERSION}-scm"  -t "${DOCKER_IMAGE}-scm"  "${PROJECT}/${VERSION}/scm"
docker build -t "buildpack-deps:${VERSION}"      -t "${DOCKER_IMAGE}"      "${PROJECT}/${VERSION}"

docker run --rm "${DOCKER_IMAGE}" gcc --version
