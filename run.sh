#!/bin/sh

set -e

sed -i "s|RECEIVER_SERIAL=|RECEIVER_SERIAL=$RECEIVER_SERIAL|g" /etc/default/dump1090-fa
sed -i "s|RECEIVER_LAT=|RECEIVER_LAT=$RECEIVER_LAT|g" /etc/default/dump1090-fa
sed -i "s|RECEIVER_LON=|RECEIVER_LON=$RECEIVER_LON|g" /etc/default/dump1090-fa
sed -i "s|RECEIVER_GAIN=|RECEIVER_GAIN=$RECEIVER_GAIN|g" /etc/default/dump1090-fa

sed -i "s|RECEIVER_PPM|$RECEIVER_PPM|g" /etc/supervisor/conf.d/supervisord.conf

mkdir -p '/run/dump1090-fa'
mkdir -p '/var/log/supervisor'
mkdir -p '/var/log/lighttpd'
chown -R www-data:www-data /var/log/lighttpd

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf


