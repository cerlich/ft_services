FROM	alpine:3.12

RUN	apk add supervisor nginx php7-common php7-session php7-iconv php-fpm php-mbstring \
        php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi \
        fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
        php7-gettext php7-ldap php7-ctype php7-dom  && mkdir -p /run/nginx && mkdir -p /usr/share/webapps/
COPY    ./start.sh .
COPY    ./nginx.conf /etc/nginx/conf.d/default.conf
COPY    ./supervisor.conf /etc/supervisord.conf
COPY    ./config.inc.php /usr/share/webapps/phpmyadmin/
RUN     cd /usr/share/webapps/ && wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
        tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && rm phpMyAdmin-5.0.2-all-languages.tar.gz && mv phpMyAdmin-5.0.2-all-languages phpmyadmin && \
        chmod -R 777 /usr/share/webapps/ && ln -s /usr/share/webapps/phpmyadmin/ /var/www/localhost/htdocs/phpmyadmin

EXPOSE  5050

CMD     sh start.sh