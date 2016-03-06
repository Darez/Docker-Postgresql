FROM centos:centos7
MAINTAINER Darez

RUN rpm -i http://yum.postgresql.org/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm

RUN yum -y update
RUN yum clean all
RUN yum install -y postgresql94-server postgresql94-contrib
RUN yum clean all

RUN su - postgres -c '/usr/pgsql-9.4/bin/initdb -D /var/lib/pgsql/data'

RUN echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/data/pg_hba.conf

RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

EXPOSE 5432

COPY init.sql /init.sql
COPY init.sh /init.sh
RUN sh init.sh

CMD su - postgres -c '/usr/pgsql-9.4/bin/postgres -D /var/lib/pgsql/data' 