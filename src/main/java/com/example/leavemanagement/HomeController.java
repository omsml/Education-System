package com.example.leavemanagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index() {
        return "home"; // This looks for home.jsp based on your prefix/suffix
    }
}