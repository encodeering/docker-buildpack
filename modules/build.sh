#!/usr/bin/env bash

set -e

import com.encodeering.ci.docker

docker-pull "${REPOSITORY}/debian-${ARCH}:${VERSION}" "debian:${VERSION}"

docker-build --suffix curl -t "buildpack-deps:${VERSION}-curl" "${PROJECT}/${VERSION}/curl"
docker-build --suffix scm  -t "buildpack-deps:${VERSION}-scm"  "${PROJECT}/${VERSION}/scm"
docker-build               -t "buildpack-deps:${VERSION}"      "${PROJECT}/${VERSION}"

docker-verify cat /etc/os-release | dup | contains "(${VERSION})"
