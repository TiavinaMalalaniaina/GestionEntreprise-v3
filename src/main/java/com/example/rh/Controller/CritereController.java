package com.example.rh.Controller;

import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.criteres.Critere;
import com.example.rh.Model.criteres.CritereBesoin;
import com.example.rh.Model.services.Besoin;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import java.sql.Connection;
import java.util.List;

@Controller
@RequestMapping("")
public class CritereController {

    @GetMapping("critere")
    public String Critere(Model model) throws Exception {
        Connection connection = null;
        try {
            Critere critere = new Critere();
            Besoin besoin = new Besoin();
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();
            List<Critere> lists = critere.getCriteres(connection);
            model.addAttribute("besoins", besoin.getBesoins(connection));
            model.addAttribute("criteres", lists);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
        return "home/criteres/critere";
    }

    @GetMapping("coefficient-critere")
    public String Coefficient(Model model) throws Exception {
        Connection connection = null;
        try {
            Critere critere = new Critere();
            Besoin besoin = new Besoin();
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();
            model.addAttribute("besoins", besoin.getBesoins(connection));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
        return "home/criteres/coefficient";
    }

    @GetMapping("creer-coefficient-critere")
    @ResponseBody
    public void CreerCoefficientCritere(HttpServletRequest requests) throws Exception {
        Connection connection = null;
        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();

            int critereBesoinId = Integer.parseInt(requests.getParameter("critereBesoinId"));
            double number = Double.parseDouble(requests.getParameter("number"));

            CritereBesoin critereBesoin = new CritereBesoin();
            critereBesoin.updateCoefficients(connection, critereBesoinId, number);

            connection.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }
    }

    @GetMapping("list-criteres-by-besoin")
    @ResponseBody
    public List<CritereBesoin> CriteresByBesoin(@RequestParam int besoinId) throws Exception {
        Connection connection = null;
        List<CritereBesoin> lists = null;
        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();
            lists = new CritereBesoin().getCritereBesoinByBesoinWhithValeurNotNull(connection, besoinId);
            //ObjectMapper objectMapper = new ObjectMapper();
            //json = objectMapper.writeValueAsString(lists);
            System.out.println(lists.size()+" Okay");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }

        return lists;
    }

    @GetMapping("creer-critere-besoin")
    public RedirectView CreerCritere(HttpServletRequest requests) throws Exception {
        Connection connection = null;

        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();

            String[] criteres = requests.getParameterValues("criteres");
            String besoinId = requests.getParameter("besoin_id");
            CritereBesoin critereBesoin = new CritereBesoin();
            critereBesoin.creates(connection, criteres , besoinId);
            connection.commit();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            connection.close();
        }

        return new RedirectView("coefficient-critere");
    }

}
