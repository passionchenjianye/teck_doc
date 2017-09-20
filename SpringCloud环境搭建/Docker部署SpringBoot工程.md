#### 一、准备必要文件

eureka-server-0.0.1-SNAPSHOT-8081.jar // 可以启动的springboot应用

jdk1.8.0_131

#### 二、创建Dockerfile文件

```Dockerfile

# 以centos最新版本的镜像为基础
FROM centos:latest

# 维护者
MAINTAINER Tony

# 将Dockerfile文件所在目录的jdk1.8.0_131拷贝到容器的根目录下(目录可以自定义)
COPY jdk1.8.0_131 jdk1.8.0_131

# 将应用的jar包重命名
ADD eureka-server-0.0.1-SNAPSHOT-8081.jar eureka-server.jar

# 设置Java的环境变量
ENV JAVA_HOME=/jdk1.8.0_131
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

# 暴露8081端口
EXPOSE 8081

# 运行程序
ENTRYPOINT ["java","-jar","/eureka-server.jar"]

```

#### 三、编译并生成镜像

```script
docker build -t tony/eureka-server .
```

#### 四、创建容器并运行

```script
docker run -p 192.168.0.111:8081:8081 --name eureka-server tony/eureka-server
```
