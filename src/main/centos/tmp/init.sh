!/bin/sh
set -xev
source /etc/profile

# 设置环境变量 
echo "export PATH=/usr/local/pgsql/bin:$PATH" >> /etc/profile && source /etc/profile

#初始化
mkdir -pv /usr/local/pgsql/data
/usr/local/pgsql/bin/initdb -E utf8 -D /usr/local/pgsql/data

# 修改监听地址和端口
cd /usr/local/pgsql/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/usr/local/pgsql/data/postgresql.conf

# 修改远程访问权限
cd /usr/local/pgsql/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/usr/local/pgsql/data/pg_hba.conf

# 启动
nohup /usr/local/pgsql/bin/postgres    -D /usr/local/pgsql/data 2>&1 </dev/null &
#/usr/local/pgsql/bin/pg_ctl    -D /usr/local/pgsql/data start

# 添加root用户
/usr/local/pgsql/bin/psql -p5432 -Upostgres -S -c "create user root with password '123456'" postgres

# 修改postgres的密码
/usr/local/pgsql/bin/psql -p5432 -Upostgres -S -c "ALTER USER postgres WITH PASSWORD '123456'" postgres

# 登录
#psql -h 127.0.0.1 -p 5432 -U root -d postgres

 