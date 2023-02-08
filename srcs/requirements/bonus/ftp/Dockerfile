FROM debian:buster

RUN apt-get update && apt-get install vsftpd -y \
	&& rm -rf /etc/vsftpd.conf

COPY ./conf/ /etc/vsftpd/
COPY ./tools/ /home/

RUN chmod +x /home/entrypoint_ftp.sh

EXPOSE 20 21

RUN ./home/entrypoint_ftp.sh

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]

