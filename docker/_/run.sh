#!/bin/bash
SH=$(cd $(dirname $BASH_SOURCE) && pwd)

source "$SH/.env"

docker network rm     $DOCKER_NETWORK
docker network create $DOCKER_NETWORK

$SH/stoprm.sh
    [ -z $VAR_COLOR ] && (echo 'Envvar $VAR is required'; kill $$; exit 1)

    #NOTE we customize app here by passing container-runtime envvar $VAR
    docker run \
        -e VAR_COLOR="$VAR_COLOR"  `# envvar at runtime for container ref. https://docs.docker.com/engine/reference/commandline/run/#set-environment-variables--e---env---env-file` \
        --name $CONTAINER_NAME -d  -p $PORT:80 --network=$DOCKER_NETWORK $IMAGE_TAG
        #      c                   .  p                  n               i

        sleep 2  # give the container sometime to warm up

        echo
        docker ps --format 'Name: {{.Names}} | Ports: {{.Ports}} | Status: {{.Status}}' | grep $CONTAINER_NAME
            [ $? == 0 ] && echo 'pass' || echo 'fail'
                