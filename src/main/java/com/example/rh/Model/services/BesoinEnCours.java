package com.example.rh.Model.services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

public class BesoinEnCours {
    int id;
    double heuresParJours;
    Date dateDebut;
    Date dateFin;
    Besoin besoin;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getHeuresParJours() {
        return heuresParJours;
    }

    public void setHeuresParJours(double heuresParJours) {
        this.heuresParJours = heuresParJours;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public Besoin getBesoin() {
        return besoin;
    }

    public void setBesoin(Besoin besoin) {
        this.besoin = besoin;
    }

    public BesoinEnCours(int id, double heuresParJours, Date dateDebut, Date dateFin, Besoin besoin) {
        this.setId(id);
        this.setHeuresParJours(heuresParJours);
        this.setDateDebut(dateDebut);
        this.setDateFin(dateFin);
        this.setBesoin(besoin);
    }

    public void create(Connection connection) throws Exception {
        String sql = "INSERT INTO besoin_en_cours VALUES (default, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, String.valueOf(getHeuresParJours()));
        preparedStatement.setString(2, getDateDebut().toString());
        preparedStatement.setString(3, getDateFin().toString());
        preparedStatement.setString(4, String.valueOf(getBesoin().getId()));

        preparedStatement.executeQuery();
    }
}
