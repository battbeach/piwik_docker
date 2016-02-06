# piwik_docker
All you need to build a docker container of piwik
This configuration usese the latest Ubuntu-Container and nginx with php5-fpm

## Run
For a small test (only sqlite) you can run it with this command:

    docker run -p 80:80 --name piwik d4v1d31/piwik

When you want to use mysql you have to link it to a database container:

    docker run -p 80:80 --link mysql:mysql --name piwik d4v1d31/piwik

The configuration file exist after installation under /usr/share/nginx/html/piwik/config
