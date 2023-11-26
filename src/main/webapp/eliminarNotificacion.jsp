<%@ page import="modelo.Notificacion"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar Ticket</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>
    <h1>Buscar Ticket por matrícula</h1>
    <form action="EliminarNotificaciones" method="post">
        <label>Matrícula del vehículo:</label> <input type="text" name="matricula"> <br>
        <br> <input type="submit" name="action" value="buscar">
    </form>
    <div>
        <form action="menuPrincipal.jsp" method="post">
            <input type="submit" value="Menu Principal">
        </form>
    </div>

    <!-- Mensajes de éxito o error al eliminar -->
    <% if (request.getAttribute("mensajeEliminarUna") != null) {
        String mensajeEliminarUna = (String) request.getAttribute("mensajeEliminarUna");
        out.println("<p>" + mensajeEliminarUna + "</p>");
    } %>

    <% if (request.getAttribute("mensajeEliminarTodas") != null) {
        String mensajeEliminarTodas = (String) request.getAttribute("mensajeEliminarTodas");
        out.println("<p>" + mensajeEliminarTodas + "</p>");
    } %>

    <!-- Si se encontraron notificaciones, mostrar formulario de gestión -->
    <% if (request.getAttribute("notificacionesEncontradas") != null) {
        boolean notificacionesEncontradas = (boolean) request.getAttribute("notificacionesEncontradas");
        if (notificacionesEncontradas) {
            List<Notificacion> notificaciones = (List<Notificacion>) request.getAttribute("notificaciones");
    %>
    <h2>Notificaciones Encontradas</h2>
    <div>
        <h3>Notificaciones de esa matrícula:</h3>
        <!-- Botón para eliminar todas las notificaciones -->
        <form action="EliminarNotificaciones" method="POST">
            <button type="submit" name="action" value="eliminarTodas">Eliminar Todas</button>
        </form>
        <% for (Notificacion notificacion : notificaciones) { %>
        <p>ID del notificación: <%= notificacion.getId() %></p>
        <p>ID del propietario: <%= notificacion.getIdPropietario() %></p>
        <p>Descripcion de la notificacion: <%= notificacion.getDescripcion() %></p>
        <p>Fecha de la notificacion: <%= notificacion.getFecha() %></p>
        <p>Hora: <%= notificacion.getHora() %></p>
        <% 
            // Utilizar un switch para mostrar el tipo de notificación de manera descriptiva
            switch (notificacion.getTipo()) {
                case 0:
                    out.println("<p>Tipo de notificación: Aviso</p>");
                    break;
                case 1:
                    out.println("<p>Tipo de notificación: Urgencia baja</p>");
                    break;
                case 2:
                    out.println("<p>Tipo de notificación: Urgencia media</p>");
                    break;
                case 3:
                    out.println("<p>Tipo de notificación: Urgencia alta</p>");
                    break;
                case 4:
                    out.println("<p>Tipo de notificación: Sanción</p>");
                    break;
                default:
                    out.println("<p>Tipo de notificación desconocido</p>");
            }
        %>
        <p>Matrícula: <%= notificacion.getMatriculaVehiculo() %></p>
        <!-- Botón para eliminar la notificación individual -->
        <form action="EliminarNotificaciones" method="POST">
            <input type="hidden" name="idNotificacion" value="<%= notificacion.getId() %>">
            <button type="submit" name="action" value="eliminarIndividual">Eliminar</button>
        </form>
        <hr>
        <% } %>
    </div>
    <div>
        <form action="menuPrincipal.jsp" method="post">
            <input type="submit" value="Menu Principal">
        </form>
    </div>
    <% } else { %>
    <h2>Notificaciones NO Encontradas</h2>
    <div>
        <form action="menuPrincipal.jsp" method="post">
            <input type="submit" value="Menu Principal">
        </form>
    </div>
    <% }
       } %>
</body>
</html>
