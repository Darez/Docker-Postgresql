#!/bin/bash

su - postgres -c '/usr/pgsql-9.3/bin/postgres -D /var/lib/pgsql/data &'
sleep 5
su - postgres -c 'psql < /init.sql'
