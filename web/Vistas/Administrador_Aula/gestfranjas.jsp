<%-- 
    Document   : gestfranjas
    Created on : 21-oct-2019, 10:42:04
    Author     : daw201
--%>

<%@page import="Conexion.ConexionEstatica"%>
<%@page import="Usuario.Franja"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Franjas Horarias</title>
        <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="../../js/reserva.js"></script>
        <link rel="stylesheet" type="text/css" href="../../css/reserva.css">
    </head>
    <body>
        <%
            ArrayList<Franja> franjas = null;

            ConexionEstatica.abrirBD();
            franjas = ConexionEstatica.obtenerFranjas();
            ConexionEstatica.cerrarBD();
        %>
        <h1>Gestión de Franjas Horarias</h1>
        <form name="frmGestFranjas" action="../../controlador.jsp" method="POST">
            <h1>Gestión de Franjas</h1>
            <table>
                <thead>
                <th>Id Franja</th>
                <th>Inicio</th>
                <th>Fin</th>
                </thead>
                <%
                    if (franjas.size() != 0) {

                        for (int i = 0; i < franjas.size(); i++) {
                            Franja al = franjas.get(i);
                %>
                <form name="frmFranjas" action="../../controlador.jsp" method="POST">
                    <form>
                        <tr>
                            <td><input type="text" class="readonly" name="idFranja" value="<%out.print(al.getIdFranja());%>" readonly></td>
                            <td><input type="text" name="inicio" id="inicio" value="<%out.print(al.getInicio());%>" required><span class="validity"></span></td>
                            <td><input type="text" name="fin" id="fin" value="<%out.print(al.getFin());%>" required><span class="validity"></span></td>
                            <td><input type="submit" name="boton" onclick="return validaCamposFranjas()" value="                     Modificar Franja" style="background:url(../../img/modify.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;" ></td>
                        </tr>
                    </form>
                    <%
                            }
                        }
                    %>
                </form>
            </table>
            <input type="submit" name="boton" value="Volver">
        </form>
    </body>
</html>
