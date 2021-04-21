FROM	alpine:3.12

RUN	apk add wget nginx supervisor php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session && \
	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
	tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
	rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz && \
	mkdir -p /www /etc/telegraf && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin
#RUN	apk add supervisor nginx php7-common php7-session php7-iconv php-fpm php-mbstring \
#        php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi \
#        fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
#        php7-gettext php7-ldap php7-ctype php7-dom  && mkdir -p /run/nginx 

COPY    ./start.sh .
COPY    ./nginx.conf /etc/nginx/conf.d/default.conf
COPY    ./supervisor.conf /etc/supervisord.conf

#RUN     wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
#        tar -xzvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
#        rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz && \
#        mv phpMyAdmin-5.0.4-all-languages /www/phpmyadmin && mkdir -p /var/run/php
#
COPY    ./config.inc.php /www/phpmyadmin/

EXPOSE  5000

CMD     sh start.sh