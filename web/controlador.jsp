<%-- 
    Document   : controlador
    Created on : 18-oct-2019, 15:01:31
    Author     : DarkS
--%>

<%@page import="Usuario.ReservaDetalle"%>
<%@page import="Usuario.ReservaAula"%>
<%@page import="Usuario.Reserva"%>
<%@page import="Usuario.Aula"%>
<%@page import="Usuario.Rol"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Email.Email"%>
<%@page import="Codificar.Codificar"%>
<%@page import="Conexion.ConexionEstatica"%>
<%@page import="Usuario.Usuario"%>
<%
    //TODO Comprobar como hacer de que redireccione cuando la sesión expira
    String boton;
    HttpSession sesion = request.getSession();
    sesion.setMaxInactiveInterval(60);
    
    if (request.getParameter("boton") != null) {
        boton = (String) request.getParameter("boton");

        if (boton.equals("Registrar")) {
            String dni_usuario = request.getParameter("dni");
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            String passwordCod = Codificar.codifica(password);
            String activo = "0";
            String foto = "img/sin_foto.png";
            String email = request.getParameter("email");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            Integer edad = Integer.parseInt(request.getParameter("edad"));
            String password_rep = request.getParameter("password_rep");
            String password_rep_cod = Codificar.codifica(password_rep);

            Usuario usu = new Usuario(dni_usuario, usuario, passwordCod, activo, foto, email, nombre, apellidos, edad, password_rep_cod);

            ConexionEstatica.abrirBD();

            Usuario existe = ConexionEstatica.existeUsuario(usuario, passwordCod);

            Boolean captcha = false;

            if (existe == null) {
                if (passwordCod.equals(password_rep_cod)) {
                    if (request.getParameter("captcha").equals(request.getParameter("valCaptcha"))) {
                        captcha = true;
                    }

                    if (captcha) {
                        ConexionEstatica.Insertar_Dato("USUARIOS", usu);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('El usuario insertado correctamente');");
                        out.println("location='index.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Captcha incorrecto, vuelve a intentarlo');");
                        out.println("location='Vistas/registro.jsp';");
                        out.println("</script>");
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Las contraseñas no coinciden');");
                    out.println("location='Vistas/registro.jsp';");
                    out.println("</script>");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('El usuario existe en la BBDD');");
                out.println("location='Vistas/registro.jsp';");
                out.println("</script>");
            }

            ConexionEstatica.cerrarBD();
        }

        if (boton.equals("Login")) {
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            String passwordCod = Codificar.codifica(password);

            ConexionEstatica.abrirBD();

            //Compruebo si existe el usuario
            Usuario existeUsuario = ConexionEstatica.existeUsuario(usuario, passwordCod);

            //No existe el usuario muestro error
            if (existeUsuario == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('El usuario y/o contraseña no validos');");
                out.println("location='index.jsp';");
                out.println("</script>");
            } else {
                //Obtengo los roles y seteo el usuario en sesion

                ArrayList<Rol> roles = ConexionEstatica.obtenerRolesUsuario(existeUsuario);

                existeUsuario.setRoles(roles);

                session.setAttribute("usuarioLog", existeUsuario);
                response.sendRedirect("Vistas/rol_entrar.jsp");
            }

            ConexionEstatica.cerrarBD();
        }

        /* *******************************************************************
     ********************* OLVIDAR CONTRASEÑA *****************************
     * ********************************************************************
         */
        String clavePredeterminada = "Chu";

        if (boton.equals("Restablecer Password")) {
            String usuario = request.getParameter("nombre");
            String clave = request.getParameter("password");
            String claveCod = Codificar.codifica(clave);
            ConexionEstatica.abrirBD();
            Usuario usu = ConexionEstatica.existeUsuario(usuario, claveCod);
            ConexionEstatica.cerrarBD();
            if (usu != null) {
                ConexionEstatica.abrirBD();
                ConexionEstatica.Modificar_Contrasena("USUARIOS", Codificar.codifica(clavePredeterminada), usu);
                ConexionEstatica.cerrarBD();
                String correo_destino = usu.getCorreo();
                String pass_destino = "Contraseña del correo personal del usuario sin codificar";
                Email.send(correo_destino, pass_destino, usu.getNombre_usuario(), "Recuperación de Contraseña", "Tu contraseña ha cambiado ahora es " + clavePredeterminada);

                out.println("<script type=\"text/javascript\">");
                out.println("alert('Contraseña enviada al correo electronico');");
                out.println("location='index.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('El usuario y/o contraseña son incorrectos');");
                out.println("location='Vistas/olvido.jsp';");
                out.println("</script>");
            }
        }

        if (boton.equals("Cambiar")) {
            Usuario usuarioLog = (Usuario) session.getAttribute("usuarioLog");
            String passwordCod = Codificar.codifica(request.getParameter("passwordNueva"));

            ConexionEstatica.abrirBD();
            ConexionEstatica.Modificar_Contrasena("usuarios", passwordCod, usuarioLog);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Contraseña cambiada correctamente');");
            out.println("location='index.jsp';");
            out.println("</script>");
            ConexionEstatica.cerrarBD();
        }

        //Pantalla seleccionar rol entrar para entrar como seleccione el usuario
        if (boton.equals("Entrar")) {
            String rolSeleccionado = request.getParameter("selectPerfil");

            if (rolSeleccionado.equals("1")) {
                response.sendRedirect("Vistas/Administrador_General/admin_general.jsp");
            }

            if (rolSeleccionado.equals("2")) {
                response.sendRedirect("Vistas/Administrador_Aula/admin_aula.jsp");
            }

            if (rolSeleccionado.equals("3")) {

                //Obtenemos todas las aulas de la BBDD
                ConexionEstatica.abrirBD();
                ArrayList<Aula> aulas = ConexionEstatica.obtenerAulas();
                ConexionEstatica.cerrarBD();

                //guardamos las aulas en sesion
                session.setAttribute("aulas", aulas);

                response.sendRedirect("Vistas/Profesor/profesor.jsp");
            }
        }

        if (boton.equals("Ver cuadrante")) {
            String fecha = request.getParameter("fecha");
            String aula = request.getParameter("aula");

            session.setAttribute("fecha", fecha);
            session.setAttribute("aula", aula);

            ConexionEstatica.abrirBD();
            ArrayList<ReservaAula> reservas = ConexionEstatica.obtenerReservasFecha(fecha, aula);
            ConexionEstatica.cerrarBD();

            session.setAttribute("reservas", reservas);
            response.sendRedirect("Vistas/Profesor/profesor.jsp");
        }

        if (boton.equals("Eliminar Reserva")) {

            Usuario usuario = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuario = (Usuario) session.getAttribute("usuarioLog");

                String idReserva = request.getParameter("idReserva");

                ConexionEstatica.abrirBD();
                ConexionEstatica.Borrar_Dato("reservas", usuario, idReserva);
                ConexionEstatica.cerrarBD();
                response.sendRedirect("Vistas/Profesor/profesor.jsp");
            }
        }

        if (boton.equals("Ver reservas profesor")) {
            Usuario usuario = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuario = (Usuario) session.getAttribute("usuarioLog");

                //Obtener todas las reservas de la tabla reservas
                ConexionEstatica.abrirBD();
                ArrayList<Reserva> reservasProfesor = ConexionEstatica.obtenerReservasAulaProfesor(usuario);
                ConexionEstatica.cerrarBD();

                session.setAttribute("reservasProfesor", reservasProfesor);
                response.sendRedirect("Vistas/Profesor/profesor.jsp");
            } 
        }

        if (boton.equals("Ver Detalles")) {
            Usuario usuario = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuario = (Usuario) session.getAttribute("usuarioLog");

                String idReserva = request.getParameter("idReserva");

                //Obtener de la tabla reservas los campos COD_AULA, Descripcion, FECHA, INICIO Y FIN
                ConexionEstatica.abrirBD();
                ReservaDetalle rdSeleccionada = ConexionEstatica.obtenerDetallesReserva(idReserva);
                ConexionEstatica.cerrarBD();
                session.setAttribute("rdSeleccionada", rdSeleccionada);
                response.sendRedirect("Vistas/Profesor/profesor.jsp");
            } 
        }
        if (boton.equals("Libre")) {
            Usuario usuario = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuario = (Usuario) session.getAttribute("usuarioLog");

                String dniUsuario = usuario.getDni();
                String idFranja = request.getParameter("franja");
                String codAula = String.valueOf(session.getAttribute("aula"));
                String fecha = String.valueOf(session.getAttribute("fecha"));

                ConexionEstatica.abrirBD();
                ConexionEstatica.Insertar_Reserva("reservas", dniUsuario, idFranja, codAula, fecha);
                ConexionEstatica.cerrarBD();

                response.sendRedirect("Vistas/Profesor/profesor.jsp");
            } 
        }

        if (boton.equals("Volver")) {
            response.sendRedirect("Vistas/rol_entrar.jsp");
        }

        if (boton.equals("Cerrar sesion")) {
            Usuario usuario = null;
            if (session.getAttribute("usuarioLog") != null) {
                usuario = (Usuario) session.getAttribute("usuarioLog");
                Bitacora.Bitacora.escribirBitacora("El usuario " + usuario.getNombre() + " ha cerrado sesión.");
                session.invalidate();
                response.sendRedirect("index.jsp");
            } 
        }
    }
%>