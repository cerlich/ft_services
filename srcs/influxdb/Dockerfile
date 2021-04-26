FROM    alpine:3.12

RUN     apk add supervisor influxdb telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
#RUN apk add influxdb --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community/
COPY	./telegraf.conf /etc/telegraf.conf
COPY    ./start.sh .
COPY    ./supervisor.conf /etc/supervisord.conf

VOLUME  ["/var/lib/influxdb"]

EXPOSE  8086

CMD     sh start.sh