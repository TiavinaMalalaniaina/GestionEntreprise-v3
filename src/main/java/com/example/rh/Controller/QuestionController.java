package com.example.rh.Controller;

import com.example.rh.Model.questionnaire.Question;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class QuestionController {

    @RequestMapping(value="/create-question", method=RequestMethod.POST)
    @ResponseBody
    public Question createQuestion(@RequestParam("questionnaire_id") int id) {
        try {
            Question question = Question.create(null, id);
            return question;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value="/update-question-valeur", method=RequestMethod.POST)
    @ResponseBody
    public void updateQuestionValeur(@RequestParam("id") int question_id, @RequestParam("valeur") String valeur) {
        try {
            Question question = new Question();
            question.setId(question_id);
            question.setValeur(valeur);
            question.updateQuestionValeur(null);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @RequestMapping(value="update-question-coefficient", method=RequestMethod.POST)
    @ResponseBody
    public void updateQuestionCoefficient(@RequestParam("id") int question_id, @RequestParam("coefficient") int coefficient) {
        try {
            Question question = new Question();
            question.setId(question_id);
            question.setCoefficient(coefficient);
            question.updateQuestionCoefficient(null);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @RequestMapping(value="update-question-type", method=RequestMethod.POST)
    @ResponseBody
    public void updateQuestionType(@RequestParam("id") int question_id, @RequestParam("type") String type) {
        try {
            Question question = new Question();
            question.setId(question_id);
            question.setType(type);
            question.updateQuestionType(null);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
