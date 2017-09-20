##### 创建一个feign的服务(service-feign)
* 创建步骤：File->New->Project->Spring Initializr->Cloud Routing->Feign

* 修改eureka-server和eureka-client工程的pom.xml

```xml
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
				<!-- 添加此配置，可以使用java -jar命令来启动SpringBootApplication程序 -->
				<configuration>
					<fork>true</fork>
				</configuration>
			</plugin>
		</plugins>
	</build>
```

* 启动一个eureka-server实例(8081)和两个eureka-client实例(8082、8083), 为了区分，在打包时在version后面都加上了对应的端口号。

```script
java -jar eureka-server-0.0.1-SNAPSHOT-8081.jar
java -jar eureka-client-0.0.1-SNAPSHOT-8082.jar
java -jar eureka-client-0.0.1-SNAPSHOT-8083.jar
```

* 创建service-feign工程
 File->New->Project->Spring Initializr->Cloud Routing->Feign
此时service-feign即是服务提供者，也是服务消费者
 pom.xml文件如下：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.xunyijia.base</groupId>
	<artifactId>service-feign</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>jar</packaging>

	<name>service-feign</name>
	<description>Spring Cloud Service Feign</description>

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
			<artifactId>spring-cloud-starter-eureka</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.cloud</groupId>
			<artifactId>spring-cloud-starter-feign</artifactId>
		</dependency>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
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
				<configuration>
					<fork>true</fork>
				</configuration>
			</plugin>
		</plugins>
	</build>


</project>

 ```

 * 配置文件(application.yml)

```yml
eureka:
  client:
    serviceUrl:
      defaultZone: http://localhost:8081/eureka/
server:
  port: 8084
spring:
  application:
    name: service-feign
```

* 程序入口类

```java
package com.xunyijia.service.feign;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients
public class ServiceFeignApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceFeignApplication.class, args);
	}
}

```

* feign服务接口

```java
package com.xunyijia.service.feign.facade;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @ClassName: UserService.java
 * @Description:
 * @Author: Tony
 * @Date: 2017-05-09 18:56
 */
@FeignClient(value = "eureka-client")// 这里是服务的名称
public interface UserService {

    @RequestMapping(value = "/springcloud", method = RequestMethod.GET)
    String welcome(@RequestParam(value = "name") String name);
}

```

* web层

```java
package com.xunyijia.service.feign.web;

import com.xunyijia.service.feign.facade.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName: WelcomeController.java
 * @Description:
 * @Author: Tony
 * @Date: 2017-05-09 18:59
 */
@RestController
public class WelcomeController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/springcloud",method = RequestMethod.GET)
    public String welcome(@RequestParam String name) {
        return userService.welcome(name);
    }
}

```

* 访问service-feign服务

http://localhost:8084/springcloud?name=Jordan

浏览器会交替出现

welcome Jordan I am port from `8082`
和
welcome Jordan I am port from `8083`
