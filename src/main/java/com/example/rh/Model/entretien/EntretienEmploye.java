package com.example.rh.Model.entretien;

import java.sql.*;
import java.util.Vector;

public class EntretienEmploye {
    int entretien_id;
    Date entretien_debut;
    int candidat_id;
    String candidat_nom;
    String candidat_prenom;
    Time debut_heure;

    public int getEntretien_id() {
        return entretien_id;
    }

    public void setEntretien_id(int entretien_id) {
        this.entretien_id = entretien_id;
    }

    public Date getEntretien_debut() {
        return entretien_debut;
    }

    public void setEntretien_debut(Date entretien_debut) {
        this.entretien_debut = entretien_debut;
    }

    public int getCandidat_id() {
        return candidat_id;
    }

    public void setCandidat_id(int candidat_id) {
        this.candidat_id = candidat_id;
    }

    public String getCandidat_nom() {
        return candidat_nom;
    }

    public void setCandidat_nom(String candidat_nom) {
        this.candidat_nom = candidat_nom;
    }

    public String getCandidat_prenom() {
        return candidat_prenom;
    }

    public void setCandidat_prenom(String candidat_prenom) {
        this.candidat_prenom = candidat_prenom;
    }

    public Time getDebut_heure() {
        return debut_heure;
    }

    public void setDebut_heure(Time debut_heure) {
        this.debut_heure = debut_heure;
    }

    public EntretienEmploye(int entretien_id, Date entretien_debut, int candidat_id, String candidat_nom, String candidat_prenom, Time debut_heure) {
        this.entretien_id = entretien_id;
        this.entretien_debut = entretien_debut;
        this.candidat_id = candidat_id;
        this.candidat_nom = candidat_nom;
        this.candidat_prenom = candidat_prenom;
        this.debut_heure = debut_heure;
    }

    public EntretienEmploye(Date entretien_debut, int candidat_id, String candidat_nom, String candidat_prenom, Time debut_heure) {
        this.entretien_debut = entretien_debut;
        this.candidat_id = candidat_id;
        this.candidat_nom = candidat_nom;
        this.candidat_prenom = candidat_prenom;
        this.debut_heure = debut_heure;
    }

    public EntretienEmploye() {
    }

    public Vector<EntretienEmploye> getAll(Connection connection) throws SQLException {
        Vector<EntretienEmploye> entretienEmployes = new Vector<>();
        String sql = "SELECT\n" +
                "    e.id AS entretien_id,\n" +
                "    e.debut AS entretien_debut,\n" +
                "    c.id AS candidat_id,\n" +
                "    c.nom AS candidat_nom,\n" +
                "    c.prenom AS candidat_prenom,\n" +
                "    TO_CHAR((ROW_NUMBER() OVER (ORDER BY e.debut) - 1) * INTERVAL '15 minutes' + TO_TIMESTAMP('08:00', 'HH24:MI'), 'HH24:MI:SS') AS debut_heure FROM\n" +
                "    \"public\".entretien e\n" +
                "LEFT JOIN\n" +
                "    \"public\".detail_entretien de ON e.id = de.id_entretien\n" +
                "LEFT JOIN\n" +
                "    \"public\".candidat c ON de.id_candidat = c.id\n" +
                "WHERE\n" +
                "    e.debut IS NOT NULL\n" +
                "ORDER BY\n" +
                "    entretien_debut, candidat_nom, candidat_prenom";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while(resultSet.next()) {
            entretienEmployes.add(new EntretienEmploye(
                    resultSet.getInt("entretien_id"),
                    resultSet.getDate("entretien_debut"),
                    resultSet.getInt("candidat_id"),
                    resultSet.getString("candidat_nom"),
                    resultSet.getString("candidat_prenom"),
                    resultSet.getTime("debut_heure")
            ));
        }
        return entretienEmployes;
    }
}
