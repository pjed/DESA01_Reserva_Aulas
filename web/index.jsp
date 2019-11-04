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
        <script>
            /*var veces = 1;
            $(function () {
                $("#Login").click(function () {

                    comprobarLogin();

                });
            });

            function comprobarLogin() {
                
                var a = leercookie();
                //comprueba la existencia de la cookie mediante la búsqueda de un dato conocido
                if (a === "inactiva") {

                    alert("Se sobrepaso el límite, espere unos seguntos");
                    $("#usuario").attr("disabled", "disabled");
                    $("#password").attr("disabled", "disabled");
                } else {
                    $("#usuario").attr("enabled", "enabled");
                    $("#password").attr("enabled", "enabled");
                    if (veces < 3) {

                        veces += 1;//cuenta oportunidades
                        $("#usuario").val(" ");
                        $("#password").val("");

                    } else {

                        document.cookie = "nombre=inactiva;max-age=60"; //Crea un Cookie durante 60 segundos

                        veces = 1;
                        alert("ha sobrepasado las opciones");
                        $("#usuario").val(" ");
                        $("#password").val(" ");
                        $("#usuario").attr("disabled", "disabled");
                        $("#password").attr("disabled", "disabled");
                    }

                }
                localStorage.setItem("cookie", document.cookie);
            }

            function leercookie() {

                //var ca = document.cookie.split('=');//Recupera el contenido de la cookie separando la información que interesa
                var ca = getCookie("cookie").split('=');
                var c = ca[1];

                return c;
            }

            function getCookie(c_name) {
                return localStorage.getItem(c_name);
            }*/

        </script>
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
                                <span>Usuario: </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="usuario" id="usuario" placeholder="Usuario"><br><br>
                                <span>Contraseña: </span><input type="password" name="password" id="password" placeholder="Contraseña"><br><br>
                                <input type="submit" name="boton" value="Login" id="Login"><br><br>
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
