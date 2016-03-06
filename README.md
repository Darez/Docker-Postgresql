# Docker-Postgresql
=================
Dockerfile for postgresql server. Auto create super user 'root' with password 'password'.

Getting Started
---------------

You can build this container (pgsql 9.4) from Github via

	docker build -t pgsql github.com/Darez/Docker-Postgresql

Or build with another pgsql version:

	docker build -t pgsql github.com/Darez/Docker-Postgresql#<version> (e.g 9.3)

To run the container you can do the following:

	docker run -d -p <forwarded port>:5432 -i -t pgsql

