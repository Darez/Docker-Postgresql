FROM centos:centos6
MAINTAINER Darez

RUN rpm -i https://download.postgresql.org/pub/repos/yum/9.0/redhat/rhel-6-x86_64/pgdg-centos90-9.0-5.noarch.rpm

RUN yum -y update
RUN yum clean all
RUN yum install -y postgresql90-server postgresql90-contrib
RUN yum clean all

RUN su - postgres -c '/usr/pgsql-9.0/bin/initdb -D /var/lib/pgsql/data'

RUN echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/data/pg_hba.conf

RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

EXPOSE 5432

COPY init.sql /init.sql
COPY init.sh /init.sh
RUN sh init.sh

CMD su - postgres -c '/usr/pgsql-9.0/bin/postgres -D /var/lib/pgsql/data' 
