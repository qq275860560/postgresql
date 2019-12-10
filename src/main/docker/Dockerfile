FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

RUN yum -y install https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm &&\
    yum -y install postgresql11-server &&\
    yum -y install postgresql11 

RUN cd /usr/pgsql-11

RUN /usr/pgsql-11/bin/postgresql-11-setup initdb

RUN cd /var/lib/pgsql/11/data

RUN cd /var/lib/pgsql/11/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/var/lib/pgsql/11/data/postgresql.conf
                                     
RUN cd /var/lib/pgsql/11/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/var/lib/pgsql/11/data/pg_hba.conf

RUN nohup sudo -u postgres /usr/pgsql-11/bin/postmaster    -D /var/lib/pgsql/11/data/ 2>&1 </dev/null &
 
RUN su postgres

RUN psql -p5432 -Upostgres -S -c "create user root with password '123456'" postgres

RUN psql -p5432 -Upostgres -S -c "ALTER USER postgres WITH PASSWORD '123456'" postgres

CMD nohup su postgres -c "/usr/pgsql-11/bin/postmaster    -D /var/lib/pgsql/11/data/" 2>&1 </dev/null & && tail -f /var/log/lastlog





 
