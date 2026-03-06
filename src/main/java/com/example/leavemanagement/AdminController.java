package com.example.leavemanagement;

import java.io.*;
import java.util.*;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;



@Controller
public class AdminController {

    @Autowired
    JdbcTemplate jdbc;

    @PostMapping("/updateusers")
    public String updateusers(@RequestParam("email") String email, @RequestParam("name") String name,
            @RequestParam("role") String role, @RequestParam("status") String status, Model model) {
        String sql = "update user_master set name=? , role=? , status=? where email=?";
        jdbc.update(sql, name, role, status, email);
        model.addAttribute("sms", "Successfully updated");
        return users(model);
    }

    @PostMapping("/manageusers")
    public String manageusers(@RequestParam("email") String email, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("delete")) {
            String sql = "delete from user_master where email=?";
            jdbc.update(sql, email);
            return users(model);
        }
        String sql = "select * from user_master where email='" + email + "'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "editusers";
    }

    @GetMapping("/users")
    public String users(Model model) {
        String sql = "select * from user_master where role !='admin'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "users";
    } 

    @PostMapping("/add_leave")
    public String add_leave(Model model, @RequestParam("leave_name") String leave_name) {
        jdbc.execute("insert into leave_master (leave_name) values('" + leave_name + "')");
        model.addAttribute("SMS", "leave add Success");
        return "addleave";
    }

    @GetMapping("/addleave")
    public String addleave() {
        return "addleave";
    }

    @GetMapping("/leave_assign")
    public String leave_assign(Model model) {
        String sqlfaculty = "select * from user_master where role ='faculty'";
        List<Map<String, Object>> faculty = jdbc.queryForList(sqlfaculty);
        String sqlLeaveMaster = "select * from leave_master";
        List<Map<String, Object>> leaveMaster = jdbc.queryForList(sqlLeaveMaster);
        model.addAttribute("faculty", faculty);
        model.addAttribute("leaveMaster", leaveMaster);
        return "leave_assign";
    }

    @PostMapping("save")
    public String save(Model model, @RequestParam("name") String empid, @RequestParam("leaveid") String leaveid,
            @RequestParam("no_of_leave") String no_of_leave) {
        String sql = "insert into leave_apply(name,leave_id,num_of_leave) values(?,?,?)";
        jdbc.execute(sql);
        model.addAttribute("msg", "leave apply successful");
        return "leave_assign";
    }

    @PostMapping("faculty_assign_leave")
    public String leaveassign(Model model, @RequestParam("name") String name, @RequestParam("leave_id") String leave_id,
            @RequestParam("old_no_of_leave") String old_no_of_leave) {
        String sql = "insert into leave_faculty_assign(name,leave_id,no_of_leave) values ('" + name + "','"+leave_id+"','"+old_no_of_leave + "')";
        jdbc.execute(sql);
        model.addAttribute("msg", "leave Assign successful");
        return leave_assign(model);
    }

    @GetMapping("/leaveshow")
    public String leaveshow(Model model) {
        String sql = "select * from leave_master";
        List<Map<String, Object>> leave_master = jdbc.queryForList(sql);
        model.addAttribute("leave_master", leave_master);
        return "leaveshow";
    }

    @GetMapping("/editleave")
    public String editleave() {
        return "editleave";
    }

    @PostMapping("/updateleave")
    public String updateleave(@RequestParam("leave_id") String leave_id, @RequestParam("leave_name") String leave_name,
            Model model) {
        String sql = "update leave_master set leave_name=?  where leave_id=?";
        jdbc.update(sql, leave_name, leave_id);
        model.addAttribute("sms", "Successfully updated");
        return leaveshow(model);
    }

    @PostMapping("/manageleave")
    public String manageleave(@RequestParam("leave_id") String leave_id, @RequestParam("btn") String btn, Model model) {
        String sql = "select * from leave_master where leave_id='" + leave_id + "'";
        List<Map<String, Object>> leave_master = jdbc.queryForList(sql);
        model.addAttribute("leave_master", leave_master);
        return "editleave";
    }
    @GetMapping("/leave_assign_view")
    public String leave_assign_view(Model model) {
    String sql = "select * from leave_faculty_assign";
        List<Map<String, Object>> leave_faculty_assign = jdbc.queryForList(sql);
        model.addAttribute("leave_faculty_assign",leave_faculty_assign);
        return "leave_assign_view";
    }

    @PostMapping("/assignmanage")
    public String assignmanage(@RequestParam("sl_no") String sl_no, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("delete")) {
            String sql = "delete from leave_faculty_assign where sl_no=?";
            jdbc.update(sql, sl_no);
            return leave_assign_view(model); 
        }
        String sql = "select * from leave_faculty_assign where sl_no='" + sl_no + "'";
        List<Map<String, Object>> leave_faculty_assign = jdbc.queryForList(sql);
        model.addAttribute("leave_faculty_assign", leave_faculty_assign);
        return "leave_assign_edit";
    }

    @PostMapping("/leave_assign_update")
    public String leave_assign_update(@RequestParam("sl_no") String sl_no, @RequestParam("name") String name,
            @RequestParam("leave_id") String leave_id, @RequestParam("no_of_leave") String no_of_leave, Model model) {
        String sql = "update leave_faculty_assign set name=? , leave_id=? , no_of_leave=? where sl_no=?";
        jdbc.update(sql, name, leave_id, no_of_leave, sl_no);
        model.addAttribute("sms", "Successfully updated");
        return leave_assign_view(model);
    }


    @GetMapping("/profile")
    public String profile(HttpSession session , Model model) {
        String email=(String)session.getAttribute("email");
        String sql="Select name,user_master.email, role , photo , age from user_master left join profile on user_master.email=profile.email where user_master.email='"+email+"' ";
        List<Map<String , Object>> userprofile=jdbc.queryForList(sql);
        model.addAttribute("userprofile", userprofile);
        return  "profile";
    }


    @PostMapping("upload")
    public String upload(HttpSession session, Model model , @RequestParam("f") MultipartFile f)throws IOException {
        String email = (String)session.getAttribute("email");
        String sql1="delete from profile where email=?";
        jdbc.update(sql1,email);
        String sql2="INSERT INTO profile (email,photo,age) values(?,?,?)";
        jdbc.update(sql2,email,f.getBytes(),22);       
        return profile (session,model);
    }
    
    


}
