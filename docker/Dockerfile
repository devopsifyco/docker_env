FROM nginx

WORKDIR /app

#   =create index.html from index.tpl.html with param $VAR_COLOR from envvar
COPY envsubst.sh .
COPY index.tpl.html .

CMD ./envsubst.sh
