#! /bin/bash

sed -i 's/bind-address[[:space:]]*=[[:space:]]*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

exec "$@"
