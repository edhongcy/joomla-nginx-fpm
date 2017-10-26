# joomla-nginx-fpm

Joomla on Nginx. Using php7 7.0.14, Nginx 1.11.5 and Alpine 3.4@edge.

## Usage
```
docker run -d -p 8080:80 \
           -e DB_HOST=mysql \
           -e DB_USER=joomla \
           -e DB_PASSWORD=joomla \
           -e DB_NAME=joomla \
           --link some-db:mysql seterrychen/joomla-nginx-fpm:3.8.1
```
Browse to http://localhost:8080/ to setup your Joomla.

- **DB_HOST**: no default value
- **DB_USER**: default value is joomla
- **DB_PASSWORD**: default value is joomla
- **DB_NAME**: default value is joomla
- **IPV6_LISTEN**: default value is fault to close IPV6 listener


## Note
Use the image should create a database container to store data, such as:
```
docker run -d --name some-db \
           -e MYSQL_ROOT_PASSWORD=joomla \
           -e MYSQL_USER=joomla \
           -e MYSQL_PASSWORD=joomla \
           -e MYSQL_DATABASE=joomla \
           mariadb
```
