package com.example.rh.Model.test;

import com.example.rh.Model.criteres.Critere;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class Question {
    int id;
    String valeur;
    int coefficient;
    int idQuestionnaire;
    String type;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.setId(id);
    }

    public String getValeur() {
        return valeur;
    }
    public void setValeur(String valeur) {
        this.setValeur(valeur);
    }

    public int getCoefficient() {
        return coefficient;
    }
    public void setCoefficient(int coefficient) {
        this.setCoefficient(coefficient);
    }

    public int getIdQuestionnaire() {
        return idQuestionnaire;
    }
    public void setIdQuestionnaire(int idQuestionnaire) {
        this.setIdQuestionnaire(idQuestionnaire);
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.setType(type);
    }

    public Question(int id, String valeur, int coefficient, int idQuestionnaire, String type) {
        this.id = id;
        this.valeur = valeur;
        this.coefficient = coefficient;
        this.idQuestionnaire = idQuestionnaire;
        this.type = type;
    }

    public Question(String valeur, int coefficient, int idQuestionnaire, String type) {
        this.valeur = valeur;
        this.coefficient = coefficient;
        this.idQuestionnaire = idQuestionnaire;
        this.type = type;
    }

    public Question() {
    }

    public Vector<Question> getQuestion(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM question");
        Vector<Question> listQuestion = new Vector<>();
        while (resultSet.next()) {
            listQuestion.addElement(new Question(resultSet.getInt("id"), resultSet.getString("valeur"), resultSet.getInt("coefficient"), resultSet.getInt("questionnaire_id"), resultSet.getString("type")));
        }
        statement.close();
        return listQuestion;
    }
}
