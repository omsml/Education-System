package com.example.leavemanagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
    return "index_page"; // No longer conflicts with a "/home" URL
    }

}
