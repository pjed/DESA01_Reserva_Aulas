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
        <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
        <link rel="stylesheet" type="text/css" href="../../css/rol_entrar.css">
        <script>
            var fechaGlobal = null;
            $(document).ready(function () {
                $("#fecha").blur(function (event) {
                    event.preventDefault();
                    fechaGlobal = $("#fecha").val();
                });
            });


            function getDate() {
                if (fechaGlobal === null) {
                    var f = new Date();
                    var fecha = f.getFullYear() + "-" + (f.getMonth() + 1) + "-" + f.getDate();
                    $("#fecha").val(fecha);
                }
            }
        </script>
    </head>
    <body onload="getDate()">
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
        <main class="container">
            <section class="header">
                <a href="../../index.jsp"><div class="logo_pagina"></div></a>
                <iframe class="perfil" src="../perfil_usuario.jsp" scrolling="no"></iframe>
            </section>
            <section class="content" id="contenido">
                <form name="frmProfesor" action="../../controlador.jsp" method="POST">
                    <div id="profesor">
                        <div id="aulas_tabla">
                            ELIGE FECHA<input type="date" name="fecha" id="fecha"><br><br>
                            ELIGE AULA
                            <select id="aula" name="aula">
                                <%  for (int idx = 0; idx < aulas.size(); idx++) {
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
                            <th>Id Reserva</th><th>Hora Comienzo</th><th>Hora final</th><th>Reservado</th>
                            </thead>
                            <%
                                for (int idx = 0; idx < reservas.size(); idx++) {
                                    ReservaAula ra = reservas.get(idx);
                            %>
                            <form name="frmCRUD" action="../../controlador.jsp" method="POST">
                                <tr>
                                    <td><input type="text" name="franja" value="<%out.print(ra.getIdFranja());%>" readonly class="readonly"></td>
                                    <td><input type="text" name="inicio" value="<%out.print(ra.getInicio());%>" readonly class="readonly"></td>
                                    <td><input type="text" name="fin" value="<%out.print(ra.getFin());%>" readonly class="readonly"></td>
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
                            <th>Id Reserva</th><th>Fecha</th><th>Número Aula</th>
                            </thead>
                            <%
                                for (int idx = 0; idx < reservasProfesor.size(); idx++) {
                                    Reserva rp = reservasProfesor.get(idx);
                            %>
                            <form name="frmCRUD" action="../../controlador.jsp" method="POST">
                                <tr>
                                    <td><input type="text" name="idReserva"  value="<%out.print(rp.getIdReserva());%>" readonly class="readonly"></td>
                                    <td><input type="text" name="fecha" readonly value="<%out.print(rp.getFecha());%>" readonly class="readonly"> </td>
                                    <td><input type="text" name="codAula" readonly value="<%out.print(rp.getCodAula());%>" readonly class="readonly"> </td>
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
                                <th>Número Aula</th><th>Descripción Aula</th><th>Fecha Reserva</th><th>Inicio</th><th>Fin</th>
                                </thead>
                                <tr>
                                    <td><input type="text" name="aula" readonly value="<%out.print(rd.getCodAula());%>" readonly class="readonly"></td>
                                    <td><input type="text" name="descAulaDetalle" readonly value="<%out.print(rd.getDescAula());%>" readonly class="readonly"></td>
                                    <td><input type="text" name="fechaDetalle" readonly value="<%out.print(rd.getFecha());%>" readonly class="readonly"></td>
                                    <td><input type="text" name="inicioDetalle" readonly value="<%out.print(rd.getInicio());%>" readonly class="readonly"></td>
                                    <td><input type="text" name="finDetalle" readonly value="<%out.print(rd.getFin());%>" readonly class="readonly"></td>
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
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
