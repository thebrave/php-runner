FROM alpine:3.9.3

RUN apk update

RUN apk add nginx curl git libc6-compat bash \
    php7-dom php7-ctype php7-tokenizer php7-json php7-openssl php7-mbstring \
    php7-fpm php7-cli php7-phar php7-simplexml php7-xml 

ADD https://static.phpmd.org/php/2.6.0/phpmd.phar /bin/phpmd
ADD https://github.com/ochinchina/supervisord/releases/download/v0.6.3/supervisord_static_0.6.3_linux_amd64 /sbin/supervisord

RUN chmod +x /bin/phpmd
RUN chmod +x /sbin/supervisord
RUN mkdir /etc/dropbear

COPY supervisord.conf /etc
COPY docker-entrypoint.sh /

RUN apk add openssh-sftp-server openssh-client dropbear

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/sbin/supervisord"]

RUN apk add binutils

EXPOSE 22/tcp

# RUN git clone --depth 1 -b 2.6.0 git://github.com/phpmd/phpmd.git /opt/phpmd
# RUN cd /opt/phpmd && git submodule update --init
# RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/bin --filename=composer
# RUN cd /opt/phpmd && composer install 
# RUN ln -s /opt/phpmd/src/bin/phpmd /bin/phpmd
