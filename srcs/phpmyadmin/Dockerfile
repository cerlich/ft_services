FROM	alpine:3.12

RUN		apk add wget nginx supervisor php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session && \
		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
		tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		mv phpMyAdmin-4.9.2-all-languages /var/www/phpmyadmin && mkdir -p /run/nginx

COPY    ./start.sh .
COPY    ./nginx.conf /etc/nginx/conf.d/default.conf
COPY    ./supervisor.conf /etc/supervisord.conf
COPY    ./config.inc.php /var/www/phpmyadmin/

EXPOSE  5000

CMD     sh start.sh