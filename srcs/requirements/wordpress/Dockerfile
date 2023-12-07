FROM debian:bullseye

RUN apt-get update && apt-get upgrade
RUN apt-get install wget -y

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www/html

RUN cd /var/www/html && tar -xvf wordpress-6.4-fr_FR.tar.gz && rm -rf wordpress-6.4-fr_FR.tar.gz

RUN	chown -R root:root /var/www/html/wordpress
RUN	chmod -R 755 /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp-config.sh .
RUN chmod +x ./wp-config.sh

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["bash", "./wp-config.sh"]