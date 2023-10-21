<%@ page import="com.example.rh.Model.conge.Conge" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.example.rh.Model.conge.Calendrier" %>
<%@ page import="java.sql.Date" %>
<%@
        page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%
    Vector<Calendrier> calendriers = (Vector<Calendrier>) request.getAttribute("calendriers");
%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
</head>
<body>
<div id="calendar"></div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
            },
            initialView: 'timeGridWeek',
            events: [
                <% for(Calendrier calendrier : calendriers) { %>
                {
                    title: ' Nom: <%= calendrier.getPrenom() %> Cause: <%= calendrier.getValue() %>',
                    start: '<%= calendrier.getDebut() %>',
                    end: '<%= calendrier.getFin() %>'
                },
                    <% } %>
            ]
        });
        calendar.render();
    });
</script>
</body>
</html>
