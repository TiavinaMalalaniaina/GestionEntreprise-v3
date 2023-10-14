package com.example.rh.Model.questionnaire;

import com.example.rh.Model.connections.ConnectionWrapper;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Reponse {
    @JsonProperty
    int id;
    @JsonProperty
    String valeur;
    @JsonProperty
    boolean vrai;
    @JsonProperty
    int questionId;


    public void updateReponseValeur(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "UPDATE reponse SET valeur=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, this.getValeur());
            stmt.setInt(2, this.getId());
            stmt.executeUpdate();
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
    }
    public void updateReponseVrai(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "UPDATE reponse SET vrai=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setBoolean(1, this.isVrai());
            stmt.setInt(2, this.getId());
            stmt.executeUpdate();
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
    }

    public static ArrayList<Reponse> findByQuestionId(Connection connection, int questionId) throws Exception {
        ArrayList<Reponse> reponses = new ArrayList<>();
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        String sql = "SELECT id, valeur, vrai, question_id FROM reponse WHERE question_id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, questionId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Reponse reponse = new Reponse();
                reponse.setId(rs.getInt("id"));
                reponse.setValeur(rs.getString("valeur"));
                reponse.setVrai(rs.getBoolean("vrai"));
                reponse.setQuestionId(rs.getInt("question_id"));
                reponses.add(reponse);
            }
        }
        if (!cw.wasOpen()) {
            connection.close();
        }
        return reponses;
    }

    public void save(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        String sql = "INSERT INTO reponse (valeur, vrai, question_id) VALUES (?,?,?) RETURNING id";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, this.getValeur());
            stmt.setBoolean(2, this.isVrai());
            stmt.setInt(3, this.getQuestionId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) this.setId(rs.getInt(1));
        }
        if (!cw.wasOpen()) {
            connection.close();
        }
    }

    public static Reponse create(Connection connection, int questionId) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        Reponse reponse = new Reponse();
        reponse.setQuestionId(questionId);
        reponse.save(connection);
        if (!cw.wasOpen()) connection.close();
        return reponse;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getValeur() {
        return valeur;
    }

    public void setValeur(String valeur) {
        this.valeur = valeur;
    }

    public boolean isVrai() {
        return vrai;
    }

    public void setVrai(boolean vrai) {
        this.vrai = vrai;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }
}
