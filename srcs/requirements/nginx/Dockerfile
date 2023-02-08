FROM debian:buster

RUN apt-get update \
	&& apt-get install -y nginx openssl \ 
	&& apt-get clean \
	&& rm -f /etc/nginx/sites-available/default \
	/etc/nginx/sites-enabled/default \
	/etc/nginx/nginx.conf

COPY ./conf/hbourkan.42.fr /etc/nginx/sites-available
COPY ./conf/nginx.conf /etc/nginx/
COPY ./tools/entrypoint_nginx.sh/ /var/www

RUN ln -s /etc/nginx/sites-available/hbourkan.42.fr /etc/nginx/sites-enabled/hbourkan.42.fr

EXPOSE 443

RUN chmod +x /var/www/entrypoint_nginx.sh

ENTRYPOINT ["/var/www/entrypoint_nginx.sh"]

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
