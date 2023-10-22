<%@ page import="com.example.rh.Model.entretien.Entretien" %>
<%@ page import="java.util.Vector" %>
<%@
        page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%
    Vector<Entretien> entretienVector = (Vector<Entretien>) request.getAttribute("entretiens");
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
                <% for(Entretien entretien : entretienVector) { %>
                {
                    title: '<%= entretien.getTache() %>',
                    start: '<%= entretien.getDebut() %>',
                    end: '<%= entretien.getFin() %>'
                },
                <% } %>
            ]
        });
        calendar.render();
    });
</script>
</body>
</html>
