package com.example.rh.Model.questionnaire;

import com.example.rh.Model.connections.ConnectionWrapper;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Question {
    @JsonProperty
    int id;
    @JsonProperty
    String valeur;
    @JsonProperty
    String type;
    @JsonProperty
    int coefficient;
    @JsonProperty
    int questionnaireId;
    @JsonProperty
    ArrayList<Reponse> reponses = new ArrayList<>();


    public enum TypeQuestion {
        RADIO, CHECKBOX, BOOLEAN, TEXT
    }

    public void updateQuestionValeur(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "UPDATE question SET valeur=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, this.getValeur());
            stmt.setInt(2, this.getId());
            stmt.executeUpdate();
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
    }
    public void updateQuestionType(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "UPDATE question SET type=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, this.getType ());
            stmt.setInt(2, this.getId());
            stmt.executeUpdate();
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
    }
    public void updateQuestionCoefficient(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "UPDATE question SET coefficient=? WHERE id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, this.getCoefficient());
            stmt.setInt(2, this.getId());
            stmt.executeUpdate();
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
    }

    public static ArrayList<Question> getByQuestionnaireId(Connection connection, int questionnaireId) throws Exception {
        ArrayList<Question> questions = new ArrayList<>();
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "SELECT id,valeur,type,coefficient,questionnaire_id FROM question WHERE questionnaire_id=?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, questionnaireId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Question question = new Question();
                question.setId(rs.getInt("id"));
                question.setValeur(rs.getString("valeur"));
                question.setType(rs.getString("type"));
                question.setQuestionnaireId(rs.getInt("questionnaire_id"));
                questions.add(question);
            }
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
        return questions;
    }

    public void save(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "INSERT INTO question (valeur, coefficient, questionnaire_id, type) VALUES (?,?,?,?) RETURNING id";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, this.getValeur());
            stmt.setInt(2, this.getCoefficient());
            stmt.setInt(3, this.getQuestionnaireId());
            stmt.setString(4, this.getType());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) this.setId(rs.getInt(1));
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
    }

    public static Question create(Connection connection, int questionnaireId) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        Question question = new Question();
        question.setQuestionnaireId(questionnaireId);
        question.save(connection);

        question.getReponses().add(Reponse.create(connection, question.getId()));

        if (!cw.wasOpen()) {
            connection.close();
        }
        return question;
    }

    public void findReponses(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        setReponses((ArrayList<Reponse>) Reponse.findByQuestionId(connection, this.getId()));
        if (!cw.wasOpen()) connection.close();
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCoefficient() {
        return coefficient;
    }

    public void setCoefficient(int coefficient) {
        this.coefficient = coefficient;
    }

    public int getQuestionnaireId() {
        return questionnaireId;
    }

    public void setQuestionnaireId(int questionnaireId) {
        this.questionnaireId = questionnaireId;
    }

    public ArrayList<Reponse> getReponses() {
        return reponses;
    }

    public void setReponses(ArrayList<Reponse> reponses) {
        this.reponses = reponses;
    }
}
