<%-- 
    Document   : index
    Created on : 16-oct-2019, 15:26:03
    Author     : DarkS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DESA01_Reserva_Aulas</title>
    </head>
    <body>
        <form name="frmLogin" action="controlador.jsp" method="POST">
            Usuario: <input type="text" name="usuario" placeholder="Usuario"><br><br>
            Contraseña: <input type="password" name="password" placeholder="Contraseña"><br><br>
            <input type="submit" name="boton" value="Login"><br><br>
            <a href="Vistas/registro.jsp" id="registro">Registrar</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="Vistas/olvido.jsp" id="olvido">He olvidado la contraseña</a><br><br>
        </form>
    </body>
</html>
