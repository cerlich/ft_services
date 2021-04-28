#!/bin/sh

# /usr/bin/supervisord -c /etc/supervisord.conf
/etc/init.d/telegraf start
/usr/sbin/influxd -config /etc/influxdb.conf