package com.example.springDevspaceExample.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.web.bind.annotation.RestController
@RequestMapping("/")
public class RestController {

    @RequestMapping("/test")
    public String test() {
        return "test hhhhhh";
    }
}
