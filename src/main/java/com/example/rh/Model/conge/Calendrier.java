package com.example.rh.Model.conge;

import java.sql.*;
import java.util.Vector;

public class Calendrier {
    String type;
    Date debut;
    Date fin;
    int validation;
    String value;
    Boolean comptabilise;
    int employe_id;
    String nom;
    String prenom;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDebut() {
        return debut;
    }

    public void setDebut(Date debut) {
        this.debut = debut;
    }

    public Date getFin() {
        return fin;
    }

    public void setFin(Date fin) {
        this.fin = fin;
    }

    public int getValidation() {
        return validation;
    }

    public void setValidation(int validation) {
        this.validation = validation;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Boolean getComptabilise() {
        return comptabilise;
    }

    public void setComptabilise(Boolean comptabilise) {
        this.comptabilise = comptabilise;
    }

    public int getEmploye_id() {
        return employe_id;
    }

    public void setEmploye_id(int employe_id) {
        this.employe_id = employe_id;
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

    public Calendrier(String type, Date debut, Date fin, int validation, String value, Boolean comptabilise, int employe_id, String nom, String prenom) {
        this.type = type;
        this.debut = debut;
        this.fin = fin;
        this.validation = validation;
        this.value = value;
        this.comptabilise = comptabilise;
        this.employe_id = employe_id;
        this.nom = nom;
        this.prenom = prenom;
    }

    public Calendrier() {
    }

    public Vector<Calendrier> getAllCalendrier(Connection connection) throws SQLException {
        String sql = "SELECT *FROM v_calendrier where validation = 2";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        Vector<Calendrier> calendriers = new Vector<>();
        while (resultSet.next()) {
            calendriers.add(new Calendrier(
                    resultSet.getString("type"),
                    resultSet.getDate("debut"),
                    resultSet.getDate("fin"),
                    resultSet.getInt("validation"),
                    resultSet.getString("value"),
                    resultSet.getBoolean("comptabilise"),
                    resultSet.getInt("employe_id"),
                    resultSet.getString("nom"),
                    resultSet.getString("prenom")
            ));
        }
        return calendriers;
    }
}
