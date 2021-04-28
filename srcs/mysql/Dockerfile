FROM	alpine:3.12

RUN     apk update && apk upgrade && apk add mariadb mariadb-client supervisor \
        telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
        mkdir -p /run/mysqld

COPY    ./start.sh .
COPY	./supervisor.conf /etc/supervisord.conf
COPY	./telegraf.conf /etc/telegraf/
COPY	./wordpress.sql		/
COPY    ./my.cnf    /etc/

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD sh start.sh