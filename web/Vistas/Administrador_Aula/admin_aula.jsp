<%-- 
    Document   : admin_aula
    Created on : 19-oct-2019, 8:28:44
    Author     : DarkS
--%>

<%@page import="Conexion.ConexionEstatica"%>
<%@page import="Usuario.ReservaDetalle"%>
<%@page import="Usuario.ReservaDetalle"%>
<%@page import="Usuario.Usuario"%>
<%@page import="Usuario.Reserva"%>
<%@page import="Usuario.Aula"%>
<%@page import="Usuario.ReservaAula"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Administrador de Aula</title>
    </head>
    <body>
        <%
            Usuario usuarioLog = null;
            ArrayList<Aula> aulas = null;
            ArrayList<ReservaAula> reservas = null;
            ArrayList<Reserva> reservasProfesor = null;
            String aul = "";
            String fecha = "";
            ReservaDetalle rd = null;

            //Obtenemos todas las aulas de la BBDD
            ConexionEstatica.abrirBD();
            aulas = ConexionEstatica.obtenerAulas();
            ConexionEstatica.cerrarBD();

            if (session.getAttribute("rdSeleccionada") != null) {
                rd = (ReservaDetalle) session.getAttribute("rdSeleccionada");
            }

            if (session.getAttribute("usuarioLog") != null) {
                usuarioLog = (Usuario) session.getAttribute("usuarioLog");
            }

            if (session.getAttribute("reservasProfesor") != null) {
                reservasProfesor = (ArrayList<Reserva>) session.getAttribute("reservasProfesor");
            }

            if (session.getAttribute("aula") != null) {
                aul = (String) session.getAttribute("aula");
            }

            if (session.getAttribute("fecha") != null) {
                fecha = (String) session.getAttribute("fecha");
            }

            if (session.getAttribute("reservas") != null) {
                reservas = (ArrayList<ReservaAula>) session.getAttribute("reservas");
            }
        %>

        <form name="frmAdminGeneral" action="../../controlador.jsp" method="POST">
            <div id="aulas_tabla">
                ELIGE FECHA<input type="date" name="fecha" id="fecha"><br><br>
                ELIGE AULA
                <select id="aula" name="aula">
                    <%                        for (int idx = 0; idx < aulas.size(); idx++) {
                            Aula aula = (Aula) aulas.get(idx);
                    %>
                    <%
                        if (idx == 0) {
                    %>
                    <option selected value="<%out.print(aula.getCodAula());%>"><%out.print(aula.getCodAula());%></option>
                    <%
                    } else {
                    %>
                    <option value="<%out.print(aula.getCodAula());%>"><%out.print(aula.getCodAula());%></option>
                    <%
                        }
                    %>
                    <%
                        }
                    %>
                </select>
                <br><br>
                <input type="submit" name="boton" value="Ver cuadrante"><br><br>
                <%
                    if (reservas != null) {
                        if (reservas.size() > 0) {

                %>
                <%out.print(fecha);%><br><br>
                AULA&nbsp;<%out.print(aul);%><br><br>
                <table id="aulas">
                    <thead>
                    <th>ID</th><th>HORA COMIENZO</th><th>HORA FINAL</th><th>RESERVADO</th>
                    </thead>
                    <%
                        for (int idx = 0; idx < reservas.size(); idx++) {
                            ReservaAula ra = reservas.get(idx);
                    %>
                    <form name="frmCRUD" action="../../controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" name="franja" value="<%out.print(ra.getIdFranja());%>"></td>
                            <td><input type="text" name="inicio" value="<%out.print(ra.getInicio());%>"></td>
                            <td><input type="text" name="fin" value="<%out.print(ra.getFin());%>"></td>
                            <td><input type="submit" name="boton" value="<%out.print(ra.getEstadoReserva());%>"></td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                </table>
                <%
                        }
                    }
                %>
            </div><br>
            <input type="submit" name="boton" value="Gestionar aula"><br><br>
            <input type="submit" name="boton" value="Gestionar franjas horarias">
        </form>
    </body>
</html>
