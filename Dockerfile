FROM phpswoole/swoole:php8.1

COPY yasd /usr/local/src/yasd

RUN apt-get update && \
    apt-get install -y libboost-all-dev && \
    cd /usr/local/src/yasd && phpize --clean && phpize && ./configure && make clean && make && make install && \
    pecl install redis && docker-php-ext-enable redis && \
    docker-php-ext-install pcntl && docker-php-ext-enable pcntl
