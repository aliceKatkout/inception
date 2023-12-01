FROM debian:bullseye

RUN apt-get update && apt-get upgrade
RUN apt-get install wget -y

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xvf wordpress-6.4-fr_FR.tar.gz && rm -rf wordpress-6.4-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress
RUN	chmod -R 755 /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp-config.sh .
RUN chmod +x ./wp-config.sh


ENTRYPOINT ["bash", "./wp-config.sh"]