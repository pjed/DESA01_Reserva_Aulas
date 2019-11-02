<%-- 
    Document   : olvido
    Created on : 16-oct-2019, 15:51:46
    Author     : DarkS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar Contraseña</title>
        <link rel="stylesheet" type="text/css" href="../css/rol_entrar.css">
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;lang=en" />

    </head>
    <body>
        <main class="container">
            <section class="header_logo">
                <a href="../index.jsp"><div class="logo_pagina"></div></a>
            </section>
            <section class="header">
                <div><span class="gestiona_aulas">¿Has olvidado tu contraseña?</span></div>
                <div></div>
            </section>
            <section class="content" id="contenido">
                <form name="frmOlvido" action="../controlador.jsp" method="POST">
                    <div class="izda">
                        Usuario: <input type="text" name="usuario" placeholder="Usuario"><br><br>
                        Contraseña: <input type="password" name="password" placeholder="Contraseña"><br><br>
                        <input type="submit" name="boton" value="Restablecer Password">
                    </div>
                </form>
            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas --- CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
