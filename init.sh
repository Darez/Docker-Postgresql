#!/bin/bash

su - postgres -c '/usr/bin/postgres -D /var/lib/pgsql/data &'
sleep 5
su - postgres -c 'psql < /init.sql'
