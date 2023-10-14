package com.example.rh.Controller;

import org.springframework.web.bind.annotation.GetMapping;

public class ServiceController {

    @GetMapping("back-office-service")
    public String service() {
        return "home/services/service";
    }
}
