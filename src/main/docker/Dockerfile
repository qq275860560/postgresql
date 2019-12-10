FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com


RUN cd /tmp && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/tmp/install.sh && chmod +x /tmp/install.sh
RUN cd /tmp && chmod +x ./install.sh && ./install.sh

RUN nohup su postgres -c "/usr/pgsql-11/bin/postmaster    -D /var/lib/pgsql/11/data/" 2>&1 </dev/null &

 
RUN su postgres

RUN psql -p5432 -Upostgres -S -c "create user root with password '123456'" postgres

RUN psql -p5432 -Upostgres -S -c "ALTER USER postgres WITH PASSWORD '123456'" postgres


CMD nohup su postgres -c "/usr/pgsql-11/bin/postmaster    -D /var/lib/pgsql/11/data/" 2>&1 </dev/null & && tail -f /var/log/lastlog





 
