# docker-nginx-wordpress
A docker image with nginx and ready for wordpress.
I basically copied and customized the official `wordpress` docker, but using `nginx` instead of `apache`.

# How to use
Just mount your wordpress application in the directory `/var/www/html/wordpress` and run it, for example:
```
docker run -it --rm -p 80:80 --network local -v /home/maxpowel/my_wordpress:/var/www/html/wordpress --name wordpress maxpowel/nginx-wordpress
```
You need also a database:
```
docker run --rm --network local -e MYSQL_ROOT_PASSWORD=123456 --name mariadb mariadb --sql-mode="ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
```

And access to `http://localhost`

To get the database ip, you can use this command:
```
docker network inspect local
```
You can put directly your `wp-config.php` configured or using environment variables, it's up to you!

# Custom php.ini
By default, no php.ini the default values are used. You can provide your own php.ini by providing it to docker like this:
```
docker run -it --rm -p 80:80 --network local -v /home/maxpowel/my_wordpress:/var/www/html/wordpress -v /home/maxpowel/my_wordpress_config/php.ini:/usr/local/etc/php/php.ini --name wordpress maxpowel/nginx-wordpress
```

The important parameter is `-v /home/maxpowel/my_wordpress_config/php.ini:/usr/local/etc/php/php.ini`. You can check that it actually loaded by using the phpinfo function. 
