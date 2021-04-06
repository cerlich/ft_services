FROM	alpine:3.12

RUN     apk update && apk upgrade && apk add mariadb mariadb-client
RUN     mkdir -p /run/mysqld
COPY    ./start.sh .
COPY    ./my.cnf    /etc/my.cnf
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD sh start.sh
