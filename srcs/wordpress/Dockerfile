FROM	alpine:3.12

RUN		apk update && apk upgrade && apk add nginx openssl wget
RUN     mkdir -p /usr/share/webapps/
RUN     cd /usr/share/webapps/ && wget http://wordpress.org/latest.tar.gz
RUN     tar -xzvf latest.tar.gz && rm latest.tar.gz