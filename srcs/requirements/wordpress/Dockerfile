FROM debian::bullseye

RUN apt-get update && apt-get upgrade
RUN apt-get install wget -y

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xvf wordpress-6.4-fr_FR.tar.gz && rm -rf wordpress-6.4-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress
