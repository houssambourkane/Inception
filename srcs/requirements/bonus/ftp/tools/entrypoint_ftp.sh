#! /bin/bash

mkdir -p /var/www/
mkdir -p /var/www/html/
mkdir -p /var/run/vsftpd/empty
adduser --quiet --disabled-password --shell /bin/bash --home /home/$FTP_USER --gecos "User" $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/
exec "$@"
