!/bin/sh

# 下载postgresql
cd /tmp && curl -O http://get.enterprisedb.com/postgresql/postgresql-9.4.9-1-linux-x64-binaries.tar.gz

# 解压
tar xzf postgresql-9.4.9-1-linux-x64-binaries.tar.gz -C /usr/local/

# 设置环境变量 
echo "export PATH=/usr/local/pgsql/bin:$PATH" >> /etc/profile && source /etc/profile

# 创建用户
groupadd postgres 
useradd -g postgres postgres
chown -R postgres:postgres /usr/local/pgsql

# 初始化
su postgres -c  " cd /tmp && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/tmp/init.sh  && chmod 777 ./init.sh && ./init.sh "

