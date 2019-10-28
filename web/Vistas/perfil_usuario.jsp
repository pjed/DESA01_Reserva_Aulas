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
        <link rel="stylesheet" type="text/css" href="../css/rol_entrar.css">
    </head>
    <body>
        <%
            Usuario usuarioLog = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuarioLog = (Usuario) session.getAttribute("usuarioLog");
                if (usuarioLog.getFotoBlob() == null) {
                    Conexion.ConexionEstatica.abrirBD();
                    usuarioLog = Conexion.ConexionEstatica.existeUsuario(usuarioLog.getNombre_usuario(), usuarioLog.getPassword());
                    Conexion.ConexionEstatica.cerrarBD();
                }
            }
        %>
        <form name="frmRolEntrar" action="../controlador.jsp" method="POST">
            <div style="display: block; float: left;">
                <%
                    if (usuarioLog.getFoto_defecto() != null) {
                        out.print("<img style='border-radius: 25px 25px' src='../" + usuarioLog.getFoto_defecto() + "' width='100px' height='100px'><br><br>");
                    } else {
                        out.print("<img style='border-radius: 25px 25px' src='" + usuarioLog.getFotoimgString() + "' width='100px' height='100px'><br><br>");
                    }
                %>
            </div>
            <div style="width: 200px; display: float; float: left; margin-left: 15px;">
                <%
                    out.print("Nombre: <span>" + usuarioLog.getNombre() + "</span>");
                %>
                <br>
                <br>
                Nueva Contraseña:
                <input type="password" name="passwordNueva" placeholder="Escribe la nueva contraseña"><br>
                <input type="submit" name="boton" value="Cambiar">
            </div>
        </form>
        <div style="width: 100px; display: float; float: left; margin-left: 15px;">
            <form name="frmFoto" action="../subefichero.jsp" enctype="multipart/form-data" method="POST">
                <div id="cambiarFoto">Foto de perfil:
                    <input type="file" name="fichero"><br><br><br>
                    <input type="submit" value="Subir fichero">
                </div>
            </form>
        </div>
    </body>
</html>
