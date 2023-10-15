package com.example.rh.Model.conge;

import com.example.rh.Model.poste.Poste;
import com.example.rh.Model.services.ServiceAction;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TypeConge {
    int id_type_conge;
    String value;
    boolean comptabilise;

    public int getId_type_conge() {
        return id_type_conge;
    }

    public void setId_type_conge(int id_type_conge) {
        this.id_type_conge = id_type_conge;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public boolean isComptabilise() {
        return comptabilise;
    }

    public void setComptabilise(boolean comptabilise) {
        this.comptabilise = comptabilise;
    }

    public TypeConge(int id_type_conge, String value, boolean comptabilise) {
        this.id_type_conge = id_type_conge;
        this.value = value;
        this.comptabilise = comptabilise;
    }

    public TypeConge() {
    }

    public List<TypeConge> getTypeConge(Connection connection) throws SQLException {
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT *FROM type_conge");
        List<TypeConge> list = new ArrayList<>();
        while (resultSet.next()) {
            list.add(new TypeConge(
                    resultSet.getInt("id_type_conge"),
                    resultSet.getString("value"),
                    resultSet.getBoolean("coptabilise")
            ));
        }
        return list;
    }
}
