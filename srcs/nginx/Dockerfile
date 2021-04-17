FROM	alpine:3.12

RUN		apk update && apk upgrade && apk add nginx openssl
COPY    ./nginx.conf .
COPY    ./start.sh .
COPY    ./supervisord.conf /etc/supervisord.conf
RUN     mv ./nginx.conf /etc/nginx/conf.d/default.conf
RUN     mkdir /etc/nginx/ssl
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=RU/L=Kazan/O=42/OU=21/CN=Cerlich' -out /etc/nginx/ssl/nginx-selfsigned.crt -keyout /etc/nginx/ssl/nginx-selfsigned.key
RUN     mkdir -p /run/nginx

EXPOSE  80 443

CMD     sh start.sh