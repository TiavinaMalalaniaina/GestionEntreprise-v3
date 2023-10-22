package com.example.rh.Model.entretien;

import com.example.rh.Model.conge.Calendrier;

import java.sql.*;
import java.util.Vector;

public class Entretien {
    int id;
    int id_besoin;
    Date debut;
    Date fin;
    String tache;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_besoin() {
        return id_besoin;
    }

    public void setId_besoin(int id_besoin) {
        this.id_besoin = id_besoin;
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

    public String getTache() {
        return tache;
    }

    public void setTache(String tache) {
        this.tache = tache;
    }

    public Entretien(int id, int id_besoin, Date debut, Date fin, String tache) {
        this.id = id;
        this.id_besoin = id_besoin;
        this.debut = debut;
        this.fin = fin;
        this.tache = tache;
    }

    public Entretien() {
    }

    public Vector<Entretien> getAllEntretienEnCour(Connection connection) throws SQLException {
        Vector<Entretien> entretiens = new Vector<>();
        String sql = "select * from entretien e join besoin b on b.id = e.id_besoin";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            entretiens.add(new Entretien(
                    resultSet.getInt("id"),
                    resultSet.getInt("id_besoin"),
                    resultSet.getDate("debut"),
                    resultSet.getDate("fin"),
                    resultSet.getString("tache")
            ));
        }
        return entretiens;
    }
}
