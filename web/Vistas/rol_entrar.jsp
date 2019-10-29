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
                    <nav>
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

            </section>
            <section class="footer"><span>Desa01 - Reserva de Aulas &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CIFP Virgen de Gracia</span></section>
        </main>
    </body>
</html>
