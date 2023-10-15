package com.example.rh.Model.poste;

import com.example.rh.Model.services.ServiceAction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Poste {
    int id;
    ServiceAction serviceAction;
    String type;
    int superieur_poste_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ServiceAction getServiceAction() {
        return serviceAction;
    }

    public void setServiceAction(ServiceAction serviceAction) {
        this.serviceAction = serviceAction;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getSuperieur_poste_id() {
        return superieur_poste_id;
    }

    public void setSuperieur_poste_id(int superieur_poste_id) {
        this.superieur_poste_id = superieur_poste_id;
    }

    public Poste(int id, ServiceAction serviceAction, String type, int superieur_poste_id) {
        this.id = id;
        this.serviceAction = serviceAction;
        this.type = type;
        this.superieur_poste_id = superieur_poste_id;
    }

    public Poste(ServiceAction serviceAction, String type, int superieur_poste_id) {
        this.serviceAction = serviceAction;
        this.type = type;
        this.superieur_poste_id = superieur_poste_id;
    }

    public Poste() {
    }

    public List<Poste> getPoste(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM poste");
        List<Poste> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(new Poste(
                    resultSet.getInt("id"),
                    new ServiceAction().getServiceAction(connection, resultSet.getInt("id")),
                    resultSet.getString("type"),
                    resultSet.getInt("superieur_poste_id")
            ));
        }
        return list;
    }

}
