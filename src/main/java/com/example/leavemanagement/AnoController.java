package com.example.leavemanagement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class AnoController {
    @Autowired
    JdbcTemplate jdbc;

    @PostMapping("/register")

    public String register_save(@RequestParam("name") String name,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("mobile") String mobile,
            @RequestParam("role") String role,
            Model model) {

        jdbc.execute("insert into user_master values('" + name + "','" + email + "','" + password + "','" + mobile
                + "','" + role + "','1')");
        model.addAttribute("sms", "Register Success");
        return regestration();
    }

    @GetMapping("/regestration")
    public String regestration() {
        return "regestration";
    }

    @PostMapping("/contact")
    public String contact_save(@RequestParam("Name") String Name,
            @RequestParam("Email") String Email,
            @RequestParam("Message") String Message,
            Model model) {

        jdbc.execute("insert into contact_master values('" + Name + "','" + Email + "','" + Message + "')");
        model.addAttribute("sms", "Submitted Succesfully");
        return contact();
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/submit_login")
    public String login_chk(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
            HttpSession session) {
        ArrayList<String> ali = new ArrayList<String>();
        String sql = "select * from user_master where email='" + email + "' and password='" + password + "'";
        jdbc.query(sql, new RowMapper<String>() {
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                ali.add(rs.getString(1)); // name
                ali.add(rs.getString(2)); // email
                ali.add(rs.getString(3)); // password
                ali.add(rs.getString(4)); // mob
                ali.add(rs.getString(5)); // role
                ali.add(rs.getString(6)); // status
                return "";
            }
        });
        if (ali.isEmpty()) {
            model.addAttribute("sms", "Invalid Details");
            return "login";
        } else {
            if ((ali.get(5)).equalsIgnoreCase("1")) {
                session.setAttribute("name", ali.get(0));
                session.setAttribute("email", ali.get(1));
                if ((ali.get(4)).equalsIgnoreCase("admin")) {
                    return "admindashboard";
                } else if ((ali.get(4)).equalsIgnoreCase("faculty")) {
                    return "facultydashboard";
                } else if ((ali.get(4)).equalsIgnoreCase("student")) {
                    return "studentdashboard";
                } else {
                    model.addAttribute("sms", "some error ..");
                     return "login";
                }

            } else {
                model.addAttribute("sms", "Plz Contact to Admin");
                return "login";
            }

        }

    }

    @PostMapping("/add_num")
    public String add_num(@RequestParam("f") int f, @RequestParam("s") int s, Model model) {
        int r = f + s;
        model.addAttribute("result", r);
        return "index";
    }

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/admindashboard")
    public String admindashboard() {
        return "admindashboard";
    }

    @GetMapping("/studentdashboard")
    public String studentdashboard() {
        return "studentdashboard";
    }

    @GetMapping("/facultydashboard")
    public String facultydashboard() {
        return "facultydashboard";
    }

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/header")
    public String header() {
        return "home";
    }

    @GetMapping("/footer")
    public String footer() {
        return "home";
    }

    @GetMapping("/body")
    public String body() {
        return "home";
    }


    
    
    @GetMapping("/faq")
    public String view_faq(Model model) {
        List<Map<String,Object>> li=jdbc.queryForList("select * from faq");
        model.addAttribute("faq", li);
        return "faq";
    } 
    

}