<%-- 
    Document   : profesor
    Created on : 19-oct-2019, 8:28:50
    Author     : DarkS
--%>

<%@page import="Conexion.ConexionEstatica"%>
<%@page import="Usuario.ReservaDetalle"%>
<%@page import="java.util.Date"%>
<%@page import="Usuario.ReservaAula"%>
<%@page import="Usuario.Reserva"%>
<%@page import="Usuario.Aula"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Profesor</title>
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

            if (session.getAttribute("rdSeleccionada") != null) {
                rd = (ReservaDetalle) session.getAttribute("rdSeleccionada");
            }

            if (session.getAttribute("usuarioLog") != null) {
                usuarioLog = (Usuario) session.getAttribute("usuarioLog");

                //Obtener todas las reservas de la tabla reservas
                ConexionEstatica.abrirBD();
                reservasProfesor = ConexionEstatica.obtenerReservasAulaProfesor(usuarioLog);
                ConexionEstatica.cerrarBD();
            }

            if (session.getAttribute("aula") != null) {
                aul = (String) session.getAttribute("aula");
            }

            if (session.getAttribute("fecha") != null) {
                fecha = (String) session.getAttribute("fecha");
            }

            if (session.getAttribute("aulas") != null) {
                aulas = (ArrayList<Aula>) session.getAttribute("aulas");
            }

            if (session.getAttribute("reservas") != null) {
                reservas = (ArrayList<ReservaAula>) session.getAttribute("reservas");
            }


        %>
        <form name="frmProfesor" action="../../controlador.jsp" method="POST">
            <div id="profesor">
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
                    <input type="submit" name="boton" value="Ver cuadrante"><br>
                </div>
                <%
                    if (reservas != null) {
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
                %>
                <input type="submit" name="boton" value="Ver reservas profesor"><br>
                <%
                    if (reservasProfesor != null) {
                        if (reservasProfesor.size() > 0) {
                %>
                <h2>Reservas del profesor</h2>
                <table id="reservasProfe">
                    <thead>
                    <th>ID_RESERVA</th><th>FECHA</th><th>NUMERO AULA</th>
                    </thead>
                    <%
                        for (int idx = 0; idx < reservasProfesor.size(); idx++) {
                            Reserva rp = reservasProfesor.get(idx);
                    %>
                    <form name="frmCRUD" action="../../controlador.jsp" method="POST">
                        <tr>
                            <td><input type="text" name="idReserva" readonly value="<%out.print(rp.getIdReserva());%>"></td>
                            <td><input type="text" name="fecha" readonly value="<%out.print(rp.getFecha());%>"> </td>
                            <td><input type="text" name="codAula" readonly value="<%out.print(rp.getCodAula());%>"> </td>
                            <td><input type="submit" name="boton" value="Ver Detalles"></td>
                            <td><input type="submit" name="boton" value="Eliminar Reserva"></td>
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

                <div id="detallesReserva">
                    <%
                        if (rd != null) {
                    %>
                    <h2>Detalle cita seleccionada</h2>
                    <table>
                        <thead>
                        <th>NUMERO AULA</th><th>DESC AULA</th><th>FECHA RESERVA</th><th>INICIO</th><th>FIN</th>
                        </thead>
                        <tr>
                            <td><input type="text" name="aula" readonly value="<%out.print(rd.getCodAula());%>"></td>
                            <td><input type="text" name="descAulaDetalle" readonly value="<%out.print(rd.getDescAula());%>"></td>
                            <td><input type="text" name="fechaDetalle" readonly value="<%out.print(rd.getFecha());%>"></td>
                            <td><input type="text" name="inicioDetalle" readonly value="<%out.print(rd.getInicio());%>"></td>
                            <td><input type="text" name="finDetalle" readonly value="<%out.print(rd.getFin());%>"></td>
                        </tr>
                    </table>
                    <%
                        }
                    %>
                </div>
                <br>
                <input type="submit" name="boton" value="Volver">&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" name="boton" value="Cerrar sesion">
            </div>
        </form>
    </body>
</html>
