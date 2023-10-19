package com.example.rh.Model.conge;

import com.example.rh.Model.connections.ConnectionWrapper;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class Conge {
    int id;
    int poste_employe_id;
    Date debut;
    Date fin;
    int validation;
    int type_conge_id;
    double conge_restant;

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

    public Conge(int id, int poste_employe_id, Date debut, Date fin, double conge_restant, int validation, int type_conge_id) {
        this.id = id;
        this.poste_employe_id = poste_employe_id;
        this.debut = debut;
        this.fin = fin;
        this.conge_restant = conge_restant;
        this.validation = validation;
        this.type_conge_id = type_conge_id;
    }

    public Conge(int poste_employe_id, Date debut, Date fin, double conge_restant, int validation, int type_conge_id) {
        this.poste_employe_id = poste_employe_id;
        this.debut = debut;
        this.fin = fin;
        this.conge_restant = conge_restant;
        this.validation = validation;
        this.type_conge_id = type_conge_id;
    }

    public Conge() {
    }

    public void create(Connection connection, int poste_employe_id, Date debut, Date fin, int type_conge_id) throws Exception {
        String sql = "INSERT INTO conge(id, poste_employe_id, debut, fin, type_conge_id) VALUES (default, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, poste_employe_id);
        statement.setDate(2, debut);
        statement.setDate(3, fin);
        statement.setInt(4, type_conge_id);
        statement.executeUpdate();
    }
}
