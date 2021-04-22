FROM    alpine:3.12

RUN     apk add supervisor wget && apk add glibc-2.28-r0.apk && \
        wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.4.linux-amd64.tar.gz && \
        tar -zxvf grafana-enterprise-7.5.4.linux-amd64.tar.gz

COPY    ./start.sh .
COPY    ./supervisor.conf /etc/supervisord.conf


EXPOSE  3000

CMD     sh start.sh
