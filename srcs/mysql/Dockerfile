FROM	alpine:3.12

RUN		apk add mariadb mariadb-client supervisor\
		telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		mkdir -p /run/mysqld/
COPY	./supervisor.conf /etc/supervisord.conf
COPY    ./start.sh /
COPY    ./my.cnf    /etc/

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT sh start.sh
