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
        <link rel="stylesheet" type="text/css" href="css/index.css">
        <script type="text/javascript" src="js/reserva.js"></script>
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;lang=en" />

    </head>
    <body>
        <main class="container">
            <section class="header_logo">
                <a href="index.jsp"><div class="logo_pagina"></div></a>
            </section>
            <section class="header">
                <div><span class="gestiona_aulas">Gestión de Aulas</span></div>
            </section>
            <section class="content">
                <div class="logo_fondo">
                    <div class="marco_fuera">
                        <div class="marco_login">
                            <form name="frmLogin" action="controlador.jsp" method="POST">
                                <span>Usuario: </span><input type="text" name="usuario" id="usuario" placeholder="Usuario"><br><br>
                                <span>Contraseña: </span><input type="password" name="password" id="password" placeholder="Contraseña"><br><br>
                                <!--<input type="submit" name="boton" value="Login" onclick="return compruebaLogin()"><br><br>-->
                                <input type="submit" name="boton" value="Login" onclick="return validaCookie()"><br><br>
                                <span id="val_log" name="val_log" id="val_log" style="color: red;"></span><br>
                                <a href="Vistas/registro.jsp" id="registro">Registrar</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="Vistas/olvido.jsp" id="olvido">He olvidado la contraseña</a>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas --- CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
