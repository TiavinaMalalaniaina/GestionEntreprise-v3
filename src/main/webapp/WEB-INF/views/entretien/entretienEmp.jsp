<%@ page import="com.example.rh.Model.entretien.EntretienEmploye" %>
<%@ page import="java.util.Vector" %><%
    Vector<EntretienEmploye> entretienVector = (Vector<EntretienEmploye>) request.getAttribute("entretienEmployes");
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <table>
        <tr>
            <th>Debut entretien</th>
            <th>Nom candidat</th>
            <th>Prenom candidat</th>
            <th>Heure de debut</th>
        </tr>
            <% for(EntretienEmploye entretienEmploye: entretienVector) { %>
        <tr>
            <td><%= entretienEmploye.getEntretien_debut() %></td>
            <td><%= entretienEmploye.getCandidat_nom() %></td>
            <td><%= entretienEmploye.getCandidat_prenom() %></td>
            <td><%= entretienEmploye.getDebut_heure() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>