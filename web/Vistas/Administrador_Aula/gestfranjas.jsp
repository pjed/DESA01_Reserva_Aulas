<%-- 
    Document   : gestfranjas
    Created on : 21-oct-2019, 10:42:04
    Author     : daw201
--%>

<%@page import="Usuario.Usuario"%>
<%@page import="Conexion.ConexionEstatica"%>
<%@page import="Usuario.Franja"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Franjas Horarias</title>
        <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="../../js/reserva.js"></script>
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
        <link rel="stylesheet" type="text/css" href="../../css/rol_entrar.css">
        <link rel="stylesheet" type="text/css" href="../../css/paginacion.css">
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;lang=en" />

    </head>
    <body>
        <%
            session.setAttribute("rol", "2");

            if (session.getAttribute("usuarioLog") != null) {
                Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLog");

                Bitacora.Bitacora.escribirBitacora("El usuario gestiona franjas ", usuarioLog.getCorreo(), "Admin Aula");
            }

            ArrayList<Franja> franjas = null;

            ConexionEstatica.abrirBD();
            franjas = ConexionEstatica.obtenerFranjas();
            ConexionEstatica.cerrarBD();

        %>


        <main class="container">
            <section class="header_logo">
                <a href="../../index.jsp"><div class="logo_pagina"></div></a>
            </section>
            <section class="header">
                <iframe class="perfil" src="../perfil_usuario.jsp" scrolling="no"></iframe>
            </section>
            <section class="content" id="contenido">
                <form name="frmGestFranjas" id="franjas" action="../../controlador.jsp" method="POST">
                    <table class="gest_franjas">
                        <thead>
                        <th>Id Franja</th>
                        <th>Inicio</th>
                        <th>Fin</th>
                        </thead>
                        <%                            if (franjas.size() != 0) {

                                for (int i = 0; i < franjas.size(); i++) {
                                    Franja al = franjas.get(i);
                        %>
                        <form name="franja" action="../../controlador.jsp" method="POST">
                            <tr>
                                <td><input type="text" class="readonly" id="idFranja" name="idFranja" value="<%out.print(al.getIdFranja());%>" readonly ></td>
                                <td><input type="time" name="inicio" placeholder="00:00" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]" id="inicio" value="<%out.print(al.getInicio());%>" ></td>
                                <td><input type="time" name="fin" placeholder="00:00" pattern="([01]?[0-9]|2[0-3]):[0-5][0-9]" id="fin" value="<%out.print(al.getFin());%>" ></td>
                                <td><input type="submit" name="boton" onclick="return validaCamposFranjas()" value="                     Modificar Franja" style="background:url(../../img/modify.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;" ></td>
                            </tr>
                        </form>
                        <%
                                }
                            }
                        %>
                    </table>
                    <input type="submit" name="boton" value="Volver">
                </form>
            </section>

            <section class="footer"><span>Desa01 - Reserva de Aulas --- CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
