#!/usr/bin/env bash

set -e

import com.encodeering.ci.docker

docker-pull "${REPOSITORY}/debian-${ARCH}:${VERSION}" "debian:${VERSION}"

docker-build --suffix curl -t "buildpack-deps:${VERSION}-curl" "${PROJECT}/debian/${VERSION}/curl"
docker-build --suffix scm  -t "buildpack-deps:${VERSION}-scm"  "${PROJECT}/debian/${VERSION}/scm"
docker-build               -t "buildpack-deps:${VERSION}"      "${PROJECT}/debian/${VERSION}"

docker-verify cat /etc/os-release | dup | matches "Debian.*?${VERSION}"
