# Use PHP 8.2 FPM base image
FROM php:8.2-fpm

# Install MariaDB server, client, Nginx, and mysqli extension
RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    nginx \
    && docker-php-ext-install mysqli \
    && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container's /var/www/html/ directory
COPY . /var/www/html/

# Copy the Nginx configuration file into the container
COPY nginx.conf /etc/nginx/sites-available/default

# Copy the database initialization script into the container
COPY init-db.sh /usr/local/bin/init-db.sh

# Ensure the script is executable
RUN chmod +x /usr/local/bin/init-db.sh

# Expose ports for Nginx and MariaDB
EXPOSE 80 3306

# Set the database initialization script as the entrypoint
ENTRYPOINT ["/usr/local/bin/init-db.sh"]

# Default CMD
CMD ["sh", "-c", "tail -f /dev/null"]
