## Docker 整合 jenkins
#### 一、 获取镜像
```script
  docker pull jenkins
```
#### 二、 创建jenkins容器
```script
 sudo docker run -p 8088:8080 --name myjenkins -p 50000:50000 -d --env JAVA_OPTS="-Xmx8192m" --env JAVA_OPTS="-Djava.util.logging.config.file=/usr/local/share/jenkins_home/log.properties"  --env JENKINS_SLAVE_AGENT_PORT=50000 -v /usr/local/share/jenkins_home:/var/jenkins_home -v /usr/bin/docker:/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v /usr/local/share/jenkins_home/maven-3.3.9:/usr/local/maven -v /usr/local/share/jenkins_home/jdk1.8:/usr/local/jdk jenkins

```
