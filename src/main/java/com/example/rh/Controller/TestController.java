package com.example.rh.Controller;

import com.example.rh.Model.questionnaire.Question;
import com.example.rh.Model.questionnaire.Questionnaire;
import com.example.rh.Model.connections.Postgresql;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Connection;


@Controller
@RequestMapping("")
public class TestController {

    @GetMapping("create-test")
    public String create(@RequestParam("besoin_id") int besoinId, RedirectAttributes redirectAttributes) {
        try {
            Questionnaire questionnaire = Questionnaire.create(null, besoinId);
            redirectAttributes.addAttribute("questionnaire_id", questionnaire.getId());
        } catch (Exception e) {
            e.printStackTrace();
            //return "redirect:/create-test";
        }
        return "redirect:/write-test";
    }

    @GetMapping("write-test")
    public String write(@RequestParam("questionnaire_id") int questionnaire_id, Model model) {
        try {
            Connection connection = new Postgresql().connect();
            Questionnaire questionnaire = Questionnaire.getById(connection, questionnaire_id);
            questionnaire.findQuestions(connection);
            for (Question question : questionnaire.getQuestions()) {
                question.findReponses(connection);
            }
            connection.close();
            model.addAttribute("questionnaire", questionnaire);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "home/questionnaire/write";
    }

    @GetMapping("test")
    public String test(@RequestParam("questionnaire_id") int questionnaire_id, Model model) {
        try {
            Connection connection = new Postgresql().connect();
            Questionnaire questionnaire = Questionnaire.getById(connection, questionnaire_id);
            questionnaire.findQuestions(connection);
            connection.close();
        } catch (Exception ex) {}
        return "test/write-question";
    }
}
