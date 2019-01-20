#!/bin/bash
php-fpm &
consul-template -consul=$CONSUL_URL -template="/templates/db.ctmpl:/var/www/html/db.php"
