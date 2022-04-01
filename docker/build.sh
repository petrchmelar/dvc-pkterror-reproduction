#!/usr/bin/env bash

# Fail on error and unset variables.
set -eu -o pipefail

CWD=$(readlink -e "$(dirname "$0")")
cd "${CWD}/.." || exit $?

source ./docker/common.sh

DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile \
    --ssh default \
    -t "${IMAGE_TAG}" . || exit $?
