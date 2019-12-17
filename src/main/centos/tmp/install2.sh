!/bin/bash

# 下载postgresql
cd /tmp && curl -O http://get.enterprisedb.com/postgresql/postgresql-9.4.9-1-linux-x64-binaries.tar.gz
# 解压
tar xzf postgresql-9.4.9-1-linux-x64-binaries.tar.gz -C /usr/local/

# 设置环境变量 
echo "export PATH=/usr/local/pgsql/bin:$PATH" >> /etc/profile && source /etc/profile

# 创建数据目录
mkdir -pv /usr/local/pgsql/data

# 创建用户
groupadd postgres 
useradd -g postgres postgres
chown -R postgres.postgres /usr/local/pgsql

# 切换postgres用户
su postgres

#初始化
/usr/local/pgsql/bin/initdb -E utf8 -D /usr/local/pgsql/data

# 修改监听地址和端口
cd /usr/local/pgsql/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/usr/local/pgsql/data/postgresql.conf

# 修改远程访问权限
cd /usr/local/pgsql/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/usr/local/pgsql/data/pg_hba.conf

# 启动
nohup /usr/local/pgsql/bin/postgres    -D /usr/local/pgsql/data 2>&1 </dev/null &
#/usr/local/pgsql/bin/pg_ctl    -D /usr/local/pgsql/data start

# 添加root用户
psql -p5432 -Upostgres -S -c "create user root with password '123456'" postgres

# 修改postgres的密码
psql -p5432 -Upostgres -S -c "ALTER USER postgres WITH PASSWORD '123456'" postgres

# 登录
#psql -h 127.0.0.1 -p 5432 -U root -d postgres
