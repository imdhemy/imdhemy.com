#!/bin/sh
set -e

if [ "$1" = 'frankenphp' ] || [ "$1" = 'php' ] || [ "$1" = 'artisan' ]; then

    # Install composer dependencies if vendor directory is empty
    if [ -z "$(ls -A 'vendor/' 2>/dev/null)" ]; then
        composer install --prefer-dist --no-progress --no-interaction
    fi
fi

exec docker-php-entrypoint "$@"
