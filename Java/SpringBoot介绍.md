## Spring Boot

#### 一、Spring Boot概述
Spring Boot是在2013年末伴随着Spring4.0一起诞生的，它是Spring社区发布的一个开源项目，旨在帮助开发者快速并且更简单的构建项目，并且在开发过程中大量使用“约定优先配置”的思想来摆脱Spring框架中各类繁复纷杂的配置。

Spring Boot正是在这样的一个背景下被抽象出来的开发框架，它本身并不提供Spring框架的核心特性以及扩展功能，只是用于快速、敏捷地开发新一代基于Spring框架的应用程序。也就是说，它并不是用来替代Spring的解决方案，而是和Spring框架紧密结合用于提升Spring开发者体验的工具。同时它集成了大量常用的第三方库配置（例如Jackson, JDBC, Mongo, Redis, Mail等等），Spring Boot应用中这些第三方库几乎可以零配置的开箱即用，大部分的Spring Boot应用都只需要非常少量的配置代码，开发者能够更加专注于业务逻辑。且分布式框架Spring Cloud也是基于Spring Boot的。

#### 二、Spring Boot解决的问题
  1. Spring Boot使编码变简单
  2. Spring Boot使配置变简单
  3. Spring Boot使部署变简单
  4. Spring Boot使监控变简单

#### 三、Spring Boot核心功能
1. 内置Servlet容器Tomcat、Jetty、Undertow。默认是tomcat，可是自定义切换。
```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-web</artifactId>
  <exclusions>
  <exclusion>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-tomcat</artifactId>
  </exclusion>
  </exclusions>
</dependency>
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-jetty</artifactId>
</dependency>
```

2. 独立运行项目
```script
  java -jar xxx.jar
  java -jar xxx.jar --server.port:8088
```

3. 提供starter简化Maven配置, 并减少包之间的版本冲突
```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  	<modelVersion>4.0.0</modelVersion>
  	<parent>
  		<groupId>org.springframework.boot</groupId>
  		<artifactId>spring-boot-starters</artifactId>
  		<version>1.5.8.RELEASE</version>
  	</parent>
  	<artifactId>spring-boot-starter-xunyijia</artifactId>
  	<name>Xunyijia Starter</name>

  	<properties>
  		<main.basedir>${basedir}/../..</main.basedir>
  	</properties>
  	<dependencies>
      <dependency>
        <groupId>com.xunyijia</groupId>
        <artifactId>xyj-common</artifactId>
        <version>1.0-SNAPSHOT</version>
      </dependency>
      <dependency>
        <groupId>com.xunyijia</groupId>
        <artifactId>xyj-test</artifactId>
        <version>1.0-SNAPSHOT</version>
      </dependency>
      <dependency>
        <groupId>com.xunyijia</groupId>
        <artifactId>xyj-io</artifactId>
        <version>1.0-SNAPSHOT</version>
      </dependency>
      <dependency>
        <groupId>com.xunyijia</groupId>
        <artifactId>xyj-log</artifactId>
        <version>1.0-SNAPSHOT</version>
      </dependency>
      <dependency>
        <groupId>com.xunyijia</groupId>
        <artifactId>xyj-flog</artifactId>
        <version>1.0-SNAPSHOT</version>
      </dependency>
  	</dependencies>
  </project>
```
4. 应用监控

  SpringBoot提供基于http ssh telnet对运行时的项目进行监控

#### 四、Spring Boot优缺点

优点：
> 1. 快速构建项目
> 2. 对主流开发框架无配置集成
> 3. 项目独立运行，无需外部依赖Servlet容器
> 4. 极大的提高开发和部署效率
> 5. SpringCloud的基础

缺点：
> 1. 依赖Spring
> 2. 需对SpringBoot运行机制熟悉，才可以很快定位问题


#### 五、搭建Web工程Demo
1. Maven依赖
```xml
  <parent>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-parent</artifactId>
      <version>1.4.1.RELEASE</version>
  </parent>
  <dependencies>
      <dependency>
          <groupId>org.springframework.boot</groupId>
          <artifactId>spring-boot-starter-web</artifactId>
      </dependency>
  </dependencies>
```

2. 编写一个类包含处理HTTP请求的方法以及一个main()函数
```java
  @Controller
  @EnableAutoConfiguration
  public class SampleController {

      @RequestMapping("/")
      @ResponseBody
      String home() {
          return "Hello World!";
      }

      public static void main(String[] args) throws Exception {
          SpringApplication.run(SampleController.class, args);
      }
  }
```
