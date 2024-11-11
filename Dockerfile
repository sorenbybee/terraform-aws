# Dockerfile
FROM ubuntu:latest

# Install updates and tzdata (for timezone settings)
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y tzdata

# Install Apache and PHP packages
RUN apt install -y apache2 php php-mysql libapache2-mod-php

# Set environment variables for database configuration
ENV DB_HOST=${DB_HOST}
ENV DB_USER=${DB_USER}
ENV DB_PASS=${DB_PASS}
ENV DB_NAME=${DB_NAME}

# Copy Pokémon starter files into the Apache web directory
COPY ~/water   /var/www/html/

# Expose port 80
EXPOSE 80

# Run Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

