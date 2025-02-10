# Eureka Server Setup and Configuration

## Overview
Eureka is a service discovery pattern implementation, where services can register themselves and discover other services by name. This documentation covers setting up a Eureka server with Spring Boot.

## Dependencies
Include the following dependency in your `pom.xml` for a Maven project or in your `build.gradle` for a Gradle project:

**Maven:**
```xml
<dependencies>
    <dependency>
        <groupId>org.springframework.cloud</groupId>
        <artifactId>spring-cloud-starter-netflix-eureka-server</artifactId>
    </dependencies>
</dependencies>
```

**Gradle:**
```groovy
dependencies {
    implementation 'org.springframework.cloud:spring-cloud-starter-netflix-eureka-server'
}
```

## Configuration

### Application Properties
In your `application.properties` or `application.yml`, enable the Eureka Server and set the appropriate configuration properties.

**application.properties:**
```properties
spring.application.name=eureka-server
server.port=8761

eureka.client.register-with-eureka=false
eureka.client.fetch-registry=false
eureka.instance.hostname=localhost
```

### Enable Eureka Server
Annotate your main application class with `@EnableEurekaServer` to activate the Eureka Server.

**Java:**
```java
@SpringBootApplication
@EnableEurekaServer
public class EurekaServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class, args);
    }
}
```

## Running the Eureka Server
Run the application using your IDE or through the command line:

**Command Line:**
```bash
mvn spring-boot:run
```

or for Gradle:

```bash
gradle bootRun
```

## Accessing Eureka Dashboard
Once the server is running, you can access the Eureka Dashboard by visiting `http://localhost:8761` in your web browser. This dashboard will show all registered services.

## Registering Client Services
To register client services with Eureka, include the `spring-cloud-starter-netflix-eureka-client` dependency and configure your application to locate the Eureka server.

**Client configuration example:**
```properties
spring.application.name=my-client-service
server.port=8080

eureka.client.serviceUrl.defaultZone=http://localhost:8761/eureka/
```

This configuration allows services to register with Eureka and discover other services.
