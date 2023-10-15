package com.example.rh.Model.v2;

import java.util.ArrayList;

public class Service extends com.example.rh.Model.services.ServiceAction {
    ArrayList<Poste> postes;

    public ArrayList<Poste> getPostes() {
        return postes;
    }

    public void setPostes(ArrayList<Poste> postes) {
        this.postes = postes;
    }
}
