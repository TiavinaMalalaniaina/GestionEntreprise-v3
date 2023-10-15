<%@ page import="com.example.rh.Model.conge.Conge" %>
<%@ page import="java.util.Vector" %>
<%@
        page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%
    Vector<Conge> listConge = (Vector<Conge>) request.getAttribute("listConge");
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
                {
                    <% for(Conge conge : listConge) { %>
                    title: <%= conge.getValeur() %>,
                    start: <%= conge.getDebut() %>,
                    end: <%= conge.getFin() %>
                    <% } %>
                },
                {
                    title: 'Événement 2',
                    start: '2023-10-20T14:00:00',
                    end: '2023-10-20T16:00:00'
                }
            ]
        });
        calendar.render();
    });
</script>
</body>
</html>
