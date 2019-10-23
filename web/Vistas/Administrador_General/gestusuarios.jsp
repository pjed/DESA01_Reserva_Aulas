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
                <th>DNI</th>
                <th>CORREO</th>
                <th>NOMBRE</th>
                <th>APELLIDO</th>
                <th>EDAD</th>
                <th>ACTIVO</th>
                <th></th>
                <th>ID_ROL</th>
                <th>DESC_ROL</th>
                </thead>
                <%
                    if (usuarios.size() > 0) {
                        for (int idx = 0; idx < usuarios.size(); idx++) {
                            Usuario usu = usuarios.get(idx);
                %>
                <form name="frmUsuario" action="../../controlador.jsp" method="POST">
                    <tr>
                        <td><input type="text" name="dni" readonly value="<%out.print(usu.getDni());%>" style="width: 75px;"></td>
                        <td><input type="text" name="correo" readonly value="<%out.print(usu.getCorreo());%>" style="width: 200px;"></td>
                        <td><input type="text" name="nombre" value="<%out.print(usu.getNombre());%>"></td>
                        <td><input type="text" name="apellidos" value="<%out.print(usu.getApellidos());%>"></td>
                        <td><input type="number" name="edad" value="<%out.print(usu.getEdad());%>"></td>
                        <td><input type="text" name="activo" readonly value="<%out.print(usu.getActivo());%>" style="width: 50px;"></td>
                            <%
                                if (usu.getActivo().equals("0")) {
                            %>
                        <td><input type="submit" name="boton" value="Activar Usuario" style="width: 150px;"></td>
                            <%
                            } else {
                            %>
                        <td><input type="submit" name="boton" value="Desactivar Usuario" style="width: 150px;"></td>
                            <%
                                }
                            %>
                        <td><input type="text" name="idRol" value="<%out.print(usu.getRol());%>" style="width: 50px;"></td>
                        <td><input type="text" name="descRol" readonly  value="<%out.print(usu.getDescRol());%>"></td>
                        <td><input type="submit" name="boton" value="                     Modificar Usuario" style="background:url(../../img/modify.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
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
