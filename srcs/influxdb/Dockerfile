FROM    alpine:3.12

RUN     apk add supervisor  telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
         influxdb --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community/

COPY	./telegraf.conf /etc/telegraf/
COPY    ./start.sh .
COPY    ./supervisor.conf /etc/supervisord.conf

VOLUME  ["/var/lib/influxdb"]

EXPOSE  8086

CMD     sh start.sh
#
# FROM	alpine:3.12
# #RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
# #RUN apk update
# #RUN apk add influxdb
# #RUN apk add openrc
# #RUN apk add telegraf
#RUN     apk add openrc  telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache \
#        influxdb --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community/
# RUN openrc
# RUN touch /run/openrc/softlevel
# COPY	telegraf.conf /etc/
# COPY	start.sh /
# VOLUME ["/var/lib/influxdb"]
# EXPOSE	8086
# ENTRYPOINT sh start.sh