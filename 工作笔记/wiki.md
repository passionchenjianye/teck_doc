#### 搭建公司wiki

##### 1. 选择wiki

MinDoc 基于SmartWiki框架，使用go语言开发的一个开源的wiki项目


##### 2. 安装wiki

使用docker安装，未安装docker的请自行安装之后再安装wiki.

配置mysql

> MYSQL_PORT_3306_TCP_ADDR    MySQL地址

> MYSQL_PORT_3306_TCP_PORT    MySQL端口号

> MYSQL_INSTANCE_NAME         MySQL数据库名称

> MYSQL_USERNAME              MySQL账号

> MYSQL_PASSWORD              MySQL密码

> HTTP_PORT                   程序监听的端口号


docker run -p 8181:8181 -e MYSQL_PORT_3306_TCP_ADDR=127.0.0.1 -e MYSQL_PORT_3306_TCP_PORT=3306 -e MYSQL_INSTANCE_NAME=mindoc_db -e MYSQL_USERNAME=root -e MYSQL_PASSWORD=wusc.321 -e httpport=8181 -d daocloud.io/lifei6671/godoc:latest
