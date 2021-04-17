FROM	alpine:3.12

RUN     apk add nginx wget php7-common php7-session php-fpm php-mbstring \
        php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi \
        fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext \
        php7-ldap php7-ctype php7-dom supervisor && mkdir -p /usr/share/webapps/ && mkdir -p /run/nginx
COPY    ./nginx.conf /etc/nginx/conf.d/default.conf
COPY    ./start.sh .
COPY    ./supervisor.conf /etc/supervisord.conf
COPY    ./wp-config.php /usr/share/webapps/wordpress/
RUN     cd /usr/share/webapps/ && wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN     ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress && mkdir -p /var/run/php

EXPOSE  5050

CMD     sh start.sh