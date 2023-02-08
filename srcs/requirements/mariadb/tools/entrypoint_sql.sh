#! /bin/bash

service mysql start
echo "UPDATE mysql.user SET Password = PASSWORD('root') WHERE User = 'root'" | mysql
echo "DELETE FROM mysql.user WHERE User='';" | mysql
echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" | mysql
echo "DROP DATABASE IF EXISTS test;" | mysql
echo "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';" | mysql
echo "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';" | mysql
echo "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';" | mysql
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
sed -i 's/bind-address[[:space:]]*=[[:space:]]*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
