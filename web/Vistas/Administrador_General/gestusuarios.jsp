<%-- 
    Document   : gestusuarios
    Created on : 22-oct-2019, 8:52:00
    Author     : daw201
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Usuario.Usuario"%>
<%@page import="Conexion.ConexionEstatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Usuarios</title>
        <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="../../js/reserva.js"></script>
        <script type="text/javascript" src="../../js/paginacion.js"></script>
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
        <link rel="stylesheet" type="text/css" href="../../css/rol_entrar.css">
        <link rel="stylesheet" type="text/css" href="../../css/paginacion.css">
    </head>
    <body>
        <%
            ArrayList<Usuario> usuarios = null;
            ConexionEstatica.abrirBD();
            usuarios = ConexionEstatica.obtenerUsuarios();
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
                <nav>
                    <ul>
                        <form name="frmGestUsuarios" action="../../controlador.jsp">
                            <li><input type="submit" name="boton" value="Gestionar Usuarios"  class="active"></li>
                        </form>
                        <form name="frmBitacora" action="../../controlador.jsp">
                            <li><input type="submit" name="boton" value="Ver Bitacora"></li>
                        </form>
                    </ul>
                </nav>
                <form name="frmGestUsuario" id="usuarios" action="../../controlador.jsp" method="POST">
                    <h1 style="text-align: center; font-size: 14pt;">Gestión de Usuarios</h1>
                    <table id="tblData" role="table">
                        <thead role="rowgroup">
                            <tr role="row">
                                <th role="columnheader">Dni</th>
                                <th role="columnheader">Correo</th>
                                <th role="columnheader">Nombre</th>
                                <th role="columnheader">Apellidos</th>
                                <th role="columnheader">Edad</th>
                                <th role="columnheader">Activo</th>
                                <th role="columnheader"></th>
                                <th role="columnheader">IdRol</th>
                                <th role="columnheader">Descripción Rol</th>
                            </tr>
                        </thead>
                        <tbody role="rowgroup">
                            <%
                                if (usuarios.size() > 0) {
                                    for (int idx = 0; idx < usuarios.size(); idx++) {
                                        Usuario usu = usuarios.get(idx);
                            %>
                        <form name="frmUsuario" action="../../controlador.jsp" method="POST">
                            <tr role="row">
                                <td role="cell"><input type="text" name="dni" readonly class="readonly" value="<%out.print(usu.getDni());%>" style="width: 75px;"></td>
                                <td role="cell"><input type="text" name="correo" id="correo" value="<%out.print(usu.getCorreo());%>" style="width: 200px;" readonly class="readonly"></td>
                                <td role="cell"><input type="text" name="nombre" id="nombre" value="<%out.print(usu.getNombre());%>" required><span class="validity"></span></td>
                                <td role="cell"><input type="text" name="apellidos" id="apellidos" value="<%out.print(usu.getApellidos());%>" required><span class="validity"></span></td>
                                <td role="cell"><input type="number" name="edad" id="edad" value="<%out.print(usu.getEdad());%>" required><span class="validity"></span></td>
                                <td role="cell"><input type="text" name="activo" readonly class="readonly" value="<%out.print(usu.getActivo());%>" style="width: 50px;"></td>
                                    <%
                                        if (usu.getActivo().equals("0")) {
                                    %>
                                <td><input type="submit" name="boton" value="                     Activar Usuario" style="background:url(../../img/activar.png) no-repeat; border: none; background-size: contain; background-position: center; width: 25px; height: 25px;"></td>
                                    <%
                                    } else {
                                    %>
                                <td><input type="submit" name="boton" value="                     Desactivar Usuario" style="background:url(../../img/desactivar.jpeg) no-repeat; border: none; background-size: contain; background-position: center; width: 25px; height: 25px;"></td>
                                    <%
                                        }
                                    %>
                                <td><input type="text" name="idRol" value="<%out.print(usu.getRol());%>" style="width: 50px;" required><span class="validity"></span></td>
                                <td><input type="text" name="descRol" readonly class="readonly"  value="<%out.print(usu.getDescRol());%>"></td>
                                <td><input type="submit" name="boton" value="                     Modificar Usuario" onclick="return validaCamposGestUsuarios()" style="background:url(../../img/modify.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                                <td><input type="submit" name="boton" value="                     Eliminar Usuario" style="background:url(../../img/delete.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                            </tr>
                        </form>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </form>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
