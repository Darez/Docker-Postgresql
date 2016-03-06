# Docker-Postgresql
=================
Dockerfile for postgresql server.

Getting Started
---------------

You can build this container (pgsql last version) from Github via

	docker build -t pgsql github.com/Darez/Docker-Postgresql

Or build with another pgsql version:

	docker build -t pgsql github.com/Darez/Docker-Postgresql#<version> (e.g 9.3)

To run the container you can do the following:

	docker run -d -p <forwarded port>:5432 -i -t pgsql

If u need create user or db, use -e with vars:
	DBNAME='database name'
	DBUSER='username:password'

e.g
	docker run -d -e DBNAME='db_name' -e DBUSER='root:password' -p <forwarded port>:5432 -i -t pgsql


