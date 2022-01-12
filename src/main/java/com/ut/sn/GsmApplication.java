package com.ut.sn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.swagger2.annotations.EnableSwagger2;
import springfox.documentation.swagger2.annotations.EnableSwagger2WebMvc;

@Configuration
@EnableSwagger2WebMvc
@SpringBootApplication
@EnableSwagger2
public class GsmApplication {

	public static void main(String[] args) {
		SpringApplication.run(GsmApplication.class, args);
	}

}
