#!/bin/bash

su - postgres -c '/usr/pgsql-9.6/bin/pg_ctl -D /var/lib/pgsql/data -l logfile start &'
sleep 5
su - postgres -c 'psql < /init.sql'
