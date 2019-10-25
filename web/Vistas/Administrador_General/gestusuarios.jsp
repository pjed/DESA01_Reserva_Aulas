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
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
    </head>
    <body>
        <%
            ArrayList<Usuario> usuarios = null;
            ConexionEstatica.abrirBD();
            usuarios = ConexionEstatica.obtenerUsuarios();
            ConexionEstatica.cerrarBD();
        %>
        <form name="frmGestUsuario" action="../../controlador.jsp" method="POST">
            <table>
                <thead>
                <th>Dni</th>
                <th>Correo</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Edad</th>
                <th>Activo</th>
                <th></th>
                <th>IdRol</th>
                <th>Descripción Rol</th>
                </thead>
                <%
                    if (usuarios.size() > 0) {
                        for (int idx = 0; idx < usuarios.size(); idx++) {
                            Usuario usu = usuarios.get(idx);
                %>
                <form name="frmUsuario" action="../../controlador.jsp" method="POST">
                    <tr>
                        <td><input type="text" name="dni" readonly class="readonly" value="<%out.print(usu.getDni());%>" style="width: 75px;"></td>
                        <td><input type="text" name="correo" id="correo" value="<%out.print(usu.getCorreo());%>" style="width: 200px;" readonly class="readonly"></td>
                        <td><input type="text" name="nombre" id="nombre" value="<%out.print(usu.getNombre());%>" required><span class="validity"></span></td>
                        <td><input type="text" name="apellidos" id="apellidos" value="<%out.print(usu.getApellidos());%>" required><span class="validity"></span></td>
                        <td><input type="number" name="edad" id="edad" value="<%out.print(usu.getEdad());%>" required><span class="validity"></span></td>
                        <td><input type="text" name="activo" readonly class="readonly" value="<%out.print(usu.getActivo());%>" style="width: 50px;"></td>
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
                        <td><input type="text" name="idRol" class="readonly" readonly value="<%out.print(usu.getRol());%>" style="width: 50px;"></td>
                        <td><input type="text" name="descRol" readonly class="readonly"  value="<%out.print(usu.getDescRol());%>"></td>
                        <td><input type="submit" name="boton" value="                     Modificar Usuario" onclick="return validaCamposGestUsuarios()" style="background:url(../../img/modify.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                        <td><input type="submit" name="boton" value="                     Eliminar Usuario" style="background:url(../../img/delete.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                    </tr>
                </form>
                <%
                        }
                    }
                %>
            </table>
        </form>
    </body>
</html>
