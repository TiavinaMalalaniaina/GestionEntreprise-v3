package com.example.rh.Controller;

import com.example.rh.Model.conge.Conge;
import com.example.rh.Model.conge.TypeConge;
import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.criteres.CritereBesoin;
import com.example.rh.Model.poste.PosteEmploye;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Vector;

public class CongeController {
    @Autowired
    private Postgresql psql;

    @GetMapping("conge")
    public String insert(Model model) {
        try {
            Connection connection = psql.connect();
            TypeConge typeConge = new TypeConge();
            List<TypeConge> typeConges = typeConge.getTypeConge(connection);

            PosteEmploye posteEmploye = new PosteEmploye();
            List<PosteEmploye> posteEmployes = posteEmploye.getPosteEmploye(connection);

            connection.close();
            model.addAttribute("typeConge", typeConges);
            model.addAttribute("posteEmploye", posteEmploye);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "conge/conge";
    }

    @GetMapping("creer-conge")
    public RedirectView CreerCritere(HttpServletRequest requests) throws Exception {
        Connection connection = null;

        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();

            int employe_id = Integer.parseInt(requests.getParameter("employe"));
            String debutStr = requests.getParameter("debut");
            String finStr = requests.getParameter("fin");
            int type = Integer.parseInt(requests.getParameter("typeConge"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date debut = dateFormat.parse(debutStr);
            Date fin = dateFormat.parse(finStr);

            Conge conge = new Conge();
            conge.create(connection, employe_id, debut, fin, type);

            connection.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }

        return new RedirectView("");
    }

    @GetMapping("calendrier")
    public String calendrier(Model model) {
        try {
            Connection connection = psql.connect();
            Conge conge = new Conge();
            Vector<Conge> listConge = conge.getAllConge(connection);
            connection.close();
            model.addAttribute("listConge", listConge);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "conge/calendrier";
    }
}
