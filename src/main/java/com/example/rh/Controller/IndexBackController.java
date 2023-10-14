package com.example.rh.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class IndexBackController {

    @GetMapping("back-office-index")
    public String index() { return "home/index"; }

}
