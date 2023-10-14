package com.example.rh.Model.criteres;

import com.example.rh.Model.services.Besoin;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;


public class CritereBesoin {
    int id;
    double valeur;
    Critere critere;
    Besoin besoin;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Critere getCritere() {
        return critere;
    }

    public void setCritere(Critere critere) {
        this.critere = critere;
    }

    public Besoin getBesoin() {
        return besoin;
    }

    public void setBesoin(Besoin besoin) {
        this.besoin = besoin;
    }

    public double getValeur() {
        return valeur;
    }

    public void setValeur(double valeur) {
        this.valeur = valeur;
    }

    public CritereBesoin(int id, double valeur, Critere critere, Besoin besoin) {
        this.id = id;
        this.valeur = valeur;
        this.critere = critere;
        this.besoin = besoin;
    }

    public CritereBesoin(int id, Critere critere, Besoin besoin) {
        this.setId(id);
        this.setCritere(critere);
        this.setBesoin(besoin);
    }

    public CritereBesoin() {

    }

    public void create(Connection connection) throws Exception {
        String sql = "INSERT INTO critere_besoin(id, critere_id, besoin_id) VALUES (default, "+getCritere().getId()+","+getBesoin().getId()+")";
        Statement statement = connection.createStatement();
        statement.executeUpdate(sql);
    }

    public void creates(Connection connection, String[] critereId, String besoinId) throws Exception {
        this.setBesoin(new Besoin().getBesoin(connection, Integer.parseInt(besoinId)));
        for (String string: critereId) {
            this.setCritere(new Critere().getCritere(connection, Integer.parseInt(string)));
            this.create(connection);
        }
    }

    public void updateCoefficients(Connection connection, int id, double number) throws Exception {
        String sql = "UPDATE critere_besoin SET valeur = "+ number +" WHERE id = "+id;
        Statement statement = connection.createStatement();
        statement.executeUpdate(sql);
    }

    public List<CritereBesoin> getCritereBesoinByBesoinWhithValeurNotNull(Connection connection, int besoinId) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM critere_besoin WHERE besoin_id = "+besoinId +" AND valeur = 0");
        List<CritereBesoin> critereBesoins = new ArrayList<>();
        while (resultSet.next()) {
            critereBesoins.add(new CritereBesoin(
                resultSet.getInt("id"),
                new Critere().getCritere(connection, resultSet.getInt("critere_id")),
                new Besoin().getBesoin(connection, resultSet.getInt("besoin_id")))
            );
        }

        return critereBesoins;
    }

    public Vector<CritereBesoin> getCategorieCriteres(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM critere_besoin ");
        Vector<CritereBesoin> listCritereBesoin = new Vector<>();
        while (resultSet.next()) {
            listCritereBesoin.addElement(
                    new CritereBesoin(
                            resultSet.getInt("id"),
                            resultSet.getDouble("valeur"),
                            new Critere().getCritere(connection, resultSet.getInt("critere_id")),
                            new Besoin().getBesoin(connection, resultSet.getInt("besoin_id"))
                    ));
        }
        return listCritereBesoin;
    }
}