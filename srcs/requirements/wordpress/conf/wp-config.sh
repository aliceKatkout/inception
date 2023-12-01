#!/bin/sh
sleep 10;

cd /var/www/html/wordpress

if [[! wp-config.php]]; then
	wp config create --allow-root \
					--dbname=${SQL_DATABASE} \
					--dbuser=${SQL_USER} \
					--dbpass=${SQL_PASSWORD} \
					--dbhost=mariadb:3306 \
					--path=/var/www/wordpress \
					--url=https://${DOMAIN_NAME}
fi

wp core install --allow-root \
				--url=https://${DOMAIN_NAME} \
				--title=${DOMAIN_NAME} \
				--admin_user=${WP_USER} \
				--admin_password=${WP_PASSWORD} \
				--admin_email=${WP_EMAIL} \
				--skip-email

wp user create		--allow-root \
			${USER1_LOGIN} ${USER1_MAIL} \
			--role=author \
			--user_pass=${USER1_PASS} ;

# empty cache
wp cache flush --allow-root