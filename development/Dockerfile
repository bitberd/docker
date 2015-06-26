FROM perfectweb/development:latest

# variables setup
ENV APPLICATION_ENV development
ENV PHP_INI /etc/php5/cli/php.ini

# php setup
RUN sed -i.bak 's/display_errors = \(.*\)/display_errors = On/g' ${PHP_INI}
RUN sed -i.bak 's/display_startup_errors = \(.*\)/display_startup_errors = On/g' ${PHP_INI}

# some php extension changes
RUN echo 'apc.enabled=0' >> /etc/php5/mods-available/apcu.ini
RUN echo 'opcache.enable=0' >> /etc/php5/mods-available/opcache.ini
RUN echo 'xdebug.max_nesting_level=600' >> /etc/php5/mods-available/xdebug.ini
RUN echo 'xdebug.remote_enable=true' >> /etc/php5/mods-available/xdebug.ini
RUN echo 'xdebug.profiler_enable_trigger=true' >> /etc/php5/mods-available/xdebug.ini

# nginx setup
RUN sed -i.bak 's/server_name \~\(.*\)/server_name \~\^\(\?\<domain\>\.\+\)\$;/g' /etc/nginx/nginx.conf
RUN echo "root ${PROJECTS_DIR}/\$subdomain/public;" >> ${NGINX_CONF}

# build
# docker build -t perfectweb/development .

# run
# docker run -dit -p 80:80 -v $HOME/.ssh:/root/.ssh -v $HOME/Web/html:/var/www/html --name=development perfectweb/development

# clean start
# docker rm -f development; docker rmi perfectweb/development

# tips
## if you want to use your local mysql server or anything else that runs on socket you can add `-v /var/lib/mysql/mysql.sock:/var/run/mysqld/mysqld.sock` to your run command (replace the path with the sock path you wanna mount)
