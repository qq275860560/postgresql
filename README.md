[TOC]
postgresql镜像

# 适用场景
适用于开发测试环境

# 功能
## 安装postgresql
## 修改监听地址和端口
## 修改远程访问权限 
## 添加root用户
## 修改postgres的密码

# 使用方式
```
docker pull qq275860560/postgresql
(docker kill postgresql || true) && (docker rm postgresql || true) 
docker run -d -p 5432:5432 --name postgresql qq275860560/postgresql

```


# 温馨提醒

* 此项目将会长期维护，增加或改进实用的功能
* 右上角点击star，给我继续前进的动力,谢谢