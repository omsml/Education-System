package com.example.leavemanagement;


import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;





@Controller 
public class FacultyController {
    @Autowired
    JdbcTemplate jdbc;

    @Controller
public class QuestionController {

    @Autowired
    private JdbcTemplate jdbc;

    @PostMapping("/manage_question_update")
    public String manageQuestionUpdate(@RequestParam("sl_no") String slNo,
                                       @RequestParam("question") String question,
                                       @RequestParam("option1") String option1,
                                       @RequestParam("option2") String option2,
                                       @RequestParam("option3") String option3,
                                       @RequestParam("option4") String option4,
                                       @RequestParam("answer") String answer,
                                       Model model) {
        // Update question in the database
        String sql = "UPDATE question_master SET question = ?, option1 = ?, option2 = ?, option3 = ?, option4 = ?, answer = ? WHERE sl_no = ?";
        jdbc.update(sql, question, option1, option2, option3, option4, answer, slNo);
        model.addAttribute("sms", "Successfully updated");
        return manageQuestions(model);
    }

    @PostMapping("/manage_question")
    public String manageQuestionEdit(@RequestParam("sl_no") String slNo, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("delete")) {
            // Delete question from the database
            String sql = "DELETE FROM question_master WHERE sl_no = ?";
            jdbc.update(sql, slNo);
            model.addAttribute("sms", "Successfully deleted");
        }

        // If the action is 'Edit', redirect to the edit page with the question data
        // To make this work, you should have an additional method to fetch and send the specific question data
        if (btn.equalsIgnoreCase("Edit")) {
            String sql = "SELECT * FROM question_master WHERE sl_no = ?";
            Map<String, Object> question = jdbc.queryForMap(sql, slNo);
            model.addAttribute("question_master", List.of(question)); // Wrap in a List for the JSP to iterate
            return "managequestion_edit"; // Ensure this view is correct
        }

        // Redirect to the question management view
        return manageQuestions(model);
    }

    @GetMapping("/managequestion")
    public String manageQuestions(Model model) {
        // Retrieve the list of questions
        String sql = "SELECT * FROM question_master";
        List<Map<String, Object>> questionMaster = jdbc.queryForList(sql);
        model.addAttribute("question_master", questionMaster);
        return "managequestion";
    }
}


    

    @PostMapping("/add_question")
    public String addQuestionSave(@RequestParam("question") String question,
                                  @RequestParam("option1") String option1,
                                  @RequestParam("option2") String option2,
                                  @RequestParam("option3") String option3,
                                  @RequestParam("option4") String option4,
                                  @RequestParam("answer") String answer,
                                  Model model) {

        // Insert question into the database
        jdbc.update("INSERT INTO question_master (question, option1, option2, option3, option4, answer) VALUES (?, ?, ?, ?, ?, ?)",
                    question, option1, option2, option3, option4, answer);

        // Add a success message to the model
        model.addAttribute("sms", "Question Added Successfully");

        // Redirect to the question list or another appropriate page
        return "/addquestion"; // Or the path to the page you want to redirect to
    }

    @GetMapping("/addquestion")
    public String showAddQuestionForm(Model model) {
        // You can pass attributes to the model if needed
        return "addquestion"; // This should be the name of your view template (e.g., addquestion.html)
    }

    

    @GetMapping("/applyleave")
    public String assignleave(Model model , HttpSession session){
        String email =  (String)session.getAttribute("email");
        String sql = "select * from leave_master where leave_id in (select leave_id from leave_faculty_assign where email ='"+ email +"')";
        List<Map<String,Object>> leave_master=jdbc.queryForList(sql);
        model.addAttribute("leave_master",leave_master);
        return "applyleave";
    }

    @GetMapping("/fleave")
    public String fleave(Model model,HttpSession session){
        String name= (String) session.getAttribute("email");
        String sql= "select * from leave_master where leave_id in (SELECT leave_id FROM leave_faculty_assign WHERE name = '"+ name +"')";
        List<Map<String, Object>> leave_master = jdbc.queryForList(sql);
        model.addAttribute("leave_master",leave_master);
        return "fleave";
    }
    @PostMapping("/noofleave")
    @ResponseBody
    public List<Map<String,Object>> noofleave(@RequestParam("lid") String leaveid,HttpSession session) {
        String email = (String) session.getAttribute("email");
        String sql = "SELECT no_of_leave FROM leave_faculty_assign WHERE leave_id ='"+ leaveid +"' AND name = " + "(SELECT email FROM user_master WHERE email = '" + email +"')";
        List<Map<String,Object>> numleave = jdbc.queryForList(sql);
        return numleave;
    }   

    @PostMapping("/save")
public String save(Model model, HttpSession session, @RequestParam("leave_id") String leaveid, @RequestParam("no_of_leave") String no_of_leave) {
    String email = (String) session.getAttribute("email");

    // Insert leave application
    String insertSql = "INSERT INTO leave_apply (name, leave_id, no_of_leave) VALUES (?, ?, ?)";
    jdbc.update(insertSql, email, leaveid, no_of_leave);

    // Update remaining leaves
    String updateSql = "UPDATE leave_faculty_assign SET no_of_leave = no_of_leave - ? " +
                       "WHERE leave_id = ? AND name = (SELECT email FROM user_master WHERE email = ?)";
    jdbc.update(updateSql, no_of_leave, leaveid, email);

    // Fetch the updated number of remaining leaves
    String selectSql = "SELECT no_of_leave FROM leave_faculty_assign WHERE leave_id = ? AND name = (SELECT email FROM user_master WHERE email = ?)";
    @SuppressWarnings("deprecation")
    Integer remainingLeaves = jdbc.queryForObject(selectSql, new Object[]{leaveid, email}, Integer.class);

    // Add remaining leaves to the model
    model.addAttribute("msg", "Leave applied successfully");
    model.addAttribute("remainingLeaves", remainingLeaves);

    return "fleave";
}


    
}
    
 
