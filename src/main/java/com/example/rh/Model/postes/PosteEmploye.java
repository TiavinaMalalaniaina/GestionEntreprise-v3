package com.example.rh.Model.postes;

import com.example.rh.Model.candidats.Candidat;
import com.example.rh.Model.criteres.Critere;
import com.example.rh.Model.criteres.CritereBesoin;
import com.example.rh.Model.services.Besoin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PosteEmploye {
    int id;
    Poste poste;
    Date debut;
    Date fin;
    boolean essaie;
    double salaire;
    Candidat candidat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Poste getPoste() {
        return poste;
    }

    public void setPoste(Poste poste) {
        this.poste = poste;
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

    public Candidat getCandidat() {
        return candidat;
    }

    public void setCandidat(Candidat candidat) {
        this.candidat = candidat;
    }

    public PosteEmploye(int id, Poste poste, Date debut, Date fin, boolean essaie, double salaire, Candidat candidat) {
        this.id = id;
        this.poste = poste;
        this.debut = debut;
        this.fin = fin;
        this.essaie = essaie;
        this.salaire = salaire;
        this.candidat = candidat;
    }

    public void createPosteEmploye(Connection connection) throws Exception {
        Statement statement = connection.createStatement();
        statement.executeQuery("INSERT INTO poste_employe(poste_id, debut, fin, essaie, salaire, candidat) VALUES("+
                getPoste().getId()+",'"+
                getDebut()+"','"+
                getFin()+"',"+
                isEssaie()+","+
                getSalaire()+","+
                getCandidat().getId()+","+
            ")");
    }

    public List<PosteEmploye> getPosteEmployes(Connection connection) throws Exception {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM poste_employe ");
        List<PosteEmploye> posteEmployes = new ArrayList<>();
        while (resultSet.next()) {
            posteEmployes.add(new PosteEmploye(
                resultSet.getInt("id"),
                new Poste().getPoste(connection, resultSet.getInt("poste_id")) ,
                resultSet.getDate("debut"),
                resultSet.getDate("fin"),
                resultSet.getBoolean("essaie"),
                resultSet.getDouble("salaire"),
                new Candidat().getCandidat(connection, resultSet.getInt("candidat_id"))
            ));
        }

        return posteEmployes;
    }
}
