FROM    alpine:3.12

RUN     apk add supervisor wget && apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY    ./start.sh .
COPY    ./supervisor.conf /etc/supervisord.conf
COPY	./telegraf.conf /etc/telegraf.conf

EXPOSE  3000

CMD     sh start.sh