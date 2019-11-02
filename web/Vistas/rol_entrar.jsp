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
        <link rel="stylesheet" type="text/css" href="../css/rol_entrar.css">
        <link rel="stylesheet" type="text/css" href="../css/hamburguesa.css">
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&amp;lang=en" />

    </head>
    <body>
        <%
            Usuario usuarioLog = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuarioLog = (Usuario) session.getAttribute("usuarioLog");

                session.setAttribute("rolSeleccionado", "5");
            }
        %>
        <main class="container">
            <section class="header_logo">
                <a href="../index.jsp"><div class="logo_pagina"></div></a>
            </section>
            <section class="header">
                <iframe class="perfil" src="perfil_usuario.jsp" scrolling="no"></iframe>
            </section>
            <section class="content" id="contenido">
                <header>
                    <nav id="desktop">
                        <ul>
                            <%
                                ArrayList<Rol> rol = usuarioLog.getRoles();

                                if (usuarioLog.getRoles().size() != 0) {
                                    for (int idx = 0; idx < usuarioLog.getRoles().size(); idx++) {
                                        Rol r = usuarioLog.getRoles().get(idx);

                                        if (rol.get(idx).getIdRol().equals("1")) {
                                            session.setAttribute("rolSeleccionado", "1");
                                            //Mostrar Desplegable solo con Administrador General
                            %>
                            <li>
                                <a href="#"><%out.print(r.getDescRol());%></a>
                                <ul>
                                    <li><a href="Administrador_General/gestusuarios.jsp">Gestionar Usuarios</a></li>
                                    <li><a href="Administrador_General/verBitacora.jsp">Ver Bitácora</a></li>
                                </ul>
                            </li>
                            <%
                                }
                                if (rol.get(idx).getIdRol().equals("2")) {
                                    session.setAttribute("rolSeleccionado", "2");
                                    // Mostrar Desplegable con Administrador General y de Aula
                            %>
                            <li>
                                <a href="#"><%out.print(r.getDescRol());%></a>
                                <ul>
                                    <li><a href="Administrador_Aula/admin_aula.jsp">Ver Cuadrante</a></li>
                                    <li><a href="Administrador_Aula/gestaula.jsp">Gestionar Aulas</a></li>
                                    <li><a href="Administrador_Aula/gestfranjas.jsp">Gestionar Franjas</a></li>
                                </ul>
                            </li>
                            <%
                                }
                                if (rol.get(idx).getIdRol().equals("3")) {
                                    // Mostrar Desplegable con Administrador General, de Aula y Profesor
                                    session.setAttribute("rolSeleccionado", "3");
                            %>
                            <li>
                                <a href="Profesor/profesor.jsp"><%out.print(r.getDescRol());%></a>
                            </li>
                            <%
                                        }
                                    }
                                }
                            %>
                        </ul>
                    </nav>
                </header>
                <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="leftMenu">
                    <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large">Cerrar &times;</button>
                    <%
                        rol = usuarioLog.getRoles();

                        if (usuarioLog.getRoles().size() != 0) {
                            for (int idx = 0; idx < usuarioLog.getRoles().size(); idx++) {
                                Rol r = usuarioLog.getRoles().get(idx);

                                if (rol.get(idx).getIdRol().equals("1")) {
                                    session.setAttribute("rolSeleccionado", "1");
                                    //Mostrar Desplegable solo con Administrador General
                    %>
                    <a href="#" class="w3-bar-item w3-button"><%out.print(r.getDescRol());%></a>
                    <ul>
                        <li><a href="Administrador_General/gestusuarios.jsp">Gestionar Usuarios</a></li>
                        <li><a href="Administrador_General/verBitacora.jsp">Ver Bitácora</a></li>
                    </ul>
                    <%
                        }
                        if (rol.get(idx).getIdRol().equals("2")) {
                            session.setAttribute("rolSeleccionado", "2");
                            // Mostrar Desplegable con Administrador General y de Aula
                    %>
                    <a href="#" class="w3-bar-item w3-button"><%out.print(r.getDescRol());%></a>
                    <ul>
                        <li><a href="Administrador_Aula/admin_aula.jsp">Ver Cuadrante</a></li>
                        <li><a href="Administrador_Aula/gestaula.jsp">Gestionar Aulas</a></li>
                        <li><a href="Administrador_Aula/gestfranjas.jsp">Gestionar Franjas</a></li>
                    </ul>
                    <%
                        }
                        if (rol.get(idx).getIdRol().equals("3")) {
                            // Mostrar Desplegable con Administrador General, de Aula y Profesor
                            session.setAttribute("rolSeleccionado", "3");
                    %>
                    <a href="Profesor/profesor.jsp" class="w3-bar-item w3-button"><%out.print(r.getDescRol());%></a>
                    <%
                                }
                            }
                        }
                    %>
                </div>


                <div class="w3-teal">
                    <button class="w3-button w3-teal w3-xlarge w3-left" onclick="openLeftMenu()">&#9776;</button>
                    <div class="w3-container">
                        <h1 style="text-align: center;">Seleccione perfil de usuario</h1>
                    </div>
                </div>

                <div class="w3-container">
                    <p>Seleccione en el menú de la izquierda/arriba un perfil para usar la aplicación</p>
                </div>

                <script>
                    function openLeftMenu() {
                        document.getElementById("leftMenu").style.display = "block";
                    }

                    function closeLeftMenu() {
                        document.getElementById("leftMenu").style.display = "none";
                    }
                </script>

            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas --- CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
