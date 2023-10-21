package com.example.rh.Controller;

import com.example.rh.Model.candidats.Candidat;
import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.postes.Poste;
import com.example.rh.Model.questionnaire.Question;
import com.example.rh.Model.questionnaire.Questionnaire;
import com.example.rh.Model.societe.Societe;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Connection;
import java.util.List;


@Controller
public class CandidatController {

    @GetMapping("")
    public String index() {
        return "test/index";
    }

    @GetMapping("candidature")
    public String candidature(Model model, @RequestParam int besoin_id) {
        try {
            List<Candidat> candidats = Candidat.getCandidatsByBesoin(besoin_id, null);
            model.addAttribute("candidats", candidats);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "home/demandes/candidat";
    }

    @GetMapping("candidats-en-periode-essaie")
    public String CandidatsPeriodeEssaie(Model model) throws Exception {
        Connection connection = null;
        try {
            connection = new Postgresql().connect();
            model.addAttribute("candidats", new Candidat().getCandidats(connection));
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        finally {
            connection.close();
        }
        return "home/candidats/periode_essaie";
    }

    @GetMapping("tous-candidats")
    public String TousCandidats() {
        return "home/candidats/candidats";
    }

    @GetMapping("candidat-a-embaucher")
    public String Embauchage(Model model) throws Exception{
        Connection connection = null;
        try {
            connection = new Postgresql().connect();
            //model.addAttribute("postes", new Poste().getPostes(connection));
            model.addAttribute("societe", new Societe().getSociete(connection));
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }
        finally {
            connection.close();
        }
        return "home/candidats/embauchage";
    }


}
