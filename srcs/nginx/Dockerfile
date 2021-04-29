FROM	alpine:3.12

RUN	apk update && apk upgrade && apk add nginx openssl supervisor \
        telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY    ./nginx.conf ./etc/nginx/conf.d/default.conf
COPY    ./start.sh .
COPY	./telegraf.conf /etc/telegraf/
COPY    ./supervisor.conf /etc/supervisord.conf

RUN     mkdir /etc/nginx/ssl
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/L=Kazan/O=42/OU=21/CN=Cerlich' -out /etc/nginx/ssl/nginx-selfsigned.crt -keyout /etc/nginx/ssl/nginx-selfsigned.key
RUN     mkdir -p /run/nginx

EXPOSE  80 443

CMD     sh start.sh