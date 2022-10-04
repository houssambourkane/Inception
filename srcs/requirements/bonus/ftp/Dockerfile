FROM debian:buster

RUN apt-get update && apt-get install -y \
	vsftpd \
	&& rm -rf /etc/vsftpd.conf

COPY ./conf/ /etc/
COPY ./tools/ /home/

RUN chmod +x /home/entrypoint_ftp.sh

EXPOSE 20

ENTRYPOINT ["/home/entrypoint_ftp.sh"]

