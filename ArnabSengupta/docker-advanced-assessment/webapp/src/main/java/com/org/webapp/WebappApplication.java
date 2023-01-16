package com.org.webapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class WebappApplication {

	@RestController
	class HelloWorldController{

			@GetMapping("/")
			String hello() {
				return "Hello " +"World" + "!!!";
			}
	}
	public static void main(String[] args) {
		SpringApplication.run(WebappApplication.class, args);
	}

}
