package com.example.rh.Model.services;


import com.example.rh.Model.exceptions.EmailException;
import com.example.rh.Model.exceptions.MotDePasseException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

public class Service {

    int id;
    String nom;
    String prenom;
    String email;
    String motdePasse;
    boolean rh;
    String profil;
    ServiceAction serviceAction;

    public ServiceAction getServiceAction() {
        return serviceAction;
    }

    public void setServiceAction(ServiceAction serviceAction) {
        this.serviceAction = serviceAction;
    }

    public boolean isRh() {
        return rh;
    }

    public void setRh(boolean rh) {
        this.rh = rh;
    }

    public String getProfil() {
        return profil;
    }

    public void setProfil(String profil) {
        this.profil = profil;
    }

    public Service(int id, String nom, String prenom, String email, String motdePasse, boolean rh, String profil, ServiceAction serviceAction) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.email = email;
        this.motdePasse = motdePasse;
        this.setRh(rh);
        this.setProfil(profil);
        this.setServiceAction(serviceAction);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMotdePasse() {
        return motdePasse;
    }

    public void setMotdePasse(String motdePasse) {
        this.motdePasse = motdePasse;
    }

    public Service() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Vector<Service> getServices(Connection connection) throws Exception {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM service");

        Vector<Service> rhs = new Vector<>();
        while (resultSet.next()) {
            rhs.addElement(
                new Service(resultSet.getInt("id"),
                resultSet.getString("nom"),
                resultSet.getString("prenom"),
                resultSet.getString("email"),
                resultSet.getString("mot_de_passe"),
                resultSet.getBoolean("rh"),
                resultSet.getString("profil") ,
                new ServiceAction().getServiceAction(connection, resultSet.getInt("id")))
            );
        }
        statement.close();
        return rhs;
    }

    public Vector<Service> getServiceByEmail(Connection connection, String email) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM service WHERE email='"+email+"'");

        Vector<Service> rhs = new Vector<>();
        while (resultSet.next()) {
            rhs.addElement(
                new Service(
                    resultSet.getInt("id"),
                    resultSet.getString("nom"),
                    resultSet.getString("prenom"),
                    resultSet.getString("email"),
                    resultSet.getString("mot_de_passe"),
                    resultSet.getBoolean("rh") ,
                    resultSet.getString("profil") ,
                    new ServiceAction().getServiceAction(connection, resultSet.getInt("id"))));
        }
        statement.close();
        return rhs;
    }

    public Service traitementLogin(Connection connection, String email, String motDePasse) throws SQLException, EmailException, MotDePasseException {
        Vector<Service> services = getServiceByEmail(connection, email);
        if (services.isEmpty()) throw new EmailException("Verifier votre email,vous n'avez pas de compte pour votre email");
        for (Service service : services) {
            if (service.getMotdePasse().compareTo(motDePasse) == 0) return service;
        }
        throw new MotDePasseException(("Verifier votre mot de passe,il est incorrect pour votre email"));

    }

    public Service getService(Connection connection, int id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM service WHERE id = "+id);
        resultSet.next();
        Service service = new Service(

            resultSet.getInt("id"),
            resultSet.getString("nom"),
            resultSet.getString("prenom"),
            resultSet.getString("email") ,
            resultSet.getString("mot_de_passe") ,
            resultSet.getBoolean("rh") ,
            resultSet.getString("profil") ,
            new ServiceAction().getServiceAction(connection, resultSet.getInt("id"))
        );

        return service;
    }

}


