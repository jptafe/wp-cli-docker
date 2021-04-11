#!/bin/bash
if [ -z "$(ls -A /var/www/html)" ]; then
	wp core download --locale=en_AU 
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER \
		--dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST:3306 --locale=en_AU
else 
	wp core update --locale=en_AU
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER \
		--dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST:3306 --locale=en_AU \
		--force
fi
if [ -n "$(ls -A /opt/wp-content)" ]; then
	cp -r /opt/wp-content/. /var/www/html/wp-content
else 
	wp core install --url=$WP_URL --admin_email=$ADMIN_EMAIL --title=$WP_TITLE \
		--admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS 
fi
wp server --host=0.0.0.0
