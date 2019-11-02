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
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;lang=en" />

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
            <section class="header_logo">
                <a href="../index.jsp"><div class="logo_pagina"></div></a>
            </section>
            <section class="header">
                <div><span class="gestiona_aulas">Registro de Usuario</span></div>
            </section>
            <section class="content" id="contenido">
                <form name="frmRegistro" id="registro" action="../controlador.jsp" method="POST">
                    <table style="margin: 0 auto; margin-top: 50px;">
                        <tr>
                            <td>
                                <span>DNI: </span>
                            </td>
                            <td>
                                <input type="text" id="dni" name="dni" placeholder="00000000Z"><br>
                                <span id="val_dni" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Nombre: </span>
                            </td>
                            <td>    
                                <input type="text" id="nombre" name="nombre" placeholder="Nombre"><br>
                                <span id="val_nombre" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Apellidos: </span>
                            </td>
                            <td>    
                                <input type="text" id="apellidos" name="apellidos" placeholder="Apellidos"><br>
                                <span id="val_apellidos" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Email: </span>
                            </td>
                            <td>    
                                <input type="text" id="email" name="email" placeholder="tucorreo@loquesea.xxx"><br>
                                <span id="val_email" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Edad: </span>
                            </td>
                            <td>    
                                <input type="text" name="edad" id="edad" placeholder="Edad"><br>
                                <span id="val_edad" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Nombre de Usuario: </span>
                            </td>
                            <td>    
                                <input type="text" name="usuario" id="usuario" placeholder="Nombre de usuario"><br>
                                <span id="val_usuario" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Contraseña: </span>
                            </td>
                            <td>    
                                <input type="password" name="password" id="password" placeholder="Contraseña"><br>
                                <span id="val_password" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Repite la contraseña: </span>
                            </td>
                            <td>    
                                <input type="password" id="password_rep" name="password_rep" placeholder="Contraseña"><br>
                                <span id="val_password_rep" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Captcha: </span>
                            </td>
                            <td>    
                                <input type="text" readonly name="captcha" value="<%out.print(generarCaptcha());%>"><br><br>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>Introduce el captcha: </span>
                            </td>
                            <td>    
                                <input type="text" name="valCaptcha" id="valCaptcha" placeholder="Introduce el captcha"><br>
                                <span id="val_valCaptcha" style="color: red;"></span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="submit" onclick="return validaCampos()" name="boton" value="Registrar">
                            </td>
                        </tr>
                    </table>
                </form>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas --- CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
