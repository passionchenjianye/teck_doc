### Docker笔记(一)

#### 常用命令

```script
# 以centos镜像为例

# 搜索镜像
docker search centos

# 获取镜像
docker pull centos

# 显示一个镜像的历史
docker history centos

# 启动容器
docker run --name schuckbeta/centos centos

# 以交互式方式启动容器
docker run -it --name schuckbeta/centos centos /bin/bash

# -d是在后台运行
docker run -d -it --name schuckbeta/centos centos

# 随机映射主机的端口
docker run -d -P --name schuckbeta/centos centos

# 自定义映射主机的端口
docker run -d -p 9090:8080 --name schuckbeta/centos centos

# 删除镜像
docker rmi centos

# 启动、停止、杀死、重启容器
docker start 容器名称或者容器ID
docker stop 容器名称或者容器ID
docker kill 容器名称或者容器ID
docker restart 容器名称或者容器ID

# 查看当前正在运行的容器
docker ps

# 列出所有的container
docker ps -a

# 查看最近一次启动的容器
docker ps -l

# 显示一个运行的容器里面的进程信息
docker top 容器名称或者容器ID

# 从容器里面拷贝文件/目录到本地一个路径
docker cp centos:/tmp/Test.java ~/

# 启动容器的一个进程
docker exec -it 容器ID /bin/bash

# 绑定容器
docker attach 容器ID /bin/bash

# 删除容器
docker rm 容器名称或者容器ID

# 删除全部容器
docker rm `docker ps -a -q`

```

#### 通过pid进入容器的脚本

```script
#!/bin/bash
CNAME=$1
CPID=$(docker inspect --format "{{.State.Pid}}" $CNAME)
# nsenter需要安装util-linux
nsenter --target "$CPID" --mount --uts --ipc --net --pid
```
