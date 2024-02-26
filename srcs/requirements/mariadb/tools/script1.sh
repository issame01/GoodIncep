#!/bin/bash

# Start the MariaDB service
service mariadb start
# sleep 5
# Create a file called file.sql
cat > file.sql <<EOF
CREATE DATABASE IF NOT EXISTS ${db_name};
CREATE USER IF NOT EXISTS '${db_user}'@'mariadb' IDENTIFIED BY '${db_passw}';
CREATE USER 'root'@'%' identified by '1234';
GRANT ALL PRIVILEGES ON *.* TO '${db_user}'@'%' IDENTIFIED BY '${db_passw}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Execute the MYSQL statements from the file
mysql -u root -p'1234'  < file.sql

# Stop the MariaDB service
service mariadb stop

# here we sleep 5 seconds soo we can give proper time for the mariadb service to stop else the mysqld is going to run and not find the data base creates

# Start the MariaDB service with safe exec
mysqld_safe

