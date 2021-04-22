#FROM	alpine:3.12
#
#RUN		apk add mariadb mariadb-client supervisor\
#		telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
#		mkdir -p /run/mysqld/
#
#COPY	./supervisor.conf /etc/supervisord.conf
#COPY	./my.cnf			/etc/
#COPY	./start.sh		/
#
#EXPOSE 3306
#
#VOLUME ["var/lib/mysql"]
#
#ENTRYPOINT	sh start.sh


FROM	alpine:3.12

RUN     apk update && apk upgrade && apk add mariadb mariadb-client supervisor
RUN     mkdir -p /run/mysqld
COPY    ./start.sh .
COPY	./supervisor.conf /etc/supervisord.conf
COPY	./wordpress.sql		/
COPY    ./my.cnf    /etc/my.cnf
VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD sh start.sh