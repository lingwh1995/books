springcloud-basic-sample-provider-cluster-node-payment8009
|-- docker
|   •-- Dockerfile
|-- src
|   •-- main
|       |-- java
|       |   •-- org
|       |       •-- openatom
|       |           •-- springcloud
|       |               |-- config
|       |               |   •-- VirtualIpConfig.java
|       |               |-- controller
|       |               |   •-- PaymentController.java
|       |               |-- dao
|       |               |   •-- PaymentDao.java
|       |               |-- service
|       |               |   |-- impl
|       |               |   |   •-- PaymentServiceImpl.java
|       |               |   •-- PaymentService.java
|       |               •-- BasicSamplePaymentServiceProviderClusterNode8009.java
|       •-- resources
|           |-- dev
|           |   |-- mapper
|           |   |   •-- PaymentMapper.xml
|           |   |-- application-dev.yml
|           |   |-- application.yml
|           |   •-- logback-custom.xml
|           |-- prod
|           |   |-- mapper
|           |   |   •-- PaymentMapper.xml
|           |   |-- application-prod.yml
|           |   |-- application.yml
|           |   •-- logback-custom.xml
|           |-- rancher
|           |   |-- mapper
|           |   |   •-- PaymentMapper.xml
|           |   |-- application-rancher.yml
|           |   |-- application.yml
|           |   •-- logback-custom.xml
|           •-- test
|               |-- mapper
|               |   •-- PaymentMapper.xml
|               |-- application-test.yml
|               |-- application.yml
|               •-- logback-custom.xml
•-- pom.xml