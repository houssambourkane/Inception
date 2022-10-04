FROM debian:buster

RUN apt-get update && apt-get install adminer php7.3-fpm wget -y

COPY ./tools/entrypoint_adminer.sh /home/

EXPOSE 8080

RUN chmod +x /home/entrypoint_adminer.sh

ENTRYPOINT ["/home/entrypoint_adminer.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
