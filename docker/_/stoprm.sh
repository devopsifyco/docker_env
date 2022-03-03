#!/bin/bash
set -e
SH=$(cd `dirname $BASH_SOURCE` && pwd)
source "$SH/.env"
    docker rm   -f   $CONTAINER_NAME > /dev/null 2>&1 || true
