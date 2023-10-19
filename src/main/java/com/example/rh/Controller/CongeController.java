package com.example.rh.Controller;

import com.example.rh.Model.conge.Calendrier;
import com.example.rh.Model.conge.Conge;
import com.example.rh.Model.conge.TypeConge;
import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.poste.PersonnePoste;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;
import java.util.Vector;

@Controller
public class CongeController {
    @Autowired
    private Postgresql psql;

    @GetMapping("conge")
    public String select(Model model) {
        try {
            Connection connection = psql.connect();
            TypeConge typeConge = new TypeConge();
            List<TypeConge> typeConges = typeConge.getTypeConge(connection);
            model.addAttribute("typeConge", typeConges);

            PersonnePoste personnePoste = new PersonnePoste();
            Vector<PersonnePoste> personnePostes = personnePoste.getAllPersonnePoste(connection);
            model.addAttribute("personnePostes", personnePostes);

            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "conge/conge";
    }

    @GetMapping("insert-conge")
    public String insert(HttpServletRequest requests) throws Exception {
        Connection connection = null;

        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();

            int employe_id = Integer.parseInt(requests.getParameter("employe"));
            String debutStr = requests.getParameter("debut");
            String finStr = requests.getParameter("fin");
            int type_id = Integer.parseInt(requests.getParameter("typeConge"));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date debutSql = dateFormat.parse(debutStr);
            java.util.Date finSql = dateFormat.parse(finStr);

            Date debut = new java.sql.Date(debutSql.getTime());
            Date fin = new java.sql.Date(finSql.getTime());

            Conge conge = new Conge();
            conge.create(connection, employe_id, debut, fin, type_id);

            //connection.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }

        return "conge/inserer";
    }

    @GetMapping("calendrier")
    public String calendrier(Model model) {
        try {
            Connection connection = psql.connect();
            Calendrier calendrier = new Calendrier();
            Vector<Calendrier> calendriers = calendrier.getAllCalendrier(connection);
            model.addAttribute("calendriers", calendriers);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "conge/calendrier";
    }
}
