FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

RUN cd /tmp && curl -O http://get.enterprisedb.com/postgresql/postgresql-9.4.9-1-linux-x64-binaries.tar.gz

RUN cd /tmp && tar xzf postgresql-9.4.9-1-linux-x64-binaries.tar.gz -C /usr/local/

RUN echo "export PATH=/usr/local/pgsql/bin:$PATH" >> /etc/profile && source /etc/profile

RUN mkdir -pv /usr/local/pgsql/data &&\
    groupadd postgres  &&\
    useradd -g postgres postgres &&\
    chown -R postgres.postgres /usr/local/pgsql

RUN su postgres -c "/usr/local/pgsql/bin/initdb -E utf8 -D /usr/local/pgsql/data"

RUN nohup su postgres -c "/usr/local/pgsql/bin/postgres    -D /usr/local/pgsql/data" 2>&1 </dev/null &

RUN su postgres                                     
RUN psql -p5432 -Upostgres -S -c "create user root with password '123456'" postgres
RUN psql -p5432 -Upostgres -S -c "ALTER USER postgres WITH PASSWORD '123456'" postgres

CMD nohup su postgres -c "/usr/local/pgsql/bin/postgres    -D /usr/local/pgsql/data" 2>&1 </dev/null & && tail -f /var/log/lastlog





 
