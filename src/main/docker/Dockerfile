FROM centos

MAINTAINER jiangyuanlin@163.com

# 下载
RUN cd /tmp && curl -O http://get.enterprisedb.com/postgresql/postgresql-9.4.9-1-linux-x64-binaries.tar.gz

# 解压
RUN cd /tmp && tar xzf postgresql-9.4.9-1-linux-x64-binaries.tar.gz -C /usr/local/

# 创建用户
RUN groupadd postgres  &&\
    useradd -g postgres postgres &&\   
    chown -R postgres:postgres /usr/local/pgsql 

# 中文语言     
RUN  yum -y install  langpacks-zh_CN.noarch && yum -y reinstall glibc-common   &&\
     echo 'export LANG=zh_CN.UTF-8'  >> /etc/profile && source /etc/profile &&\
     echo 'export LANGUAGE=zh_CN:zh'  >> /etc/profile && source /etc/profile   &&\
     echo 'export LC_ALL=zh_CN.UTF-8'  >> /etc/profile && source /etc/profile

# 初始化
RUN su postgres -c  "cd /tmp && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/tmp/init.sh  && chmod 777 ./init.sh  && sh ./init.sh "

CMD su postgres -c "nohup /usr/local/pgsql/bin/postgres    -D /usr/local/pgsql/data" 2>&1 </dev/null & && tail -f /var/log/lastlog
                    




 
