springcloud-config-apollo-loadbalance-openfeign-configuration-order80
|-- src
|   •-- main
|       |-- java
|       |   •-- org
|       |       •-- openatom
|       |           •-- springcloud
|       |               |-- config
|       |               |   •-- OpenFeignConfig.java
|       |               |-- controller
|       |               |   |-- ApolloConfigController.java
|       |               |   |-- OrderConsumerController.java
|       |               |   •-- RestartApplicationController.java
|       |               |-- listener
|       |               |   |-- ApolloPropertiesChangedListener.java
|       |               |   •-- AutomaticApolloWatcher.java
|       |               |-- service
|       |               |   •-- PaymentServiceOpenFeign.java
|       |               •-- OrderServiceConsumerApolloLoadBalanceOpenFeignConfiguration80.java
|       •-- resources
|           |-- apollo-env.properties
|           •-- application.yml
•-- pom.xml