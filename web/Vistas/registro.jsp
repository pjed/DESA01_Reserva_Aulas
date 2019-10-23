<%-- 
    Document   : registro
    Created on : 16-oct-2019, 15:41:12
    Author     : DarkS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
    </head>
    <body>
        <%!
            public String generarCaptcha() {
                char[] elementos = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'ñ', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
                char[] conjunto = new char[8];
                String pass;

                for (int i = 0; i < 8; i++) {
                    int el = (int) (Math.random() * 37);
                    conjunto[i] = (char) elementos[el];
                }
                return pass = new String(conjunto);
            }
        %>
        <form name="frmRegistro" action="../controlador.jsp" method="POST">
            <div id="registro">
                DNI: <input type="text" name="dni" placeholder="00000000Z"><br><br>
                Nombre: <input type="text" name="nombre" placeholder="Nombre"><br><br>
                Apellidos: <input type="text" name="apellidos" placeholder="Apellidos"><br><br>
                Correo: <input type="text" name="email" placeholder="tucorreo@loquesea.xxx"><br><br>
                Edad: <input type="text" name="edad" placeholder="Edad"><br><br>
                Nombre de Usuario: <input type="text" name="usuario" placeholder="Nombre de usuario"><br><br>
                Contraseña: <input type="password" name="password" placeholder="Contraseña"><br><br>
                Vuelve a introducir tu Contraseña: <input type="password" name="password_rep" placeholder="Contraseña"><br><br>
                Captcha: <input type="text" readonly name="captcha" value="<%out.print(generarCaptcha());%>"><br><br>
                Introduce el captcha: <input type="text" name="valCaptcha" placeholder="Introduce el captcha"><br><br>
            </div>
            <input type="submit" name="boton" value="Registrar">
        </form>
    </body>
</html>
