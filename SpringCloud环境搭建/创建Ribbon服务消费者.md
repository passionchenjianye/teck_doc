##### 创建一个Ribbon服务消费者(service-ribbon)
* 创建service-ribbon工程：File->New->Project->Spring Initializr->Cloud Routing->Ribbon

* service-ribbon工程的pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.xunyijia.base</groupId>
	<artifactId>service-ribbon</artifactId>
	<version>0.0.1-SNAPSHOT-8085</version>
	<packaging>jar</packaging>

	<name>service-ribbon</name>
	<description>Spring Cloud Service Ribbon</description>

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
			<artifactId>spring-cloud-starter-ribbon</artifactId>
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
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-web</artifactId>
			<version>4.3.8.RELEASE</version>
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
  port: 8085
spring:
  application:
    name: service-ribbon
```

* 启动入口类

```java
package com.xunyijia.service.ribbon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@EnableDiscoveryClient
public class ServiceRibbonApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceRibbonApplication.class, args);
	}

	@Bean
	@LoadBalanced
	RestTemplate restTemplate() {
		return new RestTemplate();
	}
}

```

* 服务层

```java
package com.xunyijia.service.ribbon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * @ClassName: WelcomeService.java
 * @Description:
 * @Author: Tony
 * @Date: 2017-05-10 12:38
 */
@Service
public class WelcomeService {

    @Autowired
    RestTemplate restTemplate;

    public String welcome(String name) {
        return restTemplate.getForObject("http://eureka-client/springcloud?name=" + name, String.class);
    }
}

```

* web层

```java
package com.xunyijia.service.ribbon.web;

import com.xunyijia.service.ribbon.service.WelcomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName: WelcomeController.java
 * @Description:
 * @Author: Tony
 * @Date: 2017-05-10 12:48
 */
@RestController
public class WelcomeController {

    @Autowired
    WelcomeService welcomeService;

    @RequestMapping(value = "/springcloud", method = RequestMethod.GET)
    public String welcome(@RequestParam String name) {
        return welcomeService.welcome(name);
    }

}
```

* 访问service-ribbon服务

http://localhost:8085/springcloud?name=Jordan

浏览器会交替出现

welcome Jordan I am port from `8082`
和
welcome Jordan I am port from `8083`
