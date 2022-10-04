FROM debian:buster

RUN apt-get update && apt-get install -y \ 
	php7.3-fpm php7.3-common php7.3-mysql \
	php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd \
	php7.3-imagick php7.3-cli php7.3-dev php7.3-imap \
	php7.3-mbstring php7.3-opcache php7.3-redis \
	php7.3-soap php7.3-zip mariadb-client \
	&& rm -rf /etc/php/7.3/fpm/pool.d 

RUN useradd -g www-data hbourkan

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/entrypoint_wp.sh /var/www/

RUN chmod +x /var/www/entrypoint_wp.sh

EXPOSE 9000

ENTRYPOINT ["/var/www/entrypoint_wp.sh"]
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
