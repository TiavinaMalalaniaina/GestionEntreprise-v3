package com.example.rh.Controller;

import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.functions.Function;
import com.example.rh.Model.services.Besoin;
import com.example.rh.Model.services.Service;
import com.example.rh.Model.services.ServiceAction;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("")
public class DemandeController {

    @GetMapping("creer-une-demande")
    public String Demande(Model model) throws Exception {

        Connection connection = null;
        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();
            List<ServiceAction> list = new ServiceAction().getServiceActions(connection);
            model.addAttribute("serviceActions", list);
        }
        catch (Exception e) {
            System.out.println(e.getMessage()+ "Message io");
        }
        finally {
            connection.close();
        }

        return "home/demandes/creer";
    }

    @GetMapping("liste-demandes-en-cours")
    public String ListeDemandesEnCours(Model model) throws Exception {
        Besoin besoin = new Besoin();
        Connection connection = null;
        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();
            List<Besoin> lists = besoin.getBesoins(connection);
            model.addAttribute("besoins", lists);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
        return "home/demandes/liste_en_cours";
    }

    /* INSERTION DANS BASE */
    @GetMapping("creer-besoin")
    public RedirectView CreerBesoin(HttpServletRequest requests, HttpSession session) throws Exception {
        Connection connection = null;
        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();

            Service service = (Service) session.getAttribute("service");
            ServiceAction serviceAction = new ServiceAction().getServiceAction(connection, Integer.valueOf(requests.getParameter("service_action_id")));

            String date = requests.getParameter("date");
            Timestamp dateSql = new Function().convertStringEnTimestamp(date);
            Timestamp dateActuel = new Function().getDateActuel();

            double dureeTache = Double.valueOf(requests.getParameter("duree_tache"));
            String tache = requests.getParameter("tache");

            Besoin besoin = new Besoin(0, tache, dateActuel, dateSql, dureeTache, 0, serviceAction, service);
            besoin.create(connection);
            connection.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
        return new RedirectView("critere");

    }
}
