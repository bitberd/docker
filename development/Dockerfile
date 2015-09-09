FROM perfectweb/production

# variables setup
ENV APPLICATION_ENV development
ENV XDEBUG_INI /etc/php5/mods-available/xdebug.ini
ENV DBGP_PATH http://downloads.activestate.com/Komodo/releases/9.1.0/remotedebugging/
ENV DBGP_VERSION Komodo-PythonRemoteDebugging-9.1.0-87337-linux-x86_64

# php setup
RUN sed -i.bak 's/display_errors = \(.*\)/display_errors = On/g' ${PHP_INI}
RUN sed -i.bak 's/display_startup_errors = \(.*\)/display_startup_errors = On/g' ${PHP_INI}

# some php extension changes
RUN echo 'apc.enabled=0' >> ${XDEBUG_INI}
RUN echo 'opcache.enable=0' >> ${XDEBUG_INI}
RUN echo 'xdebug.max_nesting_level=600' >> ${XDEBUG_INI}
RUN echo 'xdebug.remote_enable=true' >> ${XDEBUG_INI}
RUN echo 'xdebug.profiler_enable_trigger=true' >> ${XDEBUG_INI}
RUN echo 'xdebug.remote_host=localhost' >> ${XDEBUG_INI}
RUN echo 'xdebug.remote_port=9000' >> ${XDEBUG_INI}

# setup dbgproxy
RUN sed -i.bak "1inohup pydbgpproxy -d 0.0.0.0:9000 -i 0.0.0.0:9001 >> ${LOGS_DIR}/php.log&" ${HOME_DIR}/run.sh
RUN wget -O /usr/local/pydbgp.tar.gz ${DBGP_PATH}${DBGP_VERSION}.tar.gz; tar xvf /usr/local/pydbgp.tar.gz -C /usr/local/; rm -rf /usr/local/pydbgp.tar.gz
RUN ln -s /usr/local/${DBGP_VERSION}/pydbgpproxy /usr/bin/pydbgpproxy
RUN wget https://bootstrap.pypa.io/get-pip.py; python get-pip.py; pip install dbgp; rm -f get-pip.py


# build
# docker build -t perfectweb/development .

# run
# docker run -dit -p 80:80 -v $HOME/.ssh:/root/.ssh -v $HOME/Web/html:/var/www/html --name=development perfectweb/development

# clean start
# docker rm -f development; docker rmi perfectweb/development

# tips
## if you want to use your local mysql server or anything else that runs on socket you can add `-v /var/lib/mysql/mysql.sock:/var/run/mysqld/mysqld.sock` to your run command (replace the path with the sock path you wanna mount)

# paths
# sphinx: /etc/sphinxsearch/sphinx.conf
# mysql: /var/run/mysqld/mysqld.sock
