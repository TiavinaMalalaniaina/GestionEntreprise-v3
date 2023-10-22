package com.example.rh.Model.entretien;

import java.sql.*;
import java.util.Vector;

public class DetailEntretien {
    int id;
    int id_entretien;
    int id_candidat;
    Timestamp debut;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_entretien() {
        return id_entretien;
    }

    public void setId_entretien(int id_entretien) {
        this.id_entretien = id_entretien;
    }

    public int getId_candidat() {
        return id_candidat;
    }

    public void setId_candidat(int id_candidat) {
        this.id_candidat = id_candidat;
    }

    public Timestamp getDebut() {
        return debut;
    }

    public void setDebut(Timestamp debut) {
        this.debut = debut;
    }

    public DetailEntretien(int id, int id_entretien, int id_candidat, Timestamp debut) {
        this.id = id;
        this.id_entretien = id_entretien;
        this.id_candidat = id_candidat;
        this.debut = debut;
    }

    public DetailEntretien() {
    }

    public Vector<DetailEntretien> getAllEntretienEnCour(Connection connection) throws SQLException {
        Vector<DetailEntretien> detailEntretiens = new Vector<>();
        String sql = "select * from detail_entretien e join besoin b on b.id = e.id_besoin";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            detailEntretiens.add(new DetailEntretien(
                    resultSet.getInt("id"),
                    resultSet.getInt("id_entretien"),
                    resultSet.getInt("id_candidat"),
                    resultSet.getTimestamp("debut")
            ));
        }
        return detailEntretiens;
    }
}


