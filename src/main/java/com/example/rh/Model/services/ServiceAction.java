package com.example.rh.Model.services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class ServiceAction {
    int id;
    String nom;

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

    public ServiceAction(int id, String nom) {
        this.setId(id);
        this.setNom(nom);
    }
    public ServiceAction() {

    }

    public ServiceAction getServiceAction(Connection connection, int id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM service_action WHERE id = "+id);
        resultSet.next();
        ServiceAction serviceAction = new ServiceAction(resultSet.getInt("id"), resultSet.getString("nom"));
        return serviceAction;
    }
    public List<ServiceAction> getServiceActions(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM service_action");
        List<ServiceAction> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(new ServiceAction(resultSet.getInt("id"), resultSet.getString("nom")));
        }

        return list;
    }

    public void create(Connection connection) throws Exception {
        String sql = "INSERT INTO server_action VALUES (default, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, getNom());
        preparedStatement.executeQuery();
    }


}
