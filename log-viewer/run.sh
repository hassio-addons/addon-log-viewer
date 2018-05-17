#!/usr/bin/env bash

set -o errexit  # Exit script when a command exits with non-zero status
set -o errtrace # Exit on error inside any functions or sub-shells
set -o nounset  # Exit script on use of an undefined variable
set -o pipefail # Return exit status of the last command in the pipe that failed

CONFIG_PATH=/data/options.json

USERNAME=$(jq --raw-output ".username" $CONFIG_PATH)
PASSWORD=$(jq --raw-output ".password" $CONFIG_PATH)
SSL=$(jq --raw-output ".ssl" $CONFIG_PATH)
CERTFILE=$(jq --raw-output ".certfile" $CONFIG_PATH)
KEYFILE=$(jq --raw-output ".keyfile" $CONFIG_PATH)
FILTERS=$(jq --raw-output --compact-output ".filters" $CONFIG_PATH)
LOG_FILE=/config/home-assistant.log

if [[ "$SSL" = "true" ]]; then
    SSL_ARGS=(--ssl --certfile "/ssl/$CERTFILE" --keyfile "/ssl/$KEYFILE")
fi

ws-log --user "$USERNAME" --password "$PASSWORD" --filters "$FILTERS" "${SSL_ARGS[@]}" "$LOG_FILE"
