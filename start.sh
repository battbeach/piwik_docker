#!/bin/bash
apk update && apk upgrade
rm -rf /var/cache/apk/*
php-fpm
nginx
tail -f /var/log/nginx/access.log
