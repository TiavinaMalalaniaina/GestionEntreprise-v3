package com.example.rh.Model.poste;

import com.example.rh.Model.candidats.Candidat;
import com.example.rh.Model.services.Besoin;
import com.example.rh.Model.services.Service;
import com.example.rh.Model.services.ServiceAction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PosteEmploye {
    int id;
    int poste_id;
    Date debut;
    Date fin;
    boolean essaie;
    double salaire;
    int employe_id;

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

    public boolean isEssaie() {
        return essaie;
    }

    public void setEssaie(boolean essaie) {
        this.essaie = essaie;
    }

    public double getSalaire() {
        return salaire;
    }

    public void setSalaire(double salaire) {
        this.salaire = salaire;
    }

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

    public PosteEmploye(int id, int poste_id, Date debut, Date fin, boolean essaie, double salaire, int employe_id) {
        this.id = id;
        this.poste_id = poste_id;
        this.debut = debut;
        this.fin = fin;
        this.essaie = essaie;
        this.salaire = salaire;
        this.employe_id = employe_id;
    }

    public PosteEmploye() {
    }

    public List<PosteEmploye> getPosteEmploye(Connection connection) throws SQLException {
        String sql = "SELECT *FROM poste_employe";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        System.out.println(sql);
        List<PosteEmploye> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(new PosteEmploye(
                    resultSet.getInt("id"),
                    resultSet.getInt("poste_id"),
                    resultSet.getDate("debut"),
                    resultSet.getDate("fin"),
                    resultSet.getBoolean("essaie"),
                    resultSet.getDouble("salaire"),
                    resultSet.getInt("employe_id")
            ));
        }
        return list;
    }
}
