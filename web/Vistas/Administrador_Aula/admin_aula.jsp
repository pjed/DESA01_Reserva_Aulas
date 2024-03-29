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
        <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
        <link rel="stylesheet" type="text/css" href="../../css/rol_entrar.css">
        <link rel="stylesheet" type="text/css" href="../../css/paginacion.css">
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;lang=en" />
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
            session.setAttribute("rol", "2");
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

                Bitacora.Bitacora.escribirBitacora("El usuario gestiona reservas ", usuarioLog.getCorreo(), "Admin Aula");
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

        <main class="container">
            <section class="header_logo">
                <a href="../../index.jsp"><div class="logo_pagina"></div></a>
            </section>
            <section class="header">
                <iframe class="perfil" src="../perfil_usuario.jsp" scrolling="no"></iframe>
            </section>
            <section class="content" id="contenido">
                <form name="frmAdminGeneral" action="../../controlador.jsp" method="POST">
                    <div id="aulas_tabla" class="aulas_tabla">
                        <span>ELIGE FECHA</span><input type="date" name="fecha" id="fecha"><br><br>
                        <span>ELIGE AULA</span>
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
                        <h3 class="centrado"><%out.print(fecha);%></h3>
                        <h3 class="centrado">AULA&nbsp;<%out.print(aul);%></h3>
                        <table role="table" id="aulas">
                            <thead role="rowgroup">
                                <tr role="row">
                                    <th role="columnheader">Id Reserva</th>
                                    <th role="columnheader">Hora Comienzo</th>
                                    <th role="columnheader">Hora final</th><th>Reservado</th>
                                </tr>
                            </thead>
                            <tbody role="rowgroup">
                                <%
                                    for (int idx = 0; idx < reservas.size(); idx++) {
                                        ReservaAula ra = reservas.get(idx);
                                %>
                            <form name="frmCRUD" action="../../controlador.jsp" method="POST">
                                <tr role="row">
                                    <td role="cell"><input type="text" name="franja" value="<%out.print(ra.getIdFranja());%>" readonly class="readonly"></td>
                                    <td role="cell"><input type="text" name="inicio" value="<%out.print(ra.getInicio());%>" readonly class="readonly"></td>
                                    <td role="cell"><input type="text" name="fin" value="<%out.print(ra.getFin());%>" readonly class="readonly"></td>
                                    <td role="cell"><input type="submit" name="boton" value="<%out.print(ra.getEstadoReserva());%>"></td>
                                </tr>
                            </form>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                        <div style="margin: 0 auto;">
                            <input type="submit" name="boton" value="Gestionar aula">
                            <input type="submit" name="boton" value="Gestionar franjas">
                        </div>
                        <%
                                }
                            }
                        %>
                        <br>
                        <input type="submit" name="boton" value="Volver">&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" name="boton" value="Cerrar sesion">
                    </div>
                </form>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas --- CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
