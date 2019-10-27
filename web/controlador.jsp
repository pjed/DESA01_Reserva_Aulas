<%-- 
    Document   : controlador
    Created on : 18-oct-2019, 15:01:31
    Author     : DarkS
--%>

<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="Usuario.Franja"%>
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
    String boton;
    String rolSeleccionado = "";
    Usuario u;
    //session.setMaxInactiveInterval(60);

    //Comprobar si existe el fichero bitacora.txt
    /*File file = new File("bitacora.txt");
    if (!file.exists()) {
        FileWriter fw = new FileWriter(file);
        BufferedWriter bufferedWriter
                = new BufferedWriter(fw);

        String cabecera = "Acción &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
                + "Fecha y hora de la acción &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
                + "Correo del usuario &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "
                + "Rol";
        bufferedWriter.write(cabecera);
        bufferedWriter.newLine();
        bufferedWriter.close();
    }*/
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
            String rol = "3"; //Por defecto creamos el rol profesor para todos los nuevos usuarios

            Usuario usu = new Usuario(dni_usuario, usuario, passwordCod, activo, null, null, "img/sin_foto.png", email, nombre, apellidos, edad, password_rep_cod, rol);

            ConexionEstatica.abrirBD();
            Usuario existe = ConexionEstatica.existeUsuario(usuario, passwordCod);

            Boolean captcha = false;

            if (existe == null) {
                if (passwordCod.equals(password_rep_cod)) {
                    if (request.getParameter("captcha") != null) {
                        String cap = (String) request.getParameter("captcha");
                        String capVal = (String) request.getParameter("valCaptcha");

                        if (cap.equals(capVal)) {
                            captcha = true;
                        }

                    }

                    if (captcha) {
                        ConexionEstatica.Insertar_Dato("USUARIOS", usu);
                        ConexionEstatica.Insertar_Rol("rol_usuarios", usu);
                        ConexionEstatica.cerrarBD();
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

                if (existeUsuario.getActivo().equals("1")) {
                    //Obtengo los roles y seteo el usuario en sesion

                    ArrayList<Rol> roles = ConexionEstatica.obtenerRolesUsuario(existeUsuario);

                    existeUsuario.setRoles(roles);

                    session.setAttribute("usuarioLog", existeUsuario);
                    session.setAttribute("rolSeleccionado", "5");
                    response.sendRedirect("Vistas/rol_entrar.jsp");
                } else {
                    //Email.send("noreply@gestionaulas.com", "Password1234", existeUsuario.getCorreo(), "Activación de la contraseña", "En el transcurso de 1 hora se le activará la cuenta de usuario para poder acceder al sistema. Gracias. No intente responder a este correo.");
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('El usuario no está activado contacte con el administrador');");
                    out.println("location='index.jsp';");
                    out.println("</script>");
                }
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
        if (boton.equals("Administrador General")) {
            rolSeleccionado = "1";
            session.setAttribute("rolSeleccionado", rolSeleccionado);
            
            if (session.getAttribute("usuarioLog") != null) {
                u = (Usuario) session.getAttribute("usuarioLog");

                rolSeleccionado = (String) session.getAttribute("rolSeleccionado");
                String rol = "";

                if (rolSeleccionado.equals("1")) {
                    rol = "Adm General";
                }

                if (rolSeleccionado.equals("2")) {
                    rol = "Adm Aula";
                }

                if (rolSeleccionado.equals("3")) {
                    rol = "Profesor";
                }

                Bitacora.Bitacora.escribirBitacora("Inicia sesión el usuario", u.getCorreo(), rol);
            }
            
            response.sendRedirect("Vistas/Administrador_General/admin_general.jsp");
        }

        if (boton.equals("Administrador Aula")) {
            rolSeleccionado = "2";
            session.setAttribute("rolSeleccionado", rolSeleccionado);

            //Obtenemos todas las aulas de la BBDD
            ConexionEstatica.abrirBD();
            ArrayList<Aula> aulas = ConexionEstatica.obtenerAulas();
            ConexionEstatica.cerrarBD();

            //guardamos las aulas en sesion
            session.setAttribute("aulas", aulas);
            
            if (session.getAttribute("usuarioLog") != null) {
                u = (Usuario) session.getAttribute("usuarioLog");

                rolSeleccionado = (String) session.getAttribute("rolSeleccionado");
                String rol = "";

                if (rolSeleccionado.equals("1")) {
                    rol = "Adm General";
                }

                if (rolSeleccionado.equals("2")) {
                    rol = "Adm Aula";
                }

                if (rolSeleccionado.equals("3")) {
                    rol = "Profesor";
                }

                Bitacora.Bitacora.escribirBitacora("Inicia sesión el usuario", u.getCorreo(), rol);
            }
            

            response.sendRedirect("Vistas/Administrador_Aula/admin_aula.jsp");
        }

        if (boton.equals("Profesor")) {
            rolSeleccionado = "3";
            session.setAttribute("rolSeleccionado", rolSeleccionado);

            //Obtenemos todas las aulas de la BBDD
            ConexionEstatica.abrirBD();
            ArrayList<Aula> aulas = ConexionEstatica.obtenerAulas();
            ConexionEstatica.cerrarBD();
            
            if (session.getAttribute("usuarioLog") != null) {
                u = (Usuario) session.getAttribute("usuarioLog");

                rolSeleccionado = (String) session.getAttribute("rolSeleccionado");
                String rol = "";

                if (rolSeleccionado.equals("1")) {
                    rol = "Adm General";
                }

                if (rolSeleccionado.equals("2")) {
                    rol = "Adm Aula";
                }

                if (rolSeleccionado.equals("3")) {
                    rol = "Profesor";
                }

                Bitacora.Bitacora.escribirBitacora("Inicia sesión el usuario", u.getCorreo(), rol);
            }

            //guardamos las aulas en sesion
            session.setAttribute("aulas", aulas);

            response.sendRedirect("Vistas/Profesor/profesor.jsp");
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
            String rol = (String) session.getAttribute("rolSeleccionado");

            if (rol.equals("1")) {
                //Administrador General
                response.sendRedirect("Vistas/Administrador_Aula/admin_aula.jsp");
            }

            if (rol.equals("2")) {
                //Administrador Aula
                response.sendRedirect("Vistas/Administrador_Aula/admin_aula.jsp");
            }

            if (rol.equals("3")) {
                //Profesor
                response.sendRedirect("Vistas/Profesor/profesor.jsp");
            }
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
            }
            response.sendRedirect("Vistas/Profesor/profesor.jsp");
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

            }
            if (session.getAttribute("rolSeleccionado") != null) {
                String rol = (String) session.getAttribute("rolSeleccionado");

                if (rol.equals("3")) {
                    response.sendRedirect("Vistas/Profesor/profesor.jsp");
                }
                if (rol.equals("2")) {
                    response.sendRedirect("Vistas/Administrador_Aula/admin_aula.jsp");
                }
            }
        }

        if (boton.equals("Volver")) {
            response.sendRedirect("Vistas/rol_entrar.jsp");
        }

        if (boton.equals("Cerrar sesion")) {
            Usuario usuario = null;
            String rol = "";
            if (session.getAttribute("usuarioLog") != null) {
                usuario = (Usuario) session.getAttribute("usuarioLog");

                if (session.getAttribute("rolSeleccionado") != null) {
                    rolSeleccionado = (String) session.getAttribute("rolSeleccionado");

                    if (rolSeleccionado.equals("1")) {
                        rol = "Adm General";
                    }

                    if (rolSeleccionado.equals("2")) {
                        rol = "Adm Aula";
                    }

                    if (rolSeleccionado.equals("3")) {
                        rol = "Profesor";
                    }
                    if (rolSeleccionado.equals("4")) {
                        rol = "Ver perfil";
                        Bitacora.Bitacora.escribirBitacora("El usuario ha modificado su perfil ", usuario.getCorreo(), rol);
                    }

                    if (rolSeleccionado.equals("5")) {
                        rol = "Selecciona perfil";
                        Bitacora.Bitacora.escribirBitacora("El usuario selecciona perfil ", usuario.getCorreo(), rol);
                    }
                }

                Bitacora.Bitacora.escribirBitacora("El usuario ha cerrado sesión", usuario.getCorreo(), rol);
                session.invalidate();
                response.sendRedirect("index.jsp");
            }
        }

        if (boton.equals("Gestionar aula")) {
            response.sendRedirect("Vistas/Administrador_Aula/gestaula.jsp");
        }

        if (boton.equals("Gestionar franjas horarias")) {
            response.sendRedirect("Vistas/Administrador_Aula/gestfranjas.jsp");
        }

        if (boton.equals("                     Add Aula")) {
            String codAula = request.getParameter("nuevoCod");
            String descAula = request.getParameter("nuevaDesc");
            ConexionEstatica.abrirBD();
            ConexionEstatica.Insertar_Aula("aulas", codAula, descAula);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/Administrador_Aula/gestaula.jsp");
        }

        if (boton.equals("                     Modificar Aula")) {
            String codAula = (String) request.getParameter("codAula");
            String descAula = (String) request.getParameter("descripcion");
            ConexionEstatica.abrirBD();
            ConexionEstatica.Modificar_Aula("aulas", Integer.parseInt(codAula), descAula);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/Administrador_Aula/gestaula.jsp");
        }

        if (boton.equals("                     Eliminar Aula")) {
            String codAula = (String) request.getParameter("codAula");
            ConexionEstatica.abrirBD();
            ConexionEstatica.Borrar_Aula("aulas", Integer.parseInt(codAula));
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/Administrador_Aula/gestaula.jsp");
        }
        if (boton.equals("                     Modificar Franja")) {
            String idFranja = (String) request.getParameter("idFranja");
            String inicio = (String) request.getParameter("inicio");
            String fin = (String) request.getParameter("fin");
            ConexionEstatica.abrirBD();
            ConexionEstatica.Modificar_Franja("franjas", Integer.parseInt(idFranja), inicio, fin);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/Administrador_Aula/gestfranjas.jsp");
        }

        if (boton.equals("Gestionar Usuarios")) {
            response.sendRedirect("Vistas/Administrador_General/gestusuarios.jsp");
        }

        if (boton.equals("Ver Bitacora")) {
            response.sendRedirect("Vistas/Administrador_General/verBitacora.jsp");
        }

        if (boton.equals("                     Modificar Usuario")) {
            String dni = (String) request.getParameter("dni");
            String nombre = (String) request.getParameter("nombre");
            String apellidos = (String) request.getParameter("apellidos");
            String edad = (String) request.getParameter("edad");
            String activo = (String) request.getParameter("activo");
            String rol = (String) request.getParameter("idRol");

            ConexionEstatica.abrirBD();
            ConexionEstatica.Modificar_Usuario("usuarios", dni, nombre, apellidos, edad, activo);
            ConexionEstatica.Modificar_Rol("rol_usuarios", dni, rol);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/Administrador_General/gestusuarios.jsp");
        }

        if (boton.equals("                     Eliminar Usuario")) {
            String dni = (String) request.getParameter("dni");
            ConexionEstatica.abrirBD();
            ConexionEstatica.Borrar_Usuario("usuarios", dni);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/Administrador_General/gestusuarios.jsp");
        }

        if (boton.equals("                     Activar Usuario")) {
            String dni = (String) request.getParameter("dni");
            ConexionEstatica.abrirBD();
            ConexionEstatica.Activar_Usuario("usuarios", dni);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/Administrador_General/gestusuarios.jsp");
        }
        if (boton.equals("                     Desactivar Usuario")) {
            String dni = (String) request.getParameter("dni");
            ConexionEstatica.abrirBD();
            ConexionEstatica.Desactivar_Usuario("usuarios", dni);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("Vistas/Administrador_General/gestusuarios.jsp");
        }

        if (boton.equals("Ver Perfil")) {
            session.setAttribute("rolSeleccionado", "4");
            response.sendRedirect("Vistas/perfil_usuario.jsp");
        }

        if (boton.equals("Reservado")) {
            if (session.getAttribute("rolSeleccionado") != null) {
                rolSeleccionado = (String) session.getAttribute("rolSeleccionado");

                if (rolSeleccionado.equals("2")) {
                    response.sendRedirect("Vistas/Administrador_Aula/admin_aula.jsp");
                }

                if (rolSeleccionado.equals("3")) {
                    response.sendRedirect("Vistas/Profesor/profesor.jsp");
                }
            }
        }
    }
%>