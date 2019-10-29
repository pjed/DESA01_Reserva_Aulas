<%-- 
    Document   : verBitacora
    Created on : 22-oct-2019, 8:51:43
    Author     : daw201
--%>

<%@page import="Usuario.Bitacora"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Bitácora Web</title>
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
        <link rel="stylesheet" type="text/css" href="../../css/rol_entrar.css">
        <link rel="stylesheet" type="text/css" href="../../css/paginacion.css">
        <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="../../js/paginacion.js"></script>
    </head>
    <body>
        <%
            session.setAttribute("rol", "1");
            ArrayList<Bitacora> logBitacora = null;
            
            Conexion.ConexionEstatica.abrirBD();
            logBitacora = Conexion.ConexionEstatica.obtenerBitacora();
            Conexion.ConexionEstatica.cerrarBD();
            /*Scanner sc = new Scanner(new File("bitacora.txt"));
            while (sc.hasNextLine()) {
                out.println(sc.nextLine()+"<br>");
            }
            sc.close();*/

        %>
        <main class="container">
            <section class="header_logo">
                <a href="../../index.jsp"><div class="logo_pagina"></div></a>
            </section>
            <section class="header">
                <iframe class="perfil" src="../perfil_usuario.jsp" scrolling="no"></iframe>
            </section>
            <section class="content">
                <!--<nav>
                    <ul>
                        <form name="frmGestUsuarios" action="../../controlador.jsp">
                            <li><input type="submit" name="boton" value="Gestionar Usuarios"  class="active"></li>
                        </form>
                        <form name="frmBitacora" action="../../controlador.jsp">
                            <li><input type="submit" name="boton" value="Ver Bitacora"></li>
                        </form>
                    </ul>
                </nav>-->
                <h1 style="text-align: center; font-size: 14pt;">Ver Bitácora</h1>
                <form id="bitacora">
                    <table id="tblData">
                        <thead>
                        <th class="span_header">Acción</th>
                        <th class="span_header">Fecha y Hora de la acción</th>
                        <th class="span_header">Correo</th>
                        <th class="span_header">Rol</th>
                        </thead>

                        <%                    if (logBitacora.size() > 0) {
                                for (int idx = 0; idx < logBitacora.size(); idx++) {
                                    Bitacora bi = logBitacora.get(idx);

                        %>
                        <tr>
                            <td><span ><%out.print(bi.getAccion());%></span></td>
                            <td class="td_span_bitacora"><span><%out.print(bi.getFyh());%></span></td>
                            <td class="td_span_bitacora"><span><%out.print(bi.getCorreo());%></span></td>
                            <td><span><%out.print(bi.getRol());%></span></td>
                        </tr>
                        <%                    }

                            }
                        %>
                    </table>
                </form>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
