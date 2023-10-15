<%@ page import="com.example.rh.Model.conge.TypeConge" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.rh.Model.poste.PosteEmploye" %>
<%@
        page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%
    List<TypeConge> typeCongeList = (List<TypeConge>) request.getAttribute("typeConge");
    List<PosteEmploye> posteEmployes = (List<PosteEmploye>) request.getAttribute("posteEmploye");
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
<form method="Get" action="conge">
<h1>Création d'un congé</h1>

<p>Employe:</p>
<select name="employe" value="typeConge">
    <option disabled selected value="">-</option>
    <% for(PosteEmploye posteEmploye : posteEmployes) { %>
    <option value="<%= posteEmploye.getId() %>"><%= posteEmploye.getEmploye_id() %></option>
    <% } %>
</select>

<p>Date debut:
    <input type="date" name="debut">
</p>

<p>Date fin:
    <input type="date" name="fin">
</p>

<p>Type de conge:</p>
    <select name="typeConge" value="typeConge">
        <option disabled selected value="">-</option>
        <% for(TypeConge typeConge : typeCongeList) { %>
        <option value="<%= typeConge.getId_type_conge() %>"><%= typeConge.getValue() %></option>
    <% } %>
</select>
</form>
</body>
</html>