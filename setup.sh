#!/bin/bash

sudo chown -R 1000:33 "/var/www/.npm"

printf "Installing Mautic Composer dependencies...\n"
composer install
cp ./local.config.php.dist ./config/local.php
cp ./.env-example ./.env.test.local
cp ./.env.local.dist ./.env.local

printf "Installing Mautic...\n"
./bin/console mautic:install "https://mautic-test.com"
./bin/console cache:warmup --no-interaction --env=dev