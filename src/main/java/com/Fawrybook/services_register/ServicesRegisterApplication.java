package com.Fawrybook.services_register;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class ServicesRegisterApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServicesRegisterApplication.class, args);
	}

}
