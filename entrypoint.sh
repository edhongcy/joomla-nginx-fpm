#!/bin/bash

sed -i 's|default="localhost"|default="'"$DB_HOST"'"|' $WEBROOT/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_USER_LABEL"$|label="INSTL_DATABASE_USER_LABEL" default="'"$DB_USER"'"|' $WEBROOT/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_PASSWORD_LABEL"$|label="INSTL_DATABASE_PASSWORD_LABEL" default="'"$DB_PASSWORD"'"|' $WEBROOT/installation/model/forms/database.xml
sed -i 's|label="INSTL_DATABASE_NAME_LABEL"$|label="INSTL_DATABASE_NAME_LABEL" default="'"$DB_NAME"'"|' $WEBROOT/installation/model/forms/database.xml

# setting ipv6 config
if [ x"$IPV6_LISTEN" == x"false" ]; then
    sed -i 's|listen   \[\:\:\]\:80|#listen   \[\:\:\]\:80|' /etc/nginx/sites-available/default.conf
fi

exec /bin/bash /start.sh
