<%-- 
    Document   : rol_entrar
    Created on : 16-oct-2019, 17:37:52
    Author     : DarkS
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="javax.sql.rowset.serial.SerialBlob"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Usuario.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rol entrar</title>
    </head>
    <body>
        <%
            Usuario usuarioLog = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuarioLog = (Usuario) session.getAttribute("usuarioLog");
            }
        %>
        <form name="frmRolEntrar" action="../controlador.jsp" method="POST">
            <div id="panelUsuarioRol" style="width: 25%; text-align: center;">
                <%
                    out.print("<img src='../" + usuarioLog.getFoto() + "'><br><br>");
                %>
                <fieldset>
                    <legend style="text-align: center;">Datos de Usuario</legend><br>
                    <%
                        out.print("Nombre: <span>" + usuarioLog.getNombre() + "</span>");
                    %>
                    <br><br>
                    <div id="cambiarPassword">
                        Nueva Contraseña:<br>
                        <input type="password" name="passwordNueva" placeholder="Escribe la nueva contraseña"><br>
                        <input type="submit" name="boton" value="Cambiar"><br><br>
                    </div>
                    <div id="cambiarFoto">
                        <input type="file" id="foto" name="foto" accept="image/jpeg"><br><br>
                        <input type="submit" id="boton" name="boton" value="Subir Foto">
                    </div>
                </fieldset>
            </div>
        </form>
    </body>
</html>
