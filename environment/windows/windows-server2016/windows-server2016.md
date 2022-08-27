# 1.搭建基础开发环境
# 1.1.安装jdk
# 1.1.1.安装jdk1.5
	下载jdk1.5(64位)
```
curl -fL -u software-1661635201061:b951fa2710ed220c45fe8104a47c32968160d016 \
"https://lingwh-generic.pkg.coding.net/coding-drive/software/jdk-1.5-windows-x64.zip?version=latest" \
-o jdk-1.5-windows-x64.zip
```
	配置环境变量
	JAVA_HOME
	D:\Install\develop\JDK\jdk1.5
	PATH
	%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin
	CLASSPATH
	.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar
# 1.1.2.安装jdk1.6
	下载jdk1.6(64位)
```
curl -fL -u software-1661635269701:dc992411c4328c8b858f80dd75e26084c1430ce3 \
"https://lingwh-generic.pkg.coding.net/coding-drive/software/jdk-1.6-windows-x64.zip?version=latest" \
-o jdk-1.6-windows-x64.zip
```
	配置环境变量
	JAVA_HOME
	D:\Install\develop\JDK\jdk1.6
	PATH
	%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin
	CLASSPATH
	.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar
# 1.1.3.安装jdk1.7
	下载jdk1.7(64位)
```
curl -fL -u software-1661635322447:bc66d997b7cf000b3932888504d1ac735fc4b530 \
"https://lingwh-generic.pkg.coding.net/coding-drive/software/jdk-1.7-windows-x64.zip?version=latest" \
-o jdk-1.7-windows-x64.zip
```
	配置环境变量
	JAVA_HOME
	D:\Install\develop\JDK\jdk1.7
	PATH
	%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin
	CLASSPATH
	.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar
# 1.1.4.安装jdk1.8
	下载jdk1.8(64位)
```
curl -fL -u software-1661635322447:bc66d997b7cf000b3932888504d1ac735fc4b530 \
"https://lingwh-generic.pkg.coding.net/coding-drive/software/jdk-1.8-windows-x64.zip?version=latest" \
-o jdk-1.8-windows-x64.zip
```
	配置环境变量
	JAVA_HOME
	D:\Install\develop\JDK\jdk1.8
	PATH
	%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin
	CLASSPATH
	.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar

# 2.搭建SpringCloud技术栈所需组件
## 2.1.搭建Zipkin
	安装jdk
	详细参考->1.搭建基础开发环境->1.1.安装jdk

	创建存放安装包的目录->进入该目录->下载zipkin->重命名->赋予运行权限
```
mkdir -p /opt/software/springcloud/zipkin &&
cd /opt/software/springcloud/zipkin &&
curl -fL -u springcloud-1661567629477:e7770fbb167089a0ca2df33f8c03fa548c83b4c1 \
"https://lingwh-generic.pkg.coding.net/coding-drive/springcloud/zipkin-server-2.23.9-exec.jar?version=latest" \
-o zipkin-server-2.23.9-exec.jar &&
mv zipkin-server-2.23.9-exec.jar zipkin.jar &&
chmod +x zipkin.jar
```
	如有需要在防火墙开放端口

	启动zipkin
```
java -jar zipkin.jar
```

## 2.2.搭建Apollo配置中心
### 2.2.1.Apollo配置中心简介
	Apollo(阿波罗)是一款可靠的分布式配置管理中心，诞生于携程框架研发部，能够集中化管理应用不同环境、不同集群的配置，配置修改后能够实时推送到应用端，并且具备规范的权限、流程治理等特性，适用于微服务配置管理场景。

<a href="https://www.apolloconfig.com">官方网址</a>
```
https://www.apolloconfig.com
```
<a href="https://github.com/apolloconfig">官网网址(GITHUB)</a>
```
https://github.com/apolloconfig
```

### 2.2.2.基于Apollo内置的Eureka搭建Apollo配置中心
#### 2.2.2.1.单环境版
	1.下载工程,并在本地安装所有用到的依赖
	2.修改apollo/scripts/flyway/flyway-configdb.properties和apollo/scripts/flyway/flyway-portaldb.properties中的数据库连接信息
	3.在apollo文件夹下执行如下两个命令；目的是使用flyway脚本自动创建好数据库环境
		mvn -N -Pconfigdb flyway:migrate
		mvn -N -Pportaldb flyway:migrate
	4.执行apollo/scripts/build.bat,执行完成后可以得到下面三个jar包(最好是重命名以下)
		apollo/apollo-adminservice/target/apollo-adminservice-2.0.1-SNAPSHOT.jar -> apollo-adminservice-2.0.1.jar
		apollo/apollo-configservice/target/apollo-configservice-2.0.1-SNAPSHOT.jar	-> apollo-configservice-2.0.1.jar
		apollo/apollo-portal/target/apollo-portal-2.0.1-SNAPSHOT.jar -> apollo-portal-2.0.1.jar
	5.创建启动文件夹
		-创建名称为Apollo2.0.1_built_in_eureka_dev的文件夹(版本号以实际为准)
		-把三个jar包放入文件夹中
		-创建一个logs文件夹,里面存放日志文件,日志文件名称分别是apollo-configservice.log、apollo-adminservice.log、apollo-portal.log
			注意:不用创建这三个文件,程序运行会自动创建这三个文件
		-编写一次启动三个jar的bat脚本
		
			set url="192.168.0.2:3306"
			set username="root"
			set password="123456"

			set dev_meta="http://localhost:8080/"
			set portal_port="8070"

			#启动configService
			start "configService" java -Dapollo_profile=github  -Dspring.datasource.url=jdbc:mysql://%url%/ApolloConfigDB?characterEncoding=utf8 -Dspring.datasource.username=%username% -Dspring.datasource.password=%password% -Dlogging.file.name=.\logs\apollo-configservice.log -jar .\apollo-configservice-2.0.1.jar
			#启动adminService
			start "adminService" java -Dapollo_profile=github   -Dspring.datasource.url=jdbc:mysql://%url%/ApolloConfigDB?characterEncoding=utf8 -Dspring.datasource.username=%username% -Dspring.datasource.password=%password% -Dlogging.file.name=.\logs\apollo-adminservice.log -jar .\apollo-adminservice-2.0.1.jar
			#启动portal
			start "portal" java -Dapollo_profile=github,auth -Ddev_meta=%dev_meta% -Dserver.port=%portal_port% -Dspring.datasource.url=jdbc:mysql://%url%/ApolloPortalDB?characterEncoding=utf8 -Dspring.datasource.username=%username% -Dspring.datasource.password=%password% -Dlogging.file.name=.\logs\apollo-portal.log -jar .\apollo-portal-2.0.1.jar

	6.访问地址
		Eureka注册中心: http://localhost:8080/
		Apollo配置中心: http://localhost:8070/
			登录用户名/密码: apollo/admin

#### 2.2.2.2.多环境版
	1.下载工程,并在本地安装所有用到的依赖
	2.准备数据库环境
		说明:dev和pro环境的configService、adminService用到的数据库需要分别部署,dev和pro环境的protal可以连接到同一套数据库
		-在192.168.0.2上搭建Mysql数据库相关操作:
			1>>.下载工程,并在本地安装所有用到的依赖
			2>>.修改apollo/scripts/flyway/flyway-configdb.properties和apollo/scripts/flyway/flyway-portaldb.properties中数据库连接信息修改为192.168.0.2相关配置
			3>>.修改apollo/scripts/build.bat中的数据库联连接信息
			4>>.在apollo文件夹下执行如下两个命令；目的是使用flyway脚本自动创建好数据库环境
				mvn -N -Pconfigdb flyway:migrate
				mvn -N -Pportaldb flyway:migrate
		-在192.168.0.3上搭建Mysql数据库相关操作(或者直接克隆虚拟机后修改mac地址后删除多余的数据库也可以快速建立数据库环境):
			1>.修改apollo/scripts/flyway/flyway-configdb.properties中数据库连接信息修改为192.168.0.3相关配置
			2>.在apollo文件夹下执行如下命令:
				mvn -N -Pconfigdb flyway:migrate
		-更新数据库数据
			192.168.0.2:(使用Apollo内置的Eureka一般不用执行这个操作,默认就是8080Eureka服务器)
				UPDATE apolloconfigdb.ServerConfig SET `Value` = "http://localhost:8080/eureka/" WHERE `key` = "eureka.service.url";
			192.168.0.3:
				UPDATE apolloconfigdb.ServerConfig SET `Value` = "http://localhost:8081/eureka/" WHERE `key` = "eureka.service.url";
	4.执行apollo/scripts/build.bat,执行完成后可以得到下面三个jar包(最好是重命名以下)
		apollo/apollo-adminservice/target/apollo-adminservice-2.0.1-SNAPSHOT.jar->复制一份分别命名为
			apollo-adminservice-2.0.1-dev.jar
			apollo-adminservice-2.0.1-pro.jar
		apollo/apollo-configservice/target/apollo-configservice-2.0.1-SNAPSHOT.jar->->复制一份分别命名为
			apollo-configservice-2.0.1-dev.jar
			apollo-configservice-2.0.1-pro.jar
		apollo/apollo-portal/target/apollo-portal-2.0.1-SNAPSHOT.jar -> apollo-portal-2.0.1.jar
		注意:操作完成后共得到5个jar
	5.创建运行文件夹
		-创建名称为Apollo2.0.1_eureka_built_in_pro的文件夹(版本号以实际为准)
		-把五个jar包放入文件夹中
		-创建一个logs文件夹,里面存放日志文件,日志文件名称分别是
			apollo-configservice-dev.log、apollo-configservice-pro.log、
			apollo-adminservice-dev.log、apollo-adminservice-pro.log、
			apollo-portal.log
		-编写一次启动五个jar的bat脚本
		rem dev环境数据库连接信息
		set url_dev="192.168.0.2:3306"
		set username_dev="root"
		set password_dev="123456"
		rem dev环境meta地址
		set meta_dev="http://localhost:8080/"

		rem pro环境数据库连接信息
		set url_pro="192.168.0.3:3306"
		set username_pro="root"
		set password_pro="123456"
		rem pro环境adminService访问端口
		set adminService_port_pro="8091"
		rem pro环境configService访问端口
		set configService_port_pro="8081"
		rem pro环境meta地址
		set meta_pro="http://localhost:8081/"

		rem portal端口
		set portal_port="8070"

		rem 启动dev环境configService
		start "configService-dev" java -Dapollo_profile=github -Dspring.datasource.url=jdbc:mysql://%url_dev%/ApolloConfigDB?characterEncoding=utf8 -Dspring.datasource.username=%username_dev% -Dspring.datasource.password=%password_dev% -Dlogging.file.name=.\logs\apollo-configservice-dev.log -jar .\apollo-configservice-2.0.1-dev.jar
		rem 启动dev环境adminService
		start "adminService-dev" java -Dapollo_profile=github  -Dspring.datasource.url=jdbc:mysql://%url_dev%/ApolloConfigDB?characterEncoding=utf8 -Dspring.datasource.username=%username_dev% -Dspring.datasource.password=%password_dev% -Dlogging.file.name=.\logs\apollo-adminservice-dev.log -jar .\apollo-adminservice-2.0.1-dev.jar
		rem 启动pro环境configService
		start "configService-pro" java -Dapollo_profile=github -DServer.port=%configService_port_pro% -Dspring.datasource.url=jdbc:mysql://%url_pro%/ApolloConfigDB?characterEncoding=utf8 -Dspring.datasource.username=%username_pro% -Dspring.datasource.password=%password_pro% -Dlogging.file.name=.\logs\apollo-configservice-pro.log -jar .\apollo-configservice-2.0.1-pro.jar
		rem 启动pro环境adminService
		start "adminService-pro" java -Dapollo_profile=github  -DServer.port=%adminService_port_pro%  -Dspring.datasource.url=jdbc:mysql://%url_pro%/ApolloConfigDB?characterEncoding=utf8 -Dspring.datasource.username=%username_pro% -Dspring.datasource.password=%password_pro% -Dlogging.file.name=.\logs\apollo-adminservice-pro.log -jar .\apollo-adminservice-2.0.1-pro.jar
		rem 启动portal
		start "ApolloPortal" java -Dapollo_profile=github,auth -Ddev_meta=%meta_dev% -Dpro_meta=%meta_pro% -Dserver.port=%portal_port% -Dspring.datasource.url=jdbc:mysql://%url_dev%/ApolloPortalDB?characterEncoding=utf8 -Dspring.datasource.username=%username_dev% -Dspring.datasource.password=%password_dev% -Dlogging.file.name=.\logs\apollo-portal.log -jar .\apollo-portal-2.0.1.jar

	6.添加系统参数
		访问http://localhost:8070/,进入Apollo配置界面
		-登录用户名/密码:	apollo/admin
		-管理员工具->系统参数->输入key值/Value值:
		添加新部门:	[{"orgId":"TEST1","orgName":"样例部门1"},{"orgId":"TEST2","orgName":"样例部门2"},{"orgId":"micro_service","orgName":"微服务部门"}]
		创建多环境:
			key:    apollo.portal.envs
			value:  dev,pro
	7.访问地址
		Eureka注册中心1: http://localhost:8080/
		Eureka注册中心2: http://localhost:8081/
		Apollo配置中心: http://localhost:8070/
			登录用户名/密码: apollo/admin
	8.特別注意事项
		-dev环境和pro环境需要不同的数据库地址,
			即需要两套Mysql环境,第一套中有apolloconfigdb、apolloportaldb两个库,第二套 环境中只有apolloconfigdb这个库
		-启动dev环境和pro环境时,不要再运行参数中覆盖eureka的service-url,要修改数据库中的数据,因为这个配置是从数据库中获取的
			192.168.0.2:(使用Apollo内置的Eureka一般不用执行这个操作,默认就是8080Eureka服务器)
				UPDATE apolloconfigdb.ServerConfig SET `Value` = "http://localhost:8080/eureka/" WHERE `key` = "eureka.service.url";
			192.168.0.3:
				UPDATE apolloconfigdb.ServerConfig SET `Value` = "http://localhost:8081/eureka/" WHERE `key` = "eureka.service.url";
		当数据库中没有这个参数时,使用启动时参数修改才有效
		-如果启动后多环境现实不正常,直接重启下Portal,再刷新页面即可

