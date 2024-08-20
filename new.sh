#!/bin/bash

# Check if a project name argument is provided
if [ -z "$1" ]; then
  echo "Error: No project name provided."
  echo "Usage: ./new.sh <project_name>"
  exit 1
fi

# Set project name from argument
PROJECT_NAME=$1


# Create directory structure
mkdir -p $PROJECT_NAME/{app/Exceptions,config,public,resources/views,routes,nginx,php}

# Create default files
touch $PROJECT_NAME/.env


# Create Index.php file

cat <<EOL > $PROJECT_NAME/public/index.php
  <?php 

  echo phpinfo();

  ?>

EOL


# Create Docker Compose file
cat <<EOL > $PROJECT_NAME/docker-compose.yml
# version: '3.8'

services:
  app:
    build:
      context: .
      dockerfile: php/Dockerfile
    container_name: ${PROJECT_NAME}_php_app
    restart: unless-stopped
    volumes:
      - .:/var/www/html
    networks:
      - app-network

  nginx:
    image: nginx:alpine
    container_name: ${PROJECT_NAME}_nginx
    restart: unless-stopped
    volumes:
      - .:/var/www/html
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf
    ports:
      - "8080:80"
    networks:
      - app-network
    depends_on:
      - app

  mysql:
    image: mysql:latest
    container_name: ${PROJECT_NAME}_mysql
    restart: unless-stopped
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: ${PROJECT_NAME}
      MYSQL_USER: user
      MYSQL_PASSWORD: password
    volumes:
      - mysql_data:/var/lib/mysql
    networks:
      - app-network

  phpmyadmin:
    image: phpmyadmin:latest
    container_name: ${PROJECT_NAME}_phpmyadmin
    restart: unless-stopped
    environment:
      PMA_HOST: mysql
      MYSQL_ROOT_PASSWORD: root
    ports:
      - "8081:80"
    networks:
      - app-network
    depends_on:
      - mysql

networks:
  app-network:
    driver: bridge

volumes:
  mysql_data:
EOL

# Create PHP Dockerfile
cat <<EOL > $PROJECT_NAME/php/Dockerfile
FROM php:8.3-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \\
    zip \\
    unzip \\
    git \\
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
# RUN docker-php-ext-install pdo_mysql

# Set working directory
WORKDIR /var/www/html
EOL

# Create Nginx default.conf
cat <<EOL > $PROJECT_NAME/nginx/default.conf
server {
    listen 80;
    index index.php index.html;
    server_name localhost;
    root /var/www/html/public;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php\$ {
        include fastcgi_params;
        fastcgi_pass app:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOL

# Print completion message
echo "Project structure and Docker setup created successfully in the $PROJECT_NAME directory."
