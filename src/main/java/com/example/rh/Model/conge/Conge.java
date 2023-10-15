package com.example.rh.Model.conge;

import com.example.rh.Model.candidats.Candidat;
import com.example.rh.Model.poste.PosteEmploye;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Date;

public class Conge {
    int id;
    PosteEmploye posteEmploye;
    Date debut;
    Date fin;
    Date conge_restant;
    int validation;
    TypeConge typeConge;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public PosteEmploye getPosteEmploye() {
        return posteEmploye;
    }

    public void setPosteEmploye(PosteEmploye posteEmploye) {
        this.posteEmploye = posteEmploye;
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

    public Date getConge_restant() {
        return conge_restant;
    }

    public void setConge_restant(Date conge_restant) {
        this.conge_restant = conge_restant;
    }

    public int getValidation() {
        return validation;
    }

    public void setValidation(int validation) {
        this.validation = validation;
    }

    public TypeConge getTypeConge() {
        return typeConge;
    }

    public void setTypeConge(TypeConge typeConge) {
        this.typeConge = typeConge;
    }

    public Conge(int id, PosteEmploye posteEmploye, Date debut, Date fin, Date conge_restant, int validation, TypeConge typeConge) {
        this.id = id;
        this.posteEmploye = posteEmploye;
        this.debut = debut;
        this.fin = fin;
        this.conge_restant = conge_restant;
        this.validation = validation;
        this.typeConge = typeConge;
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
}
