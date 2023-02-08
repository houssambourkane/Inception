FROM debian:buster

RUN apt-get update && apt-get install -y redis-server php-redis

EXPOSE 6379

COPY ./tools/entrypoint_redis.sh /home/

RUN chmod +x /home/entrypoint_redis.sh

ENTRYPOINT ["/home/entrypoint_redis.sh"]

