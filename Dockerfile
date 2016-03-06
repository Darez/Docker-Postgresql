FROM centos:centos6
MAINTAINER Darez

RUN rpm -i http://yum.postgresql.org/8.4/redhat/rhel-6-x86_64/pgdg-centos-8.4-3.noarch.rpm

RUN yum -y update
RUN yum clean all
RUN yum install -y postgresql84-server postgresql84-contrib
RUN yum clean all

RUN su - postgres -c '/usr/pgsql-8.4/bin/initdb -D /var/lib/pgsql/data'

RUN echo "host    all             all             0.0.0.0/0            md5" >> /var/lib/pgsql/data/pg_hba.conf

RUN echo "listen_addresses='*'" >> /var/lib/pgsql/data/postgresql.conf

EXPOSE 5432

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"] 
