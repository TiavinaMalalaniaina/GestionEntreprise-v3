package com.example.rh.Model.criteres;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

public class Critere {
    int id;
    CategorieCritere categorie;
    String element;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CategorieCritere getCategorie() {
        return categorie;
    }

    public void setCategorie(CategorieCritere categorie) {
        this.categorie = categorie;
    }

    public String getElement() {
        return element;
    }

    public void setElement(String element) {
        this.element = element;
    }

    public Critere(int id, CategorieCritere categorie, String element) {
        this.setId(id);
        this.setCategorie(categorie);
        this.setElement(element);
    }

    public Critere(int id, String element) {
        this.setId(id);
        this.setElement(element);
    }

    public Critere() {

    }

    public Vector<Critere> getCriteres(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM critere ");
        Vector<Critere> listTypeCritere = new Vector<>();
        while (resultSet.next()) {
            listTypeCritere.addElement(
                    new Critere(
                            resultSet.getInt("id"),
                            new CategorieCritere().getCategorieCritere(connection, resultSet.getInt("categorie_critere_id")),
                            resultSet.getString("element")
                    ));
        }
        return listTypeCritere;
    }

    public Vector<Critere> getCandidatCriteres(Connection connection, int candidat_id) throws SQLException {
        String sql = "SELECT * FROM v_critere_candidat WHERE candidat_id=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, candidat_id);
        ResultSet resultSet = statement.executeQuery();
        Vector<Critere> listTypeCritere = new Vector<>();
        while (resultSet.next()) {
            listTypeCritere.addElement(
                    new Critere(
                            resultSet.getInt("critere_id"),
                            new CategorieCritere().getCategorieCritere(connection, resultSet.getInt("categorie_critere_id")),
                            resultSet.getString("element")
                    ));
        }
        return listTypeCritere;
    }


    public Vector<Critere> CritereByCategorie(Connection connection, String categorie) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT c.id, element FROM critere c join categorie_critere cc on c.categorie_critere_id = cc.id where cc.nom = '"+categorie+"'");
        Vector<Critere> listCritere = new Vector<>();
        while (resultSet.next()) {
            listCritere.addElement(new Critere(resultSet.getInt("id"), resultSet.getString("element")));
        }
        statement.close();
        return listCritere;
    }

    public ArrayList<Critere> getCritereByCategorie(Connection connection, int categorie_id) throws SQLException {
        String sql = "SELECT * FROM critere WHERE categorie_critere_id=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, categorie_id);
        ResultSet resultSet = statement.executeQuery();

        ArrayList<Critere> listCritere = new ArrayList<>();
        while (resultSet.next()) {
            listCritere.add(new Critere(resultSet.getInt("id"), resultSet.getString("element")));
        }
        statement.close();
        return listCritere;
    }


    public Critere getCritere(Connection connection, int id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM critere WHERE id = "+id);
        Critere critere = null;
        resultSet.next();
        critere = new Critere(
            resultSet.getInt("id"),
            new CategorieCritere().getCategorieCritere(connection, resultSet.getInt("categorie_critere_id")),
            resultSet.getString("element")
        );

        return critere;
    }

}