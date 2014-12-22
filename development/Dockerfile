FROM ubuntu:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

# add repositories
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:nginx/stable
RUN add-apt-repository -y ppa:ondrej/php5-5.6

RUN apt-get -y update
RUN apt-get -y --force-yes dist-upgrade
RUN apt-get -y --force-yes install locate telnet mysql-client nginx redis-server php5 php5-redis php5-memcache php5-memcached php5-dev php5-imagick php5-mcrypt php5-geoip php5-json php5-intl php5-curl php5-xsl php5-xmlrpc php5-gd php5-cli php5-mysqlnd php5-xdebug php5-fpm php5-gearman php-codesniffer php5-oauth php5-apcu htop nano postfix phpunit*

# variables setup
ENV PHP_INI /etc/php5/cli/php.ini
ENV NGINX_CONF /etc/nginx/conf.d/vhost.conf
ENV FPM_POOL_CONF /etc/php5/fpm/pool.d/www.conf
ENV HOME_DIR /root
ENV PROJECTS_DIR /var/www/html
ENV LOGS_DIR ${HOME_DIR}/logs

WORKDIR /root
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Bucharest /etc/localtime

# ports
EXPOSE 80 443

# setup logs and folders
RUN ln -s ${PROJECTS_DIR} ${HOME_DIR}/html
RUN mkdir ${LOGS_DIR}
RUN > ${HOME_DIR}/logs/php.log
RUN chown www-data:www-data ${LOGS_DIR}/php.log
RUN ln -s /var/log/nginx/error.log ${LOGS_DIR}/nginx.error.log
RUN ln -s /var/log/nginx/access.log ${LOGS_DIR}/nginx.access.log

# php setup
RUN rm /etc/php5/fpm/php.ini
RUN ln -s ${PHP_INI} /etc/php5/fpm/php.ini
RUN sed -i.bak "s|error_log = \(.*\)|error_log = ${LOGS_DIR}/php\.log|g" /etc/php5/fpm/php-fpm.conf
RUN sed -i.bak 's/short_open_tag = Off/short_open_tag = On/g' ${PHP_INI}
RUN sed -i.bak 's/\;date\.timezone =/date\.timezone = \"Europe\/Bucharest\"/g' ${PHP_INI}
RUN sed -i.bak 's/allow_url_fopen = On/allow_url_fopen = Off/g' ${PHP_INI}
RUN sed -i.bak 's/upload_max_filesize = 2M/upload_max_filesize = 200M/g' ${PHP_INI}
RUN sed -i.bak "s|\;error_log = \(.*\)|error_log = ${LOGS_DIR}/php\.log|g" ${PHP_INI}
RUN sed -i.bak 's/display_errors = Off/display_errors = On/g' ${PHP_INI}
RUN sed -i.bak 's/display_startup_errors = Off/display_startup_errors = On/g' ${PHP_INI}
RUN sed -i.bak 's/error_reporting =\(.*\)/error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_STRICT \& ~E_NOTICE/g' ${PHP_INI}
RUN sed -i.bak 's/short_open_tag = Off/short_open_tag = On/g' ${PHP_INI}
RUN sed -i.bak 's/\;error_prepend_string =\(.*\)/error_prepend_string = \"<pre>\"/g' ${PHP_INI}
RUN sed -i.bak 's/\;error_append_string =\(.*\)/error_append_string = \"<\/pre>\"/g' ${PHP_INI}
RUN sed -i.bak 's/post_max_size =\(.*\)/post_max_size = 200M/g' ${PHP_INI}

# some php extension changes
RUN echo 'apc.enabled=0' >> /etc/php5/mods-available/apcu.ini
RUN echo 'opcache.enable=0' >> /etc/php5/mods-available/opcache.ini
RUN echo 'xdebug.max_nesting_level=600' >> /etc/php5/mods-available/xdebug.ini

# php-fpm
RUN sed -i.bak 's/listen =\(.*\)/listen = \/var\/run\/php5-fpm\.development\.sock/g' ${FPM_POOL_CONF}
RUN sed -i.bak 's/\;request_slowlog_timeout =\(.*\)/request_slowlog_timeout = 10s/g' ${FPM_POOL_CONF}
RUN sed -i.bak 's/\;catch_workers_output/catch_workers_output/g' ${FPM_POOL_CONF}
RUN sed -i.bak "s|\;slowlog = log|slowlog = ${LOGS_DIR}|g" ${FPM_POOL_CONF}
RUN sed -i.bak "s|\;access\.log = log|access\.log = ${LOGS_DIR}|g" ${FPM_POOL_CONF}

# nginx setup
RUN rm -rf /etc/nginx/conf.d/*
RUN echo 'server {' >> ${NGINX_CONF}
RUN echo 'client_max_body_size 200m;' >> ${NGINX_CONF}
RUN echo 'server_name  ~^local\.(?<subdomain>.+)\.(.*)$;' >> ${NGINX_CONF}
RUN echo 'index index.php index.html index.htm;' >> ${NGINX_CONF}
RUN echo "root ${PROJECTS_DIR}/\$subdomain/public;" >> ${NGINX_CONF}
RUN echo 'location / { try_files $uri $uri/ /index.php?$query_string; }' >> ${NGINX_CONF}
RUN echo 'location ~ \.php {' >> ${NGINX_CONF}
RUN echo 'fastcgi_pass   unix:/var/run/php5-fpm.development.sock;' >> ${NGINX_CONF}
RUN echo 'fastcgi_intercept_errors on;' >> ${NGINX_CONF}
RUN echo 'fastcgi_index index.php;' >> ${NGINX_CONF}
RUN echo "fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;" >> ${NGINX_CONF}
RUN echo 'include        fastcgi_params;' >> ${NGINX_CONF}
RUN echo 'fastcgi_param  APPLICATION_ENV development;' >> ${NGINX_CONF}
RUN echo '}}' >> ${NGINX_CONF}

RUN echo ' service nginx restart \n service php5-fpm restart \n service redis-server restart \n /bin/bash & tail -f logs/php.log' > ${HOME_DIR}/run.sh
RUN chmod 0755 /root/run.sh

ENTRYPOINT ${HOME_DIR}/run.sh

# build
# docker build -t perfectweb/development .

# run
# docker run -dit -p 80:80 -v $HOME/.ssh:/root/.ssh -v $HOME/Web/html:/var/www/html --name=development perfectweb/development

# run & attach
# docker run -dit -p 80:80 -v $HOME/.ssh:/root/.ssh -v $HOME/Web/html:/var/www/html --name=development perfectweb/development; docker attach development

# clean start
# docker rm -f development; docker rmi perfectweb/development

# tips
## if you want to use your local mysql server or anything else that runs on socket you can add `-v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock` to your run command (replace the path with the sock path you wanna mount)
