FROM perfectweb/development:latest

# variables setup
ENV APPLICATION_ENV development
ENV PHP_INI /etc/php5/cli/php.ini

# php setup
RUN sed -i.bak 's/display_errors = On/display_errors = Off/g' ${PHP_INI}

# some php extension changes
RUN echo 'apc.enabled=0' >> /etc/php5/mods-available/apcu.ini
RUN echo 'opcache.enable=0' >> /etc/php5/mods-available/opcache.ini
RUN echo 'xdebug.max_nesting_level=600' >> /etc/php5/mods-available/xdebug.ini

# build
# docker build -t perfectweb/development .

# run
# docker run -dit -p 80:80 -p 9000:9000 -v $HOME/.ssh:/root/.ssh -v $HOME/Web/html:/var/www/html --name=development perfectweb/development

# run & attach
# docker run -dit -p 80:80 -p 9000:9000 -v $HOME/.ssh:/root/.ssh -v $HOME/Web/html:/var/www/html --name=development perfectweb/development; docker attach development

# clean start
# docker rm -f development; docker rmi perfectweb/development

# tips
## if you want to use your local mysql server or anything else that runs on socket you can add `-v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock` to your run command (replace the path with the sock path you wanna mount)
