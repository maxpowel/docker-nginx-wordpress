#!/usr/bin/env bash
if [[ ! -d "/var/www/html/wordpress" ]]
then
    echo "Please put your files in the directory /var/www/html/wordpress"
fi

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env
service cron start
service nginx start
php-fpm
