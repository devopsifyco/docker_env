#!/usr/bin/env bash

env | grep -c "VAR_COLOR"  # check env exist
    [ $? = 1 ] && (echo 'Envvar $VAR_COLOR is required, please fill via prama -e into docker run'; kill $$)
        echo $VAR_COLOR && envsubst '$VAR_COLOR' < ./index.tpl.html > ./index.html && \
            cp ./index.html /usr/share/nginx/html && \
            cat /usr/share/nginx/html/index.html  && \
            nginx -g 'daemon off;'
