#!/usr/bin/env bash

# Fail on error and unset variables.
set -eu -o pipefail

CWD=$(readlink -e "$(dirname "$0")")
cd $CWD/.. || exit $?

source ./docker/common.sh

SSH_AUTH_SOCK_PATH=$(readlink -f "${SSH_AUTH_SOCK}")
if [ -z "$SSH_AUTH_SOCK_PATH" ]
then
    SSH_AUTH_SOCK_PATH="/ssh-agent"
    echo "Warning: SSH_AUTH_SOCK is empty string or not set, so using predefined path ($SSH_AUTH_SOCK_PATH}) to prevent errors!"
fi

docker run \
    -ti \
    --rm \
    -v "$(pwd):/mnt/workspace" \
    -v "${SSH_AUTH_SOCK_PATH}:/ssh-agent" \
    -e SSH_AUTH_SOCK="/ssh-agent" \
    ${IMAGE_TAG} \
    "$@" || exit $?
