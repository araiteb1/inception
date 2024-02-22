#!/bin/bash
service mysql start

echo "Creating DB . . .";

echo "CREATE DATABASE IF NOT EXISTS $DATA_NAME;" > db1.sql

echo "Creating DB USER . . .";

echo "CREATE USER IF NOT EXISTS '$DATA_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DATA_NAME.* TO '$DATA_USER'@'%';" >> db1.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';" >> db1.sql

echo "FLUSH PRIVILEGES;" >> db1.sql;

mysql -u root -p'12345' < db1.sql

echo "Creating DB  . . . DONE !";

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld