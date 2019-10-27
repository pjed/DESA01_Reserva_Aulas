<%-- 
    Document   : verBitacora
    Created on : 22-oct-2019, 8:51:43
    Author     : daw201
--%>

<%@page import="Usuario.Bitacora"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Bitácora Web</title>
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
    </head>
    <body>
        <h3>Contenido del archivo Bitácora</h3>
        <%
            ArrayList<Bitacora> logBitacora = null;

            Conexion.ConexionEstatica.abrirBD();
            logBitacora = Conexion.ConexionEstatica.obtenerBitacora();
            Conexion.ConexionEstatica.cerrarBD();
            /*Scanner sc = new Scanner(new File("bitacora.txt"));
            while (sc.hasNextLine()) {
                out.println(sc.nextLine()+"<br>");
            }
            sc.close();*/

        %>
        <form name="frmBitacoraLog" action="../../controlador.jsp" method="POST">
            <table>
                <thead>
                <th class="span_header">Acción</th>
                <th class="span_header">Fecha y Hora de la acción</th>
                <th class="span_header">Correo</th>
                <th class="span_header">Rol</th>
                </thead>

                <%                
                    if(logBitacora.size()>0){
                    for (int idx = 0; idx < logBitacora.size(); idx++) {
                        Bitacora bi = logBitacora.get(idx);

                %>
                <tr>
                    <td><span ><%out.print(bi.getAccion());%></span></td>
                    <td class="td_span_bitacora"><span><%out.print(bi.getFyh());%></span></td>
                    <td class="td_span_bitacora"><span><%out.print(bi.getCorreo());%></span></td>
                    <td><span><%out.print(bi.getRol());%></span></td>
                </tr>
                <%                    }
                        
                    }
                %>
            </table>
        </form>
    </body>
</html>
