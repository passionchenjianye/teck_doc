### 搭建SpringCloud 微服务

##### 一、工程规划
若有新添加的工程请往表格里追加

|            工程名称        |   描述
| ------------------------  |--------------- |
|com-xunyijia-config-server | 配置中心         |
|com-xunyijia-config-client | 获取配置的服务端  |
|com-xunyijia-eureka-server | 服务注册中心     |
|com-xunyijia-eureka-client | 服务注册服务端   |

##### 二、创建工程
* 创建配置中心(com-xunyijia-config-server)

  第一步、 在创建配置中心之前首先创建一个本地的git仓库，步骤如下:
  ```script
  git init --bare config-server
  cd config-server
  mkdir config
  cd config
  touch config-client.yml
  ```
  编辑config-client.yml文件内容为
  ```yml
  my-config:
    appName: what the fuck
  ```
  然后提交到github上
  ```script
  git add .
  git commit -m "配置文件"
  git push origin master
  ```

  第二步、创建maven工程，pom.xml如下
  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  	<modelVersion>4.0.0</modelVersion>

  	<groupId>com.xunyijia.base.parent</groupId>
  	<artifactId>com-xunyijia-config-server</artifactId>
  	<version>0.0.1-SNAPSHOT</version>
  	<packaging>jar</packaging>

  	<name>com-xunyijia-config-server</name>
  	<description>SpringCloud Config Server</description>

  	<parent>
  		<groupId>org.springframework.boot</groupId>
  		<artifactId>spring-boot-starter-parent</artifactId>
  		<version>1.5.3.RELEASE</version>
  		<relativePath/> <!-- lookup parent from repository -->
  	</parent>

  	<properties>
  		<project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
  		<project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
  		<java.version>1.8</java.version>
  		<spring-cloud.version>Dalston.RELEASE</spring-cloud.version>
  	</properties>

  	<dependencies>
  		<dependency>
  			<groupId>org.springframework.cloud</groupId>
  			<artifactId>spring-cloud-config-server</artifactId>
  		</dependency>

  		<dependency>
  			<groupId>org.springframework.boot</groupId>
  			<artifactId>spring-boot-starter-test</artifactId>
  			<scope>test</scope>
  		</dependency>
  	</dependencies>

  	<dependencyManagement>
  		<dependencies>
  			<dependency>
  				<groupId>org.springframework.cloud</groupId>
  				<artifactId>spring-cloud-dependencies</artifactId>
  				<version>${spring-cloud.version}</version>
  				<type>pom</type>
  				<scope>import</scope>
  			</dependency>
  		</dependencies>
  	</dependencyManagement>

  	<build>
  		<plugins>
  			<plugin>
  				<groupId>org.springframework.boot</groupId>
  				<artifactId>spring-boot-maven-plugin</artifactId>
  			</plugin>
  		</plugins>
  	</build>
  </project>

  ```
  编译、安装
  ```script
  mvn clean install
  ```

  第三步、创建ConfigServerApplication和application.yml配置文件

  ConfigServerApplication.java
  ```Java
  package com.xunyijia.config.server;

  import org.springframework.boot.SpringApplication;
  import org.springframework.boot.autoconfigure.SpringBootApplication;
  import org.springframework.cloud.config.server.EnableConfigServer;

  @SpringBootApplication
  @EnableConfigServer
  public class ConfigServerApplication {

  	public static void main(String[] args) {
  		SpringApplication.run(ConfigServerApplication.class, args);
  	}
  }

  ```

  application.yml
  ```yml
  server:
    port: 8081
    security:
        enabled: false

  spring:
    cloud:
      config:
        server:
          git:
            uri: https://github.com/passionchenjianye/config-server
            searchPaths: config
  ```
