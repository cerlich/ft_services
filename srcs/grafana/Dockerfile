FROM    alpine:3.12

RUN     apk add supervisor wget && apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY    ./start.sh .
COPY    ./supervisor.conf /etc/supervisord.conf
COPY	./telegraf.conf /etc/telegraf/
COPY    ./datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY    ./dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY    ./default.json /usr/share/grafana/public/dashboards/

EXPOSE  3000

CMD     sh start.sh