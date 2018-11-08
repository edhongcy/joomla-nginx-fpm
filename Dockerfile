FROM richarvey/nginx-php-fpm:php7
MAINTAINER Terry Chen <seterrychen@gmail.com>

ENV \
  JOOMLA_VERSION=3.8.13 \
  JOOMLA_SHA1=c47f0e0e32a8089257a6e49bb5d9d05d3ebe7d45 \
  JOOMLA_INSTALLATION_DISABLE_LOCALHOST_CHECK=1 \
  WEBROOT=/var/joomla \
  DB_NAME=joomla \
  DB_USER=joomla \
  DB_PASSWORD=joomla \
  IPV6_LISTEN=false

RUN curl -o joomla.zip -SL https://github.com/joomla/joomla-cms/releases/download/${JOOMLA_VERSION}/Joomla_${JOOMLA_VERSION}-Stable-Full_Package.zip \
  && echo "$JOOMLA_SHA1 *joomla.zip" | sha1sum -c - \
  && rm /var/www/html/index.php \
  && mkdir $WEBROOT \
  && unzip joomla.zip -d $WEBROOT \
  && chown -R nginx:nginx $WEBROOT \
  && rm joomla.zip

RUN sed -r 's|^(Options -Indexes.*)$|#\1|' /var/joomla/htaccess.txt > ${WEBROOT}/.htaccess

ADD entrypoint.sh /entrypoint.sh

VOLUME ["/usr/joomla"]
CMD ["/entrypoint.sh"]
