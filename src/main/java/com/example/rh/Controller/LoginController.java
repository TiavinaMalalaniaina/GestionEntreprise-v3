package com.example.rh.Controller;

import com.example.rh.Model.services.Service;
import com.example.rh.Model.connections.Postgresql;
import com.example.rh.Model.exceptions.EmailException;
import com.example.rh.Model.exceptions.MotDePasseException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Vector;


@Controller
@RequestMapping("/")
public class LoginController {

    @GetMapping("/login")
    public String Index(Model model) {
        model.addAttribute("email", "exemple@gmail.com");
        model.addAttribute("mot_de_passe", "********");
        return "login/login";
    }

    @PostMapping("traitement-de-login")
    public String Traitement(HttpServletRequest requests, HttpSession httpSession, Model model) throws SQLException {
        String email = requests.getParameter("email");
        String motDePasse = requests.getParameter("mot_de_passe");
        Connection connection = null;
        try {
            Postgresql postgresql = new Postgresql();
            connection = postgresql.connect();
            Service service = new Service();
            Service service1 = service.traitementLogin(connection, email, motDePasse);
            model.addAttribute("email", email);
            httpSession.setAttribute("service", service1);

            return "home/index";
        }
        catch (EmailException e) {
            model.addAttribute("email", e.getMessage());
            return "login/login";
        }
        catch (MotDePasseException e) {
            model.addAttribute("mot_de_passe", e.getMessage());
            return "login/login";
        }
        catch (Exception e) {
            e.printStackTrace();
            return "login/login";
        }
        finally {
            connection.close();
        }

    }

}
