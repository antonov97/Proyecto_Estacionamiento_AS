<%@ page import="modelo.Notificacion" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Notificaci�n</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>
    <h1>Actualizar Notificaci�n</h1>
    
    <% 
        // Obtener datos de la notificaci�n a actualizar
        int idNotificacion = Integer.parseInt(request.getParameter("idNotificacion"));
        String nuevaDescripcion = "";
        LocalDate nuevaFecha = null;
        String nuevaHora = "";
        int nuevoTipo = 0;

        // Obtener la notificaci�n de la sesi�n o de la base de datos seg�n sea necesario
        Notificacion notificacion = (Notificacion) request.getAttribute("notificacion");
        if (notificacion != null) {
            nuevaDescripcion = notificacion.getDescripcion();
            nuevaFecha = notificacion.getFecha();
            nuevaHora = notificacion.getHora();
            nuevoTipo = notificacion.getTipo();
        }
    %>

    <form action="ActualizarNotificacion" method="post">
        <!-- Campos para la actualizaci�n de la notificaci�n -->
        <input type="hidden" name="idNotificacion" value="<%= idNotificacion %>">
        <label>Nueva Descripci�n:</label> <input type="text" name="nuevaDescripcion" value="<%= nuevaDescripcion %>" required> <br>
        <label>Nueva Fecha:</label> <input type="date" name="nuevaFecha" value="<%= nuevaFecha %>" required> <br>
        <label>Nueva Hora:</label> <input type="text" name="nuevaHora" value="<%= nuevaHora %>" required> <br>
        <label>Nuevo Tipo:</label>
        <select name="nuevoTipo">
            <option value="0" <%= (nuevoTipo == 0) ? "selected" : "" %>>Aviso</option>
            <option value="1" <%= (nuevoTipo == 1) ? "selected" : "" %>>Urgencia baja</option>
            <option value="2" <%= (nuevoTipo == 2) ? "selected" : "" %>>Urgencia media</option>
            <option value="3" <%= (nuevoTipo == 3) ? "selected" : "" %>>Urgencia alta</option>
            <option value="4" <%= (nuevoTipo == 4) ? "selected" : "" %>>Sanci�n</option>
        </select> <br>
        
        <input type="submit" name="action" value="actualizar">
    </form>

    <div>
        <form action="menuPrincipal.jsp" method="post">
            <input type="submit" value="Menu Principal">
        </form>
    </div>
</body>
</html>
