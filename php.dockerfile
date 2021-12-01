FROM php:7.3-fpm-alpine

RUN apk add --update \
			freetype-dev \
			gettext \
			libgd \
			libpng-dev \
			libjpeg-turbo-dev \
			libxml2-dev \
			libzip-dev \
			musl-libintl

RUN docker-php-ext-install gd iconv mbstring mysqli xml zip

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY ./php.ini /usr/local/etc/php/php.ini

CMD ["php-fpm", "-F"]
