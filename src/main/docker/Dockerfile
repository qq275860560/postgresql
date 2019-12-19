FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

# 下载
RUN cd /tmp && curl -O http://get.enterprisedb.com/postgresql/postgresql-9.4.9-1-linux-x64-binaries.tar.gz

# 解压
RUN cd /tmp && tar xzf postgresql-9.4.9-1-linux-x64-binaries.tar.gz -C /usr/local/

# 设置环境变量 
RUN echo "export PATH=/usr/local/pgsql/bin:$PATH" >> /etc/profile && source /etc/profile

# 创建用户
RUN groupadd postgres  &&\
    useradd -g postgres postgres &&\   
    chown -R postgres:postgres /usr/local/pgsql 

# 初始化
RUN su postgres -c  "cd /tmp && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/tmp/init.sh  &&  sh ./init.sh "

CMD su postgres -c "nohup /usr/local/pgsql/bin/postgres    -D /usr/local/pgsql/data" 2>&1 </dev/null & && tail -f /var/log/lastlog
                    




 
