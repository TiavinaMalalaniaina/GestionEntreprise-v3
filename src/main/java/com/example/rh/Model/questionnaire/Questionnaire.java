package com.example.rh.Model.questionnaire;

import com.example.rh.Model.connections.ConnectionWrapper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Questionnaire {
    int id;
    int besoinId;
    ArrayList<Question> questions = new ArrayList<>();



    public void recreate(Connection connection, int questionnaire_id) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        Questionnaire questionnaire = Questionnaire.getById(connection, questionnaire_id);
        questionnaire.findQuestions(connection);
        for (Question question : questionnaire.getQuestions()) {
            question.findReponses(connection);
        }
        if (!cw.wasOpen()) {
            connection.close();
        }
    }


    public static Questionnaire getById(Connection connection, int id) throws Exception {
        Questionnaire questionnaire = new Questionnaire();

        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "SELECT id, besoin_id FROM questionnaire WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                questionnaire.setId(rs.getInt("id"));
                questionnaire.setBesoinId(rs.getInt("besoin_id"));
            }
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
        return questionnaire;
    }

    public void findQuestions(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        this.setQuestions(Question.getByQuestionnaireId(connection, this.getId()));
        if (!cw.wasOpen()) connection.close();
    }

    public void save(Connection connection) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();

        String sql = "INSERT INTO questionnaire(besoin_id) VALUES (?) RETURNING id";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, this.getBesoinId());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) this.setId(rs.getInt(1));
        }

        if (!cw.wasOpen()) {
            connection.close();
        }
    }

    public static Questionnaire create(Connection connection, int besoinId) throws Exception {
        ConnectionWrapper cw = new ConnectionWrapper(connection);
        connection = cw.getConnection();
        System.out.println(connection);
        Questionnaire questionnaire = new Questionnaire();
        questionnaire.setBesoinId(besoinId);
        questionnaire.save(connection);
        questionnaire.getQuestions().add(Question.create(connection, questionnaire.getId()));
        if (!cw.wasOpen()) connection.close();
        return questionnaire;
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBesoinId() {
        return besoinId;
    }

    public void setBesoinId(int besoinId) {
        this.besoinId = besoinId;
    }

    public ArrayList<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(ArrayList<Question> questions) {
        this.questions = questions;
    }
}
