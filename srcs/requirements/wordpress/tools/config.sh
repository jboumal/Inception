#!/bin/sh

# create wp-config.php if it does not exist
if [ ! -f /var/www/html/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp
	wp core download --allow-root
	wp config create --dbname=$WP_DB --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=mariadb --allow-root
	wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_DB_USER \
	--admin_password=$WP_ADMIN_DB_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
	wp theme install inspiro --activate --allow-root
	wp plugin update --all --allow-root
fi

exec "$@"