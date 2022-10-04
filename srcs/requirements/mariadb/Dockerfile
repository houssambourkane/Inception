
FROM debian:buster

RUN apt-get update && apt-get install -y \
	mariadb-server

COPY ./tools/* /var/www/

RUN service mysql start \
	&& mysql < /var/www/init.sql \
	&& rm -rf /var/www/init.sql

RUN chmod +x /var/www/entrypoint_sql.sh

EXPOSE 3306

ENTRYPOINT ["/var/www/entrypoint_sql.sh"]

CMD ["mysqld"]
