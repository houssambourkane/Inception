#! /bin/bash

mkdir -p /var/www/html//cache;
mkdir -p /etc/ssl/private
chmod 700 /etc/ssl/private
openssl req \
    -new \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=MA/ST=BG/L=BG/O=42/CN=www.hbourkan.42.fr" \
    -keyout /etc/ssl/private/www.hbourkan.42.fr.key \
    -out /etc/ssl/certs/www.hbourkan.42.fr.crt

openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
exec "$@"
