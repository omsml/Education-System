package com.example.leavemanagement;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpSession;


@Controller
public class StudentController {
    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/exam")
    public String exam(Model model) {
        String sql = "SELECT * FROM question_master";
        List<Map<String, Object>> questionMaster = jdbc.queryForList(sql);
        model.addAttribute("question_master", questionMaster);
        return "exam"; 
    }

    
    @PostMapping("/SaveStudentAnswer")
    public String saveStudentAnswer (@ModelAttribute ExamData ed, HttpSession session, Model model){
        String email = (String) session.getAttribute("email");

        String sql1 = "select sl_no, answer FROM question_master limit 3";

        List<Map<String, Object>> db_answer = jdbc.queryForList(sql1);

        String[] stu_ansArray = ed.getAnsArray();
        int total_mark = 0;
        for (Map<String, Object> rowMap: db_answer) {

        int sl_no = Integer.parseInt(rowMap.get("sl_no").toString());

        int ans = Integer.parseInt(rowMap.get("answer").toString());

        int stu_mark = Integer.parseInt(stu_ansArray[sl_no]);

        if (ans == stu_mark) {
        total_mark++;
        }
}

String json_text = ed.toString();
String sql = "insert into s_answer (student_email, student_answer, student_mark) values (?,?,?)";
jdbc.update(sql, email, json_text, total_mark);
System.out.println(total_mark);
model.addAttribute ( "mark", total_mark);
return "result"; 
    }



    class ExamData {
    private String[] ansArray;

    public String[] getAnsArray() {
    return ansArray;
    }

    public void setAnsArray(String[] ansArray) {
    this.ansArray = ansArray;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{");


        
        for (int i = 0; i < ansArray.length; i++){
            sb.append("\"answer").append(i).append("\":\"").append(ansArray[i]).append("\"");
            if (i < ansArray.length - 1){
                sb.append(",");

            }
        }
        sb.append("}");
        return sb.toString();
    }


    }
    



    
    
}
