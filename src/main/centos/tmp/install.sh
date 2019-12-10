!/bin/bash

# 安装前置依赖
yum -y install https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm

# 安装postgresql服务器
yum -y install postgresql11-server 
# 安装postgresql客户端
yum -y install postgresql11 

# 切换到安装目录
cd /usr/pgsql-11

# 初始化
/usr/pgsql-11/bin/postgresql-11-setup initdb

# 切换到数据目录是
cd /var/lib/pgsql/11/data

# 修改监听地址和端口
cd /var/lib/pgsql/11/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/var/lib/pgsql/11/data/postgresql.conf
                                     
# 修改远程访问权限 
cd /var/lib/pgsql/11/data/ && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/var/lib/pgsql/11/data/pg_hba.conf

# 启动
systemctl start postgresql-11
# 重启
#systemctl restart postgresql-11

# 进入PostgreSQL
su postgres

# 添加root用户
psql -p5432 -Upostgres -S -c "create user root with password '123456'" postgres

# 修改postgres的密码
psql -p5432 -Upostgres -S -c "ALTER USER postgres WITH PASSWORD '123456'" postgres

