#!/bin/bash
set -e

su - postgres -c '/usr/bin/postgres -D /var/lib/pgsql/data &'
sleep 5

if [ ! -f "/started" ]
then
	sql='/tmp/init.sql'

	echo '' > $sql
	if [ "$DBNAME" ] 
	then
		echo "CREATE DATABASE $DBNAME;" >> "$sql"
	fi

	if [ "$DBUSER" ] 
	then
		parts=($(echo $DBUSER | tr ":" "\t"))

		echo "CREATE USER ${parts[0]}" >> "$sql"
		if [ "$parts[1]" ]
		then
			echo " WITH PASSWORD '${parts[1]}'" >> "$sql"
		fi

			echo " SUPERUSER;" >> "$sql"

	fi
	touch '/started'	
	su - postgres -c 'psql < '$sql''

fi
	

/bin/bash
