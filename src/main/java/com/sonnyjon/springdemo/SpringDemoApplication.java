package com.sonnyjon.springdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages="com.sonnyjon.springdemo")
public class SpringDemoApplication extends SpringBootServletInitializer
{	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) 
	{
		return builder.sources(SpringDemoApplication.class);
	}

	public static void main(String[] args) 
	{
		SpringApplication.run(SpringDemoApplication.class, args);
	}
}
