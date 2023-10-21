package com.example.rh.Model.societe;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Societe {
    int id;
    String nom;
    String adresse;

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

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public Societe(int id, String nom, String adresse) {
        this.id = id;
        this.nom = nom;
        this.adresse = adresse;
    }
    public Societe() {

    }
    public Societe getSociete(Connection connection) throws Exception {
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery("SELECT *FROM info_societe");
        rs.next();
        return new Societe(rs.getInt("id"), rs.getString("nom"), rs.getString("adresse"));
    }
}
