# Stage 1: Build the Laravel application
FROM php:8.2-fpm as builder

WORKDIR /var/www/html


# Install dependencies
# Install dependencies and Composer
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    libpq-dev

RUN docker-php-ext-install pdo_mysql


# Install PHP extensions
# RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy existing application directory contents
COPY . /var/www/html
# COPY . .

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage

# Install project dependencies
# RUN composer update
RUN composer install --no-interaction

# Generate application key
RUN php artisan key:generate

# Stage 2: Copy the Laravel application to the final PHP-FPM image
FROM php:8.2-fpm

WORKDIR /var/www/html

# Copy the Laravel application from the builder stage
COPY --from=builder /var/www/html /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html/storage

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
