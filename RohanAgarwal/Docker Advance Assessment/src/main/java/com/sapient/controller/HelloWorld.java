package com.sapient.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWorld {
    @GetMapping("/")
    String sayHello(){
        return "Hello World";
    }
}
