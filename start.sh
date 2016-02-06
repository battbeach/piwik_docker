#!/bin/bash
apt-get update && apt-get dist-upgrade -y
service php5-fpm start
service nginx start
tail -f /var/log/nginx/access.log
