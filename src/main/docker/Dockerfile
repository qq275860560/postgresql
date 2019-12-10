FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com


RUN cd /tmp && curl -O https://raw.githubusercontent.com/qq275860560/postgresql/master/src/main/centos/tmp/install.sh && chmod +x /tmp/install.sh
RUN cd /tmp && chmod +x ./install.sh && ./install.sh

CMD systemctl start postgresql-11




 
