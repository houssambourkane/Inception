#! /bin/bash

sed -i 's/bind[[:space:]]*127.0.0.1[[:space:]]*::1//g' /etc/redis/redis.conf;

redis-server --protected-mode no;

exec "$@"
