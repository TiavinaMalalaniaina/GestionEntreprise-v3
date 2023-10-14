package com.example.rh.Controller;

import com.example.rh.Model.candidats.Candidat;
import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.criteres.CategorieCritere;
import com.example.rh.Model.criteres.Critere;
import com.example.rh.Model.criteres.CritereBesoin;
import com.example.rh.Model.questionnaire.Question;
import com.example.rh.Model.questionnaire.Questionnaire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Connection;
import java.util.Vector;

@Controller
public class ClientController {
    @Autowired
    private Postgresql psql;

    @GetMapping("index-client")
    public String index() {
        return "client/index";
    }

    @GetMapping("info-client")
    public String info() { return "client/info"; }

    @GetMapping("sign-client")
    public String sign() { return "client/sign"; }

    @GetMapping("log-client")
    public String log() { return "client/log"; }

    @GetMapping("critere-candidat")
    public String afficherCritere(Model model, int id) {
        try {
            Connection connection = psql.connect();
            Critere critere = new Critere();
            Vector<Critere> listDiplome = critere.CritereByCategorie(connection, "Diplome");
            Vector<Critere> listExperience = critere.CritereByCategorie(connection, "Experience");
            Vector<Critere> listSituation = critere.CritereByCategorie(connection, "Situation matrimoniale");
            Vector<Critere> listSexe = critere.CritereByCategorie(connection, "Sexe");
            Candidat candidat = Candidat.getCandidatById(id, connection);
            connection.close();
            model.addAttribute("candidat", candidat);
            model.addAttribute("listDiplome", listDiplome);
            model.addAttribute("listExperience", listExperience);
            model.addAttribute("listSituation", listSituation);
            model.addAttribute("listSexe", listSexe);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "client/critere";
    }


    @GetMapping("insert")
    public String insert(Model model) {
        try {
            Connection connection = new Postgresql().connect();
            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:client/test?questionnaire_id=2";
    }


    @GetMapping("test-candidat")
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
        return "client/test";
    }

    @GetMapping("annonce")
    public String annonce(Model model) {
        try {
            Connection connection = psql.connect();
            CritereBesoin besoin = new CritereBesoin();
            Vector<CritereBesoin> listBesoin = besoin.getCategorieCriteres(connection);
            connection.close();
            model.addAttribute("listBesoin", listBesoin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "client/annonce";
    }



}