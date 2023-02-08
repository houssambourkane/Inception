FROM debian:buster

RUN apt update \
   && apt install -y mariadb-server

WORKDIR /var/lib/mysql

ARG MYSQL_ROOT_PASSWORD DB_USER DB_PASSWORD DB_NAME
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
ENV DB_USER=$DB_USER
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_NAME=$DB_NAME

COPY ./tools/* /var/lib/mysql
RUN chmod +x entrypoint_sql.sh

RUN ./entrypoint_sql.sh

EXPOSE 3306

CMD ["mysqld"]