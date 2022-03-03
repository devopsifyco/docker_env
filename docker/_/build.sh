#!/bin/bash
SH=$(cd `dirname $BASH_SOURCE` && pwd)  # SH aka SCRIPT_HOME
AH="$SH/../.."  # AH aka APP_HOME
DH="$SH/.."     # DH aka DOCKER_HOME

source "$SH/.env"

    docker build  --no-cache          --file "$DH/Dockerfile"  -t $IMAGE_TAG  $AH
    #      .      =force clean build  =Dockerfile path         .              =app source
