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
        <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="../js/reserva.js"></script>
        <link rel="stylesheet" type="text/css" href="../css/rol_entrar.css">
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
        <main class="container">
            <section class="header">
                <a href="../index.jsp"><div class="logo_pagina"></div></a>
                <div><span class="gestiona_aulas">Gestión de Aulas</span></div>
                <div></div>
            </section>
            <section class="content" id="contenido">
                <form name="frmRegistro" id="registro" action="../controlador.jsp" method="POST">
                <h1>Registro de Usuario</h1>
                    <div class="izda">
                        <span>DNI: </span><input type="text" id="dni" name="dni" placeholder="00000000Z"><br>
                        <span id="val_dni" style="color: red;"></span><br><br>

                        <span>Nombre: </span><input type="text" id="nombre" name="nombre" placeholder="Nombre"><br>
                        <span id="val_nombre" style="color: red;"></span><br><br>

                        <span>Apellidos: </span><input type="text" id="apellidos" name="apellidos" placeholder="Apellidos"><br>
                        <span id="val_apellidos" style="color: red;"></span><br><br>

                        <span>Email: </span><input type="text" id="email" name="email" placeholder="tucorreo@loquesea.xxx"><br>
                        <span id="val_email" style="color: red;"></span><br><br>

                        <span>Edad: </span><input type="text" name="edad" id="edad" placeholder="Edad"><br>
                        <span id="val_edad" style="color: red;"></span><br><br>
                        <input type="submit" onclick="return validaCampos()" name="boton" value="Registrar">
                    </div>
                    <div class="derecha">
                        <span>Nombre de Usuario: </span><input type="text" name="usuario" id="usuario" placeholder="Nombre de usuario"><br>
                        <span id="val_usuario" style="color: red;"></span><br><br>

                        <span>Contraseña: </span><input type="password" name="password" id="password" placeholder="Contraseña"><br>
                        <span id="val_password" style="color: red;"></span><br><br>

                        <span>Vuelve a introducir tu Contraseña: </span><input type="password" id="password_rep" name="password_rep" placeholder="Contraseña"><br>
                        <span id="val_password_rep" style="color: red;"></span><br><br>

                        <span>Captcha: </span><input type="text" readonly name="captcha" value="<%out.print(generarCaptcha());%>"><br><br>
                        <span>Introduce el captcha: </span><input type="text" name="valCaptcha" id="valCaptcha" placeholder="Introduce el captcha"><br>
                        <span id="val_valCaptcha" style="color: red;"></span><br><br>
                    </div>
                </form>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
