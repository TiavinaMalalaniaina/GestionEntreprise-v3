package com.example.rh.Model.services;

import com.example.rh.Model.functions.Function;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Besoin {
    int id;
    String tache;
    Timestamp dateCreation;
    Timestamp dateBesoin;
    double dureeTache;
    int publie;
    ServiceAction serviceAction;
    Service service;

    public int getPublie() {
        return publie;
    }

    public void setPublie(int publie) {
        this.publie = publie;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTache() {
        return tache;
    }

    public void setTache(String tache) {
        this.tache = tache;
    }

    public Timestamp getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(Timestamp dateCreation) {
        this.dateCreation = dateCreation;
    }

    public Timestamp getDateBesoin() {
        return dateBesoin;
    }

    public void setDateBesoin(Timestamp dateBesoin) {
        this.dateBesoin = dateBesoin;
    }

    public double getDureeTache() {
        return dureeTache;
    }

    public void setDureeTache(double dureeTache) {
        this.dureeTache = dureeTache;
    }

    public ServiceAction getServiceAction() {
        return serviceAction;
    }

    public void setServiceAction(ServiceAction serviceAction) {
        this.serviceAction = serviceAction;
    }

    public Besoin(int id, String tache , Timestamp dateCreation, Timestamp dateBesoin, double dureeTache, int publie, ServiceAction serviceAction, Service service) {
        this.setId(id);
        this.setTache(tache);
        this.setDateCreation(dateCreation);
        this.setDateBesoin(dateBesoin);
        this.setDureeTache(dureeTache);
        this.setServiceAction(serviceAction);
        this.setService(service);
        this.setPublie(publie);
    }

    public Besoin() {

    }

    public void create(Connection connection) throws Exception {
        String sql = "INSERT INTO besoin( id, tache, date_creation, date_besoin, duree_tache, publie, service_action_id, service_id)VALUES (default, '"+getTache()+"','"+getDateCreation().toString()+"','"+getDateBesoin()+"',"+getDureeTache()+","+getPublie()+","+getServiceAction().getId()+","+getService().getId()+")";

        /*PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, getTache());
        preparedStatement.setString(2, getDate().toString());
        preparedStatement.setDouble(3, getDureeTache());
        preparedStatement.setInt(4, getServiceAction().getId());
        preparedStatement.setInt(5,getService().getId());*/
        System.out.println(sql+" haha");
        Statement statement = connection.createStatement();
        ResultSet rowAffected = statement.executeQuery(sql);
    }

    public List<Besoin> getBesoins(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM besoin");
        List<Besoin> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(new Besoin(
                resultSet.getInt("id"),
                resultSet.getString("tache"),
                resultSet.getTimestamp("date_creation"),
                resultSet.getTimestamp("date_besoin"),
                resultSet.getDouble("duree_tache"),
                resultSet.getInt("publie") ,
                new ServiceAction().getServiceAction(connection, resultSet.getInt("service_action_id")) ,
                new Service().getService(connection, resultSet.getInt("service_id"))
            ));
        }
        return list;
    }

    public Besoin getBesoin(Connection connection, int id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM besoin WHERE id = "+id);
        Besoin besoin = null;
        resultSet.next();
        besoin = new Besoin(
            resultSet.getInt("id"),
            resultSet.getString("tache"),
            resultSet.getTimestamp("date_creation"),
            resultSet.getTimestamp("date_besoin"),
            resultSet.getDouble("duree_tache"),
            resultSet.getInt("publie") ,
            new ServiceAction().getServiceAction(connection, resultSet.getInt("service_action_id")) ,
            new Service().getService(connection, resultSet.getInt("service_id"))
        );

        return besoin;
    }

    public String[] getEtat() {
        String[] strings = new String[2];
        if (this.publie == 0){
            strings[0] = "warning";
            strings[1] = "non publié";
            return strings;
        }
        strings[0] = "success";
        strings[1] = "publié";
        return strings;
    }

    public String getEtaPourLien() {
        if (this.publie == 0) return "publier";
        return "";
    }


    public double progressDate() {
        return new Function().pourcentageProgressDate(getDateCreation(), getDateBesoin());
    }


}