#!/bin/bash

# change the owner of the directory of /var/www/html and all subdirectories
chown -R www-data:www-data /var/www/wordpress/

#changing the owner of /var/www/html/ to 755 
chmod -R 755 /var/www/wordpress/ 

# move to /var/www/html/ directory
cd /var/www/wordpress/ && wp core download --allow-root

# change is modifying the unix socket used for the connection of PHP-FPM with the web server,
# from the default /run/php/php7.3-fpm.sock to TCP/IP port 9000 .
# sed -i '36 s/\/run\/php\/php7.4-fpm.sock/9000/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

cp wp-config-sample.php  wp-config.php

# Set The Database that will be connected with wordpress
sed -i 's/database_name_here/'$db_name'/g' /var/www/wordpress/wp-config.php

# Set the Username of The database
sed -i 's/username_here/'$db_user'/g' /var/www/wordpress/wp-config.php

# Set the Password
sed -i 's/password_here/'$db_passw'/g' /var/www/wordpress/wp-config.php

# set The Hostname of the That base
sed -i 's/localhost/'mariadb'/g' /var/www/wordpress/wp-config.php

# wp config set FORCE_SSL_ADMIN 'false' --allow-root

# The instruction "wp config set WP_CACHE 'true'" is a command that sets the value of the WP_CACHE constant in the WordPress configuration file to "true".
# This constant controls whether caching is enabled in WordPress or not.
# wp config set WP_CACHE 'true' --allow-root

wp core install --url=localhost --title="My Wordpress Site" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_EMAIL --allow-root
# create second user in wordpress
wp user create $WP_USR $WP_EMAIL --user_pass=$WP_PWD --role='author' --allow-root

/usr/sbin/php-fpm7.4 -F
