package com.example.rh.Model.poste;

import com.example.rh.Model.services.ServiceAction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class PersonnePoste {
    int poste_id;
    int employe_id;
    String nom;
    String prenom;

    public int getPoste_id() {
        return poste_id;
    }

    public void setPoste_id(int poste_id) {
        this.poste_id = poste_id;
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

    public PersonnePoste(int poste_id, int employe_id, String nom, String prenom) {
        this.poste_id = poste_id;
        this.employe_id = employe_id;
        this.nom = nom;
        this.prenom = prenom;
    }

    public PersonnePoste() {
    }

    public Vector<PersonnePoste> getAllPersonnePoste(Connection connection) throws SQLException {
        Vector<PersonnePoste> personnePostes = new Vector<>();
        String sql = "select *from v_personne_poste";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            personnePostes.add(new PersonnePoste(
                    resultSet.getInt("poste_id"),
                    resultSet.getInt("employe_id"),
                    resultSet.getString("nom"),
                    resultSet.getString("prenom")
            ));
        }
        return personnePostes;
    }
}
