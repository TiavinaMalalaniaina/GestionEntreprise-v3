package com.example.rh.Controller;

import com.example.rh.Model.conge.Calendrier;
import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.entretien.Entretien;
import com.example.rh.Model.entretien.EntretienEmploye;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.sql.Connection;
import java.util.Vector;

@Controller
public class EntretienController {
    @Autowired
    private Postgresql psql;

    @GetMapping("calendrierEntretien")
    public String calendrier(Model model) {
        try {
            Connection connection = psql.connect();
            Entretien entretien = new Entretien();
            Vector<Entretien> entretiens = entretien.getAllEntretienEnCour(connection);
            model.addAttribute("entretiens", entretiens);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "entretien/calendrierEntretien";
    }

    @GetMapping("entretienEmploye")
    public String entretien(Model model) {
        try{
            Connection connection = psql.connect();
            EntretienEmploye entretienEmploye = new EntretienEmploye();
            Vector<EntretienEmploye> entretienEmployes = entretienEmploye.getAll(connection);
            model.addAttribute("entretienEmployes", entretienEmployes);
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "entretien/entretienEmp";
    }
}
