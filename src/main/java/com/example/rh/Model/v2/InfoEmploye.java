package com.example.rh.Model.v2;

import com.example.rh.Model.criteres.Critere;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

public class InfoEmploye {
    int id;
    String nom;
    String prenom;
    Date dtn;
    String email;
    Date debut;
    Date fin;
    boolean essaie;
    double salaire;
    String posteType;
    int posteId;
    int serviceActionId;
    String serviceNom;
    String posteNom;
    Vector<Critere> criteres;

    public static ArrayList<InfoEmploye> getAllEmployeActif(Connection connection) throws SQLException {
        ArrayList<InfoEmploye> models = new ArrayList<>();
        String sql = "SELECT * FROM v_info_employe_actif";
        PreparedStatement stmt = connection.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            InfoEmploye model = new InfoEmploye();
            model.setId(rs.getInt("id"));
            model.setNom(rs.getString("nom"));
            model.setPrenom(rs.getString("prenom"));
            model.setDtn(rs.getDate("dtn"));
            model.setEmail(rs.getString("email"));
            model.setDebut(rs.getDate("debut"));
            model.setFin(rs.getDate("fin"));
            model.setEssaie(rs.getBoolean("essaie"));
            model.setSalaire(rs.getDouble("salaire"));
            model.setPosteType(rs.getString("poste_type"));
            model.setPosteId(rs.getInt("poste_id"));
            model.setServiceActionId(rs.getInt("service_action_id"));
            model.setServiceNom(rs.getString("service_nom"));
            model.setPosteNom(rs.getString("poste_nom"));
            model.setCriteres(new Critere().getCandidatCriteres(connection, model.getId()));
            models.add(model);
        }
        return models;
    }

    public Vector<Critere> getCriteres() {
        return criteres;
    }

    public void setCriteres(Vector<Critere> criteres) {
        this.criteres = criteres;
    }

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

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Date getDtn() {
        return dtn;
    }

    public void setDtn(Date dtn) {
        this.dtn = dtn;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getPosteType() {
        return posteType;
    }

    public void setPosteType(String posteType) {
        this.posteType = posteType;
    }

    public int getPosteId() {
        return posteId;
    }

    public void setPosteId(int posteId) {
        this.posteId = posteId;
    }

    public int getServiceActionId() {
        return serviceActionId;
    }

    public void setServiceActionId(int serviceActionId) {
        this.serviceActionId = serviceActionId;
    }

    public String getServiceNom() {
        return serviceNom;
    }

    public void setServiceNom(String serviceNom) {
        this.serviceNom = serviceNom;
    }

    public String getPosteNom() { return posteNom; }

    public void setPosteNom(String posteNom) { this.posteNom = posteNom; }
}
