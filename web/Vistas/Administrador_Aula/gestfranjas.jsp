<%-- 
    Document   : gestfranjas
    Created on : 21-oct-2019, 10:42:04
    Author     : daw201
--%>

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
    </head>
    <body>
        <%
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
                <h1 style="margin: 0 auto; text-align: center; margin-top: 50px;">Gestión de Franjas Horarias</h1>
                <form name="frmGestFranjas" action="../../controlador.jsp" method="POST">
                    <table style="margin: 0 auto; width: 20%; text-align: center;">
                        <thead>
                        <th>Id Franja</th>
                        <th>Inicio</th>
                        <th>Fin</th>
                        </thead>
                        <%
                            if (franjas.size() != 0) {

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
                        <tr>
                            <td colspan="4"><input type="submit" name="boton" value="Volver"></td>
                        </tr>
                    </table>
                </form>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
