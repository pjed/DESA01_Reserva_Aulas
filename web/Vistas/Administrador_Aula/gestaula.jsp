<%-- 
    Document   : gestaula
    Created on : 21-oct-2019, 10:40:56
    Author     : daw201
--%>

<%@page import="Usuario.Usuario"%>
<%@page import="Conexion.ConexionEstatica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Usuario.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Aulas</title>
        <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="../../js/reserva.js"></script>
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
        <link rel="stylesheet" type="text/css" href="../../css/rol_entrar.css">
        <link rel="stylesheet" type="text/css" href="../../css/paginacion.css">
    </head>
    <body>
        <%
            session.setAttribute("rol", "2");
            
            if (session.getAttribute("usuarioLog") != null) {
                Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLog");
                
                Bitacora.Bitacora.escribirBitacora("El usuario gestiona aulas ", usuarioLog.getCorreo(), "Admin Aula");
            }
            
            ConexionEstatica.abrirBD();
            ArrayList<Aula> aulas = ConexionEstatica.obtenerAulas();
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
                <form name="frmGestAulas" id="aulas" action="../../controlador.jsp" method="POST">
                    <h1 style="margin: 0 auto; text-align: center; margin-top: 50px;">Gestión de Aulas</h1>
                    <table style="margin: 0 auto; width: 40%; text-align: center;">
                        <thead>
                        <th>Id Aulas</th>
                        <th>Descripción</th>
                        </thead>
                        <%
                            if (aulas.size() != 0) {

                                for (int i = 0; i < aulas.size(); i++) {
                                    Aula al = aulas.get(i);
                        %>
                        <form name="frmAulas" action="../../controlador.jsp" method="POST">  
                            <tr>
                                <td><input type="text" readonly name="codAula" id="codAula" value="<%out.print(al.getCodAula());%>" class="readonly"></td>
                                <td><input type="text"  name="descripcion" id="descripcion" value="<%out.print(al.getDescripcion());%>" required><span class="validity"></span></td>
                                <td><input type="submit" name="boton" id="modAula" onclick="return validaCamposAula()" value="                     Modificar Aula" style="background:url(../../img/modify.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                                <td><input type="submit" name="boton" id="delAula" value="                     Eliminar Aula" style="background:url(../../img/delete.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                            </tr>
                        </form>
                        <%
                                }
                            }
                        %>
                        <form name="frmNuevaAula" action="../../controlador.jsp" method="POST">
                            <tr>
                                <td><input type="number" min="0" max="999" placeholder="000" id="nuevoCod" name="nuevoCod" value="" required><span class="validity"></span></td>
                                <td><input type="text"  id="nuevaDesc" name="nuevaDesc" value="" required><span class="validity"></span></td>
                                <td><input type="submit" name="boton" value="                     Add Aula" id="addAula" onclick="return validaCamposAulaAdd()" value="                     Add Aula" style="background:url(../../img/add.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                                <td></td>
                            </tr>
                        </form>
                        <tr>
                            <td colspan="4">
                                <input type="submit" name="boton" value="Volver">
                            </td>
                        </tr>
                    </table>
                </form>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
