package com.example.rh.Model.postes;

import com.example.rh.Model.criteres.CategorieCritere;
import com.example.rh.Model.criteres.Critere;
import com.example.rh.Model.services.Besoin;
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
    Besoin besoin;
    Poste posteSuperieur;

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

    public Poste getPosteSuperieur() {
        return posteSuperieur;
    }

    public Besoin getBesoin() {
        return besoin;
    }

    public void setBesoin(Besoin besoin) {
        this.besoin = besoin;
    }

    public void setPosteSuperieur(Poste posteSuperieur) {
        this.posteSuperieur = posteSuperieur;
    }

    public Poste(int id, ServiceAction serviceAction, String type, Poste posteSuperieur, Besoin besoin) {
        this.id = id;
        this.serviceAction = serviceAction;
        this.type = type;
        this.posteSuperieur = posteSuperieur;
        this.setBesoin(besoin);
    }

    public Poste() {

    }
    public Poste getPoste(Connection connection, int id) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM poste WHERE id = "+id);
        Poste poste = null;
        resultSet.next();
        poste = new Poste(
                resultSet.getInt("id"),
                new ServiceAction().getServiceAction(connection, resultSet.getInt("service_action_id")),
                resultSet.getString("type"),
                new Poste().getPoste(connection, resultSet.getInt("superieur_poste_id")) ,
                new Besoin().getBesoin(connection, resultSet.getInt("besoin_id"))
        );

        return poste;
    }

    public List<Poste> getPostes(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM poste WHERE id = "+id);
        List<Poste> postes = new ArrayList<>();
        resultSet.next();
        postes.add( new Poste(
            resultSet.getInt("id"),
            new ServiceAction().getServiceAction(connection, resultSet.getInt("service_action_id")),
            resultSet.getString("type"),
            new Poste().getPoste(connection, resultSet.getInt("superieur_poste_id")) ,
            new Besoin().getBesoin(connection, resultSet.getInt("besoin_id"))

        ));

        return postes;
    }
}
