# 1.微服务简介
## 1.1.Martin Fowler微服务论文英文原版
```
https://martinfowler.com/articles/microservices.html
```
## 1.2.Martin Fowler微服务论文国内译版
	如需国内译版,请使用谷歌翻译插件翻译自行翻译

## 1.3.微服务架构图
<img src="https://cdn.jsdelivr.net/gh/lingwh1995/ImageDriver@latest/blog/backend/springcloud/springcloud-eureka/microservice_architecture.png"  width="80%" height="400rem" />

## 1.3.微服务架构落地实现方案

# 1.使用Eureka作为注册中心
## 1.1.Eureka注册中心简介
	Eureka是Netflix公司开发的服务发现框架,Spring Cloud对它提供了支持,将它集成在了自己spring-cloud-netflix子项目中,用来实现Spring Cloud的服务发现功能,
	核心
	官方网站
```
https://github.com/Netflix/eureka
```
```
https://spring.io/projects/spring-cloud-netflix
```

	架构图
<img src="https://cdn.jsdelivr.net/gh/lingwh1995/ImageDriver@latest/blog/backend/springcloud/springcloud-eureka/eureka_architecture.png"  width="80%" height="400rem" />

## 1.1.Linux重要目录介绍
	/usr → C:/Windows/ /*系统级的目录
	/usr/lib → C:/Windows/System32
	/usr/local → C:/Progrem Files/ /*用户级的程序目录，用户自己编译的软件默认会安装到这个目录下
	/opt → D:/Software /*额外安装的可选应用程序包所放置的位置。一般情况下，我们可以把tomcat等都安装到这里。
	/usr/src /*系统级的源码目录，linux内核的源代码就放在/usr/src/linux里。
	/home 存放所有用户文件的根目录，是用户主目录的基点，比如用户user的主目录就是/home/user，可以用~user表示
	/root 超级用户（系统管理员）的主目录（特权阶级^o^）
	/mnt 系统管理员安装临时文件系统的安装点，系统提供这个目录是让用户临时挂载其他的文件系统。
	/boot 存放用于系统引导时使用的各种文件
	/tmp 用于存放各种临时文件，是公用的临时文件存储点。
	/var 存放临时文件，如各种服务的日志文件。

## 1.2.Centos镜像下载
	如果是学习环境，建议安装centos mini版镜像，生产环境可以安装完整版本

@import "springcloud-eureka/pom.xml"