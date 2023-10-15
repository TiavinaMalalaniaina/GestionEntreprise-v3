package com.example.rh.Model.conge;

import com.example.rh.Model.candidats.Candidat;
import com.example.rh.Model.connections.ConnectionWrapper;
import com.example.rh.Model.poste.PosteEmploye;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Vector;

public class Conge {
    int id;
    int poste_employe_id;
    Date debut;
    Date fin;
    double conge_restant;
    int validation;
    int type_conge_id;
    String valeur;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public double getConge_restant() {
        return conge_restant;
    }

    public void setConge_restant(double conge_restant) {
        this.conge_restant = conge_restant;
    }

    public int getValidation() {
        return validation;
    }

    public void setValidation(int validation) {
        this.validation = validation;
    }

    public int getPoste_employe_id() {
        return poste_employe_id;
    }

    public void setPoste_employe_id(int poste_employe_id) {
        this.poste_employe_id = poste_employe_id;
    }

    public int getType_conge_id() {
        return type_conge_id;
    }

    public void setType_conge_id(int type_conge_id) {
        this.type_conge_id = type_conge_id;
    }

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }

    public Conge(int id, int poste_employe_id, Date debut, Date fin, double conge_restant, int validation, int type_conge_id) {
        this.id = id;
        this.poste_employe_id = poste_employe_id;
        this.debut = debut;
        this.fin = fin;
        this.conge_restant = conge_restant;
        this.validation = validation;
        this.type_conge_id = type_conge_id;
    }

    public Conge(int id, int poste_employe_id, Date debut, Date fin, double conge_restant, int validation, int type_conge_id, String valeur) {
        this.id = id;
        this.poste_employe_id = poste_employe_id;
        this.debut = debut;
        this.fin = fin;
        this.conge_restant = conge_restant;
        this.validation = validation;
        this.type_conge_id = type_conge_id;
        this.valeur = valeur;
    }

    public Conge() {
    }

    public void create(Connection connection, int poste_employe_id, Date debut, Date fin, int type_conge_id) throws Exception {
        String sql = "INSERT INTO conge(poste_employe_id, debut, fin, type_conge_id) VALUES (?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, poste_employe_id);
        statement.setDate(2, (java.sql.Date) debut);
        statement.setDate(3, (java.sql.Date) fin);
        statement.setInt(4, type_conge_id);
        statement.executeUpdate(sql);
    }

    public Vector<Conge> getAllConge(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        Vector<Conge> conges = new Vector<>();
        String query = "SELECT * FROM conge c join type_conge tc on tc.id_type_conge = c.conge_restant";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Conge conge = new Conge();
                conge.setId(resultSet.getInt("id"));
                conge.setPoste_employe_id(resultSet.getInt("poste_employe_id"));
                conge.setDebut(resultSet.getDate("debut"));
                conge.setFin(resultSet.getDate("fin"));
                conge.setConge_restant(resultSet.getDouble("conge_restant"));
                conge.setValidation(resultSet.getInt("validation"));
                conge.setType_conge_id(resultSet.getInt("type_conge_id"));
                conge.setValeur(resultSet.getString("value"));
                conges.add(conge);
            }
        }
        if (!cw.wasOpen()) connection.close();
        return conges;
    }
}
