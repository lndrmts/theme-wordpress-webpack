#!/bin/bash

echo "Downloading..."

# Bash script for checking whether WordPress is installed or not
if ! $(wp core is-installed); then
    wp core download --locale=pt_BR
    wp config create --dbname=db_wordpress_webpack --dbuser=root --dbpass=root
    wp db create
    wp core install --url=themewordpress.tmp.br --title=Wordpress_Webpack --admin_user=leandro --admin_password=leandro --admin_email=leandro@lndrmts.dev
    wp theme install ./theme-wordpress-webpack.zip --activate
fi

echo "Finished!"