FROM		ubuntu
MAINTAINER	David Elvers "david@d4v1d.eu"

RUN		apt-get update && apt-get dist-upgrade -y
RUN		apt-get install -y nginx php5-fpm unzip php5-mysql php5-gd

# add nginx config
ADD	default_nginx.conf /etc/nginx/sites-available/default

# add entrypoint script
ADD start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

# add piwik
ADD 	http://builds.piwik.org/piwik.zip /usr/share/nginx/html/
WORKDIR	/usr/share/nginx/html/
RUN	unzip piwik.zip
WORKDIR /usr/share/nginx/html/piwik/

RUN 	chown -R root:www-data ./
RUN 	chown -R www-data:www-data ./tmp
RUN 	chown -R www-data:www-data ./config

EXPOSE		80

ENTRYPOINT	["start.sh"]
