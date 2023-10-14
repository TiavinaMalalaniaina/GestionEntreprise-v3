package com.example.rh.Model.candidats;

import com.example.rh.Model.connections.ConnectionWrapper;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Candidat {
    int id;
    String nom;
    String prenom;
    Date dtn;
    String email;

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

    // Create
    public static void createCandidat(Candidat candidat, Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        String query = "INSERT INTO candidat (nom, prenom, dtn, email) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, candidat.getNom());
            preparedStatement.setString(2, candidat.getPrenom());
            preparedStatement.setDate(3, candidat.getDtn());
            preparedStatement.setString(4, candidat.getEmail());
            preparedStatement.executeUpdate();
        }
        if (!cw.wasOpen()) connection.close();
    }

    // Read by ID
    public static Candidat getCandidatById(int id, Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        String query = "SELECT * FROM candidat WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    Candidat candidat = new Candidat();
                    candidat.setId(resultSet.getInt("id"));
                    candidat.setNom(resultSet.getString("nom"));
                    candidat.setPrenom(resultSet.getString("prenom"));
                    candidat.setDtn(resultSet.getDate("dtn"));
                    candidat.setEmail(resultSet.getString("email"));
                    if (!cw.wasOpen()) connection.close();
                    return candidat;
                }
            }
        }
        if (!cw.wasOpen()) connection.close();
        return null;
    }


    // Read all
    public static List<Candidat> getAllCandidats(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        List<Candidat> candidats = new ArrayList<>();
        String query = "SELECT * FROM candidat";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                Candidat candidat = new Candidat();
                candidat.setId(resultSet.getInt("id"));
                candidat.setNom(resultSet.getString("nom"));
                candidat.setPrenom(resultSet.getString("prenom"));
                candidat.setDtn(resultSet.getDate("dtn"));
                candidat.setEmail(resultSet.getString("email"));
                candidats.add(candidat);
            }
        }
        if (!cw.wasOpen()) connection.close();
        return candidats;
    }
    // Read all

    public static List<Candidat> getCandidatsByBesoin(int besoin_id, Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        List<Candidat> candidats = new ArrayList<>();
        String query = "SELECT * FROM v_besoin_candidat WHERE besoin_id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)){
            preparedStatement.setInt(1, besoin_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Candidat candidat = new Candidat();
                candidat.setId(resultSet.getInt("id"));
                candidat.setNom(resultSet.getString("nom"));
                candidat.setPrenom(resultSet.getString("prenom"));
                candidat.setDtn(resultSet.getDate("dtn"));
                candidat.setEmail(resultSet.getString("email"));
                candidats.add(candidat);
            }
        }
        if (!cw.wasOpen()) connection.close();
        return candidats;
    }

    // Update
    public static void updateCandidat(Candidat candidat, Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        String query = "UPDATE candidat SET nom=?, prenom=?, dtn=?, email=? WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, candidat.getNom());
            preparedStatement.setString(2, candidat.getPrenom());
            preparedStatement.setDate(3, candidat.getDtn());
            preparedStatement.setString(4, candidat.getEmail());
            preparedStatement.setInt(5, candidat.getId());
            preparedStatement.executeUpdate();
        }
        if (!cw.wasOpen()) connection.close();
    }

    // Delete
    public static void deleteCandidat(int id, Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        String query = "DELETE FROM candidat WHERE id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }
        if (!cw.wasOpen()) connection.close();
    }
}
