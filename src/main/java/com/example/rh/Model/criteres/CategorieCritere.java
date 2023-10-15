package com.example.rh.Model.criteres;

import com.example.rh.Model.services.Service;
import com.example.rh.Model.services.ServiceAction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;

public class CategorieCritere {
    int id;
    String nom;
    List<Critere> criteres;

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

    public List<Critere> getCriteres() {
        return criteres;
    }

    public void setCriteres(List<Critere> criteres) {
        this.criteres = criteres;
    }

    public CategorieCritere(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }

    public CategorieCritere() {

    }

    public void getCriteres(Connection connection) throws SQLException {
        this.setCriteres(new Critere().getCriteres(connection));
    }

    public Vector<CategorieCritere> getCategorieCriteres(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM categorie_critere ");
        Vector<CategorieCritere> listTypeCritere = new Vector<>();
        while (resultSet.next()) {
            CategorieCritere model = new CategorieCritere();
            model.setId(resultSet.getInt("id"));
            model.setNom(resultSet.getString("nom"));
            model.setCriteres(new Critere().getCritereByCategorie(connection, model.getId()));
            listTypeCritere.addElement(model);
        }
        return listTypeCritere;
    }

    public CategorieCritere getCategorieCritere(Connection connection, int id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM categorie_critere WHERE id = "+id);
        resultSet.next();
        CategorieCritere categorieCritere = new CategorieCritere(
                resultSet.getInt("id"),
                resultSet.getString("nom")
        );

        return categorieCritere;
    }


}
