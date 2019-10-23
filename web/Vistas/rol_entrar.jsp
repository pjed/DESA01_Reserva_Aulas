<%-- 
    Document   : index
    Created on : 16-oct-2019, 15:26:03
    Author     : DarkS
--%>

<%@page import="Usuario.Rol"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DESA01_Reserva_Aulas</title>
        <%
            Usuario usuarioLog = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuarioLog = (Usuario) session.getAttribute("usuarioLog");
            }
        %>
    </head>
    <body>
        <form name="frmRolEntrar" action="../controlador.jsp" method="POST">
            <div id="selecPerfil">
                Seleccione el perfil deseado:<br>
                <select id="selectPerfil" name="selectPerfil">
                    <%
                        ArrayList<Rol> rol = usuarioLog.getRoles();

                        if (usuarioLog.getRoles().size() != 0) {
                            for (int idx = 0; idx < usuarioLog.getRoles().size(); idx++) {
                                Rol r = usuarioLog.getRoles().get(idx);

                                if (rol.get(idx).getIdRol().equals("1")) {
                                    //Mostrar Desplegable solo con Administrador General
                    %>
                    <option value="<%out.print(r.getIdRol());%>"><%out.print(r.getDescRol());%></option>
                    <%
                        }
                        if (rol.get(idx).getIdRol().equals("2")) {
                            // Mostrar Desplegable con Administrador General y de Aula
                    %>
                    <option value="<%out.print(r.getIdRol());%>"><%out.print(r.getDescRol());%></option>
                    <%
                        }
                        if (rol.get(idx).getIdRol().equals("3")) {
                            // Mostrar Desplegable con Administrador General, de Aula y Profesor
                    %>
                    <option value="<%out.print(r.getIdRol());%>"><%out.print(r.getDescRol());%></option>
                    <%
                                }
                            }
                        }
                    %>
                </select>
                <br>
                <input type="submit" name="boton" value="Entrar"><br>
                <input type="submit" name="boton" value="Cerrar sesion">
                <input type="submit" name="boton" value="Ver Perfil">
            </div>
        </form>
    </body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          