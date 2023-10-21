<%@ page import="com.example.rh.Model.conge.TypeConge" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.example.rh.Model.poste.PersonnePoste" %>
<%@
        page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%
    List<TypeConge> typeCongeList = (List<TypeConge>) request.getAttribute("typeConge");
    Vector<PersonnePoste> personnePostes = (Vector<PersonnePoste>) request.getAttribute("personnePostes");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insertion conge</title>
</head>
<body>
<form method="Get" action="insert-conge">
<h1>Création d'un congé</h1>

<p>Employe:</p>
<select name="employe">
    <option disabled selected value="">-</option>
    <% for(PersonnePoste personnePoste : personnePostes) { %>
    <option value="<%= personnePoste.getPoste_id() %>"><%= personnePoste.getNom() %> <%= personnePoste.getPrenom() %></option>
    <% } %>
</select>

<p>Date debut:
    <input type="date" name="debut">
</p>

<p>Date fin:
    <input type="date" name="fin">
</p>

<p>Type de conge:</p>
    <select name="typeConge">
        <option disabled selected value="">-</option>
        <% for(TypeConge typeConge : typeCongeList) { %>
        <option value="<%= typeConge.getId_type_conge() %>"><%= typeConge.getValue() %></option>
    <% } %>

        <input type="submit" value="Créer Congé">
</select>
</form>
</body>
</html>