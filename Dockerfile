FROM centos:centos7
MAINTAINER Darez

RUN rpm -i https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-1.noarch.rpm

RUN yum -y update
RUN yum clean all
RUN yum install -y postgresql96-server postgresql96-contrib
RUN yum clean all

RUN su - postgres -c '/usr/pgsql-9.6/bin/initdb -D /var/lib/pgsql/data'

RUN echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/data/pg_hba.conf

RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

EXPOSE 5432

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"] 
