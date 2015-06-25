FROM ubuntu:latest
MAINTAINER Alin Jurj <office@perfectweb.ro>

USER root

# variables setup
ENV DEBIAN_FRONTEND noninteractive
ENV APPLICATION_ENV production
ENV PHP_INI /etc/php5/cli/php.ini
ENV NGINX_CONF /etc/nginx/conf.d/vhost.conf
ENV FPM_POOL_CONF /etc/php5/fpm/pool.d/www.conf
ENV HOME_DIR /root
ENV PROJECTS_DIR /var/www/html
ENV LOGS_DIR ${HOME_DIR}/logs
ENV MAX_UPLOAD 4000M

# add repositories
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:nginx/stable
RUN add-apt-repository -y ppa:mc3man/trusty-media
RUN add-apt-repository -y ppa:ondrej/php5-5.6

RUN apt-get -y update
RUN apt-get -y --force-yes dist-upgrade
RUN apt-get -y --force-yes install gcc nginx unzip mysql-server wget ffmpeg gstreamer0.10-ffmpeg git locate nodejs npm telnet mysql-client redis-server php5 php5-redis php5-memcache php5-memcached php5-dev php5-imagick php5-mcrypt php5-geoip php5-json php5-intl php5-curl php5-xsl php5-xmlrpc php5-gd php5-cli php5-mysqlnd php5-xdebug php5-fpm php5-gearman php-codesniffer php5-oauth php5-apcu htop nano postfix sphinxsearch gearman-job-server openssh-server phpunit*
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g bower forever

RUN wget -O /usr/bin/composer https://getcomposer.org/composer.phar
RUN chmod +x /usr/bin/composer

RUN wget -O /usr/bin/behat https://github.com/downloads/Behat/Behat/behat.phar
RUN chmod +x /usr/bin/behat

RUN wget -O /usr/bin/phpunit https://phar.phpunit.de/phpunit.phar
RUN chmod +x /usr/bin/phpunit

RUN wget -O /usr/bin/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
RUN chmod +x /usr/bin/phpcs

RUN wget -O /usr/bin/phpcbf https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
RUN chmod +x /usr/bin/phpcbf

RUN wget -O /usr/bin/phpmd http://static.phpmd.org/php/2.2.0/phpmd.phar
RUN chmod +x /usr/bin/phpmd

RUN wget -O /usr/bin/phing http://www.phing.info/get/phing-latest.phar
RUN chmod +x /usr/bin/phing

WORKDIR /root
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/London /etc/localtime

# ports
EXPOSE 80 443 3306 6379 4730

# setup logs and folders
RUN ln -s ${PROJECTS_DIR} ${HOME_DIR}/html
RUN mkdir ${LOGS_DIR}
RUN > ${HOME_DIR}/logs/php.log

# php setup
RUN rm /etc/php5/fpm/php.ini
RUN ln -s ${PHP_INI} /etc/php5/fpm/php.ini
RUN sed -i.bak "s|error_log = \(.*\)|error_log = ${LOGS_DIR}/php\.log|g" /etc/php5/fpm/php-fpm.conf
RUN sed -i.bak 's/short_open_tag = \(.*\)/short_open_tag = On/g' ${PHP_INI}
RUN sed -i.bak 's/\;date\.timezone =/date\.timezone = \"Europe\/London\"/g' ${PHP_INI}
RUN sed -i.bak 's/upload_max_filesize = \(.*\)/upload_max_filesize = ${MAX_UPLOAD}/g' ${PHP_INI}
RUN sed -i.bak "s|\;error_log = \(.*\)|error_log = ${LOGS_DIR}/php\.log|g" ${PHP_INI}
RUN sed -i.bak 's/display_errors = \(.*\)/display_errors = On/g' ${PHP_INI}
RUN sed -i.bak 's/display_startup_errors = \(.*\)/display_startup_errors = On/g' ${PHP_INI}
RUN sed -i.bak 's/error_reporting =\(.*\)/error_reporting = E_ALL \& ~E_DEPRECATED \& ~E_STRICT \& ~E_NOTICE/g' ${PHP_INI}
RUN sed -i.bak 's/\;error_prepend_string =\(.*\)/error_prepend_string = \"<pre>\"/g' ${PHP_INI}
RUN sed -i.bak 's/\;error_append_string =\(.*\)/error_append_string = \"<\/pre>\"/g' ${PHP_INI}
RUN sed -i.bak 's/post_max_size =\(.*\)/post_max_size = ${MAX_UPLOAD}/g' ${PHP_INI}

# some php extension changes
RUN echo 'apc.enabled=1' >> /etc/php5/mods-available/apcu.ini
RUN echo 'opcache.enable=1' >> /etc/php5/mods-available/opcache.ini

# php-fpm
RUN sed -i.bak 's/listen =\(.*\)/listen = \/var\/run\/php5-fpm\.sock/g' ${FPM_POOL_CONF}
RUN sed -i.bak 's/\;request_slowlog_timeout =\(.*\)/request_slowlog_timeout = 10s/g' ${FPM_POOL_CONF}
RUN sed -i.bak 's/\;catch_workers_output/catch_workers_output/g' ${FPM_POOL_CONF}
RUN sed -i.bak "s|\;slowlog = log|slowlog = ${LOGS_DIR}|g" ${FPM_POOL_CONF}
RUN sed -i.bak "s|\;access\.log = log|access\.log = ${LOGS_DIR}|g" ${FPM_POOL_CONF}
RUN sed -i.bak 's/www-data/root/g' ${FPM_POOL_CONF}

# nginx setup
RUN wget http://openresty.org/download/ngx_openresty-1.7.10.1.tar.gz; wget https://github.com/openresty/sregex/archive/master.zip; wget -O replace.zip https://github.com/openresty/replace-filter-nginx-module/archive/master.zip
RUN tar xvf ngx_openresty-1.7.10.1.tar.gz; unzip master.zip; unzip replace.zip
RUN cd sregex-master; make; make install
RUN cd ngx_openresty-1.7.10.1; ./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=root --group=root --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-mail --with-mail_ssl_module --with-file-aio --with-ipv6 --with-http_spdy_module --add-module=../replace-filter-nginx-module-master --with-ld-opt="-Wl,-rpath,/usr/local/lib"
RUN cd ngx_openresty-1.7.10.1; make; make install
RUN rm -fr ngx_openresty-1.7.10.1.tar.gz master.zip replace.zip ngx_openresty-1.7.10.1 sregex-master replace-filter-nginx-module-master

RUN echo "user root; worker_processes  auto; error_log ${LOGS_DIR}/nginx.error.log; events { worker_connections  1024; } http { include mime.types; default_type application/octet-stream; access_log  ${LOGS_DIR}/nginx.access.log; sendfile on; keepalive_timeout 65; gzip  on; server { listen 80; server_name  _; location / { root html; index  index.html index.htm; } error_page   500 502 503 504  /50x.html; location = /50x.html { root html; } } include /etc/nginx/sites-enabled/*.conf; }" > /etc/nginx/nginx.conf
RUN mkdir /var/cache/nginx ; rm -f /etc/nginx/sites-enabled/default
RUN echo 'server {' >> ${NGINX_CONF}
RUN echo "client_max_body_size ${MAX_UPLOAD};" >> ${NGINX_CONF}
RUN echo 'server_name ~^local\.(?<subdomain>.+)\.(.*)$;' >> ${NGINX_CONF}
RUN echo 'index index.php index.html index.htm;' >> ${NGINX_CONF}
RUN echo "root ${PROJECTS_DIR}/\$subdomain/public;" >> ${NGINX_CONF}
RUN echo 'location / { try_files $uri $uri/ /index.php?$query_string; }' >> ${NGINX_CONF}
RUN echo 'location ~ \.php {' >> ${NGINX_CONF}
RUN echo 'fastcgi_pass   unix:/var/run/php5-fpm.sock;' >> ${NGINX_CONF}
RUN echo 'fastcgi_intercept_errors on;' >> ${NGINX_CONF}
RUN echo 'fastcgi_index index.php;' >> ${NGINX_CONF}
RUN echo "fastcgi_param  SCRIPT_FILENAME  \$document_root\$fastcgi_script_name;" >> ${NGINX_CONF}
RUN echo 'include        fastcgi_params;' >> ${NGINX_CONF}
RUN echo '}}' >> ${NGINX_CONF}

# sphinxsearch
RUN cp /etc/sphinxsearch/sphinx.conf.sample /etc/sphinxsearch/sphinx.conf
RUN sed -i.bak 's/START=\(.*\)/START=yes/g' /etc/default/sphinxsearch

# sshd
RUN echo root:root | chpasswd
RUN sed -i.bak 's/PermitRootLogin \(.*\)/PermitRootLogin yes/g' /etc/ssh/sshd_config

# cleanups
RUN apt-get clean; updatedb

RUN echo ' service ssh restart \n service postfix restart \n service nginx restart \n service mysql restart \n service php5-fpm restart \n service redis-server restart \n ' > ${HOME_DIR}/run.sh
RUN echo ' if [ -n "$START_GEARMAN" ]; then service gearman-job-server restart; fi \n ' >> ${HOME_DIR}/run.sh
RUN echo ' if [ -n "$START_SPHINX" ]; then service sphinxsearch restart; fi \n' >> ${HOME_DIR}/run.sh
RUN echo ' tail -f logs/* & /bin/bash' >> ${HOME_DIR}/run.sh
RUN chmod 0755 /root/run.sh

ENTRYPOINT ${HOME_DIR}/run.sh
