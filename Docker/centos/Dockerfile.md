```Dockerfile
# 基于centos镜像  
FROM centos:latest

# 维护人信息
MAINTAINER schuckbeta "passionchenjianye@gmail.com"

# 创建目录
RUN cd /tmp && curl -L 'http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz

RUN mkdir /usr/local/java \
    && mkdir /usr/local/maven \
    && mkdir /usr/local/maven/mavenRepo
RUN mv /tmp/jdk1.8.0_151/ /usr/local/java/


# 拷贝文件
COPY ./maven-3.3.9/ /usr/local/maven/

# 设置jdk, maven环境变量
ENV JAVA_HOME /usr/local/java/jdk1.8.0_151
ENV PATH $PATH:$JAVA_HOME/bin
ENV M2_HOME /usr/local/maven/maven-3.3.9
ENV PATH $PATH:$M2_HOME/bin
```

RUN yum install -y mysql-server mysql
