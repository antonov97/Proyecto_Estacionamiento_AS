<%@ page import="modelo.Notificacion" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar y Actualizar Notificaciones</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>
    <h1>Buscar y Actualizar Notificaciones por Matr�cula</h1>
    
    <form action="BuscarNotificacionesActualizar" method="post">
        <!-- Campo para buscar notificaciones por matr�cula -->
        <label>Matr�cula del veh�culo:</label> <input type="text" name="matricula" required> <br>
        <input type="submit" name="action" value="buscar">
    </form>

    <!-- Si se encontraron notificaciones, mostrar formulario de gesti�n -->
    <% if (request.getAttribute("notificacionesEncontradas") != null) {
        boolean notificacionesEncontradas = (boolean) request.getAttribute("notificacionesEncontradas");
        if (notificacionesEncontradas) {
            List<Notificacion> notificaciones = (List<Notificacion>) request.getAttribute("notificaciones");
    %>
    <h2>Notificaciones Encontradas</h2>
    <div>
        <h3>Notificaciones de esa matr�cula:</h3>
        <% for (Notificacion notificacion : notificaciones) { %>
        <p>ID del notificaci�n: <%= notificacion.getId() %></p>
        <p>ID del propietario: <%= notificacion.getIdPropietario() %></p>
        <p>Descripcion de la notificacion: <%= notificacion.getDescripcion() %></p>
        <p>Fecha de la notificacion: <%= notificacion.getFecha() %></p>
        <p>Hora: <%= notificacion.getHora() %></p>
        <% 
            // Utilizar un switch para mostrar el tipo de notificaci�n de manera descriptiva
            switch (notificacion.getTipo()) {
                case 0:
                    out.println("<p>Tipo de notificaci�n: Aviso</p>");
                    break;
                case 1:
                    out.println("<p>Tipo de notificaci�n: Urgencia baja</p>");
                    break;
                case 2:
                    out.println("<p>Tipo de notificaci�n: Urgencia media</p>");
                    break;
                case 3:
                    out.println("<p>Tipo de notificaci�n: Urgencia alta</p>");
                    break;
                case 4:
                    out.println("<p>Tipo de notificaci�n: Sanci�n</p>");
                    break;
                default:
                    out.println("<p>Tipo de notificaci�n desconocido</p>");
            }
        %>
        <p>Matr�cula: <%= notificacion.getMatriculaVehiculo() %></p>
        
        <!-- Bot�n para actualizar la notificaci�n individual -->
        <form action="actualizarNotificacion.jsp" method="POST">
            <input type="hidden" name="idNotificacion" value="<%= notificacion.getId() %>">
            <button type="submit" name="action" value="actualizar">Actualizar</button>
        </form>
        
        <hr>
        <% } %>
    </div>
    <% } else { %>
    <h2>Notificaciones NO Encontradas</h2>
    <% } } %>
</body>
</html>
