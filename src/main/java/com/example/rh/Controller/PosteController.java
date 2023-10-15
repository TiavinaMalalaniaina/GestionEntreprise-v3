package com.example.rh.Controller;

import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.criteres.CategorieCritere;
import com.example.rh.Model.v2.InfoEmploye;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.sql.Connection;
import java.util.List;
import java.util.Vector;

import com.example.rh.Model.criteres.Critere;

@Controller
public class PosteController {

    @GetMapping("/liste-employe")
    public String getListeEmployeActif(Model model) throws Exception {
        Connection connection = new Postgresql().connect();
        List<InfoEmploye> models = InfoEmploye.getAllEmployeActif(connection);
        Vector<CategorieCritere> criteres = new CategorieCritere().getCategorieCriteres(connection);
        Gson gson = new Gson();
        model.addAttribute("models", gson.toJson(models));
        model.addAttribute("criteres", criteres);
        connection.close();
        return "home/poste/liste";
    }
}
