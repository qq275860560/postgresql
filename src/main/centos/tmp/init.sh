!/bin/bash

/usr/local/pgsql/bin/initdb -E utf8 -D /usr/local/pgsql/data 

netstat -anltp

/usr/local/pgsql/bin/postgres    -D /usr/local/pgsql/data 
 
# 添加root用户
psql -p5432 -Upostgres -S -c "create user root with password '123456'" postgres

# 修改postgres的密码
psql -p5432 -Upostgres -S -c "ALTER USER postgres WITH PASSWORD '123456'" postgres

 