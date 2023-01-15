package com.example.websocketdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class WebsocketDemoApplication extends SpringBootServletInitializer {

	@RestController
	class helloworldController{

			@GetMapping("/hello")
			String hello() {
				return "Hello " +"World" + "!!!";
			}
	}

	public static void main(String[] args) {
		SpringApplication.run(WebsocketDemoApplication.class, args);
	}
}
