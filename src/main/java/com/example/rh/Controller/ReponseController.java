package com.example.rh.Controller;

import com.example.rh.Model.questionnaire.Reponse;
import com.example.rh.Model.connections.Postgresql;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Connection;

@Controller
public class ReponseController {

    @RequestMapping(value="/update-reponse-valeur", method=RequestMethod.POST)
    @ResponseBody
    public void updateReponseValeur(@RequestParam("id") int id, @RequestParam("valeur") String valeur) {
        try {

            Reponse reponse  = new Reponse();
            reponse.setId(id);
            reponse.setValeur(String.valueOf(valeur));
            reponse.updateReponseValeur(null);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @RequestMapping(value="/update-reponse-vrai", method=RequestMethod.POST)
    @ResponseBody
    public void updateReponseVrai(@RequestParam("id") int id, @RequestParam("vrai") String vrai) {
        try {
            Reponse reponse  = new Reponse();
            reponse.setId(id);
            reponse.setVrai(Boolean.valueOf(vrai));
            reponse.updateReponseVrai(null);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }


    @RequestMapping(value="add-reponse", method=RequestMethod.POST)
    @ResponseBody
    public Reponse addResponse(@RequestParam("question_id") int question_id, @RequestParam("id") int id, @RequestParam("valeur") String valeur) {
        try {
            Connection connection = new Postgresql().connect();
            Reponse reponse  = new Reponse();
            reponse.setId(id);
            reponse.setValeur(String.valueOf(valeur));
            reponse.updateReponseValeur(connection);
            Reponse reponse_created = Reponse.create(connection, question_id);
            connection.close();
            return reponse_created;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }


}
