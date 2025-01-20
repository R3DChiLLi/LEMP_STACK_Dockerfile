#!/bin/bash

# Start MariaDB service
echo "Starting MariaDB service..."
service mariadb start

# Wait a few seconds for MariaDB to initialize
echo "Waiting for MariaDB to initialize..."
sleep 5

# Create the database and user with privileges
echo "Initializing the database..."
mysql -e "CREATE DATABASE IF NOT EXISTS sales;"
mysql -e "CREATE USER IF NOT EXISTS 'zahan'@'%' IDENTIFIED BY '1234567';"
mysql -e "GRANT ALL PRIVILEGES ON sales.* TO 'zahan'@'%';"
mysql -e "FLUSH PRIVILEGES;"

echo "Database initialized successfully."

# Start PHP-FPM and Nginx
echo "Starting PHP-FPM and Nginx services..."
php-fpm -D
nginx -g "daemon off;" &

# Pass control to CMD
exec "$@"
