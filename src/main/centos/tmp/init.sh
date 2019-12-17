!/bin/bash

/usr/local/pgsql/bin/initdb -E utf8 -D /usr/local/pgsql/data 

# 修改监听地址和端口
cd /usr/local/pgsql/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/usr/local/pgsql/data/postgresql.conf


# 修改远程访问权限
cd /usr/local/pgsql/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/usr/local/pgsql/data/pg_hba.conf

# 启动
nohup  /usr/local/pgsql/bin/postgres    -D /usr/local/pgsql/data 2>&1 </dev/null &
 
# 添加root用户
psql -p5432 -Upostgres -S -c "create user root with password '123456'" postgres

# 修改postgres的密码
psql -p5432 -Upostgres -S -c "ALTER USER postgres WITH PASSWORD '123456'" postgres

 