FROM alpine:3.9.3

ADD https://static.phpmd.org/php/2.6.0/phpmd.phar /bin/phpmd.phar
ADD https://github.com/ochinchina/supervisord/releases/download/v0.6.3/supervisord_0.6.3_linux_amd64 /sbin/supervisord

RUN ln -s /bin/phpmd.phar /bin/phpmd
RUN chmod +x /bin/phpmd
RUN chmod +x /sbin/supervisord

RUN apk update

RUN apk add nginx php7-fpm php7-cli php7-phar libc6-compat

RUN apk add binutils