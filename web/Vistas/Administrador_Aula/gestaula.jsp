<%-- 
    Document   : gestaula
    Created on : 21-oct-2019, 10:40:56
    Author     : daw201
--%>

<%@page import="Conexion.ConexionEstatica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Usuario.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de Aulas</title>
        <script type="text/javascript" src="../../js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="../../js/reserva.js"></script>
    </head>
    <body>
        <%
            ConexionEstatica.abrirBD();
            ArrayList<Aula> aulas = ConexionEstatica.obtenerAulas();
            ConexionEstatica.cerrarBD();
        %>
        <form name="frmGestAulas" action="../../controlador.jsp" method="POST">
            <h1>Gestión de Aulas</h1>
            <table>
                <thead>
                <th>NOMBRE</th>
                <th>DESCRIPCIÓN</th>
                </thead>
                <%
                    if (aulas.size() != 0) {

                        for (int i = 0; i < aulas.size(); i++) {
                            Aula al = aulas.get(i);
                %>
                <form name="frmAulas" action="../../controlador.jsp" method="POST">
                    <form>
                        <tr>
                            <td><input type="text" name="codAula" id="codAula" value="<%out.print(al.getCodAula());%>"></td>
                            <td><input type="text" name="descripcion" id="descripcion" value="<%out.print(al.getDescripcion());%>"></td>
                            <td><input type="submit" name="boton" value="                     Modificar Aula" style="background:url(../../img/modify.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                            <td><input type="submit" name="boton" value="                     Eliminar Aula" style="background:url(../../img/delete.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                        </tr>
                    </form>
                    <%
                            }
                        }
                    %>
                    <tr>
                        <td><input type="text" name="nuevoCod" value=""></td>
                        <td><input type="text" name="nuevaDesc" value=""></td>
                        <td><input type="submit" name="boton" onclick="return validaCamposAula()" value="                     Add Aula" style="background:url(../../img/add.png) no-repeat; border: none; background-position: center; width: 25px; height: 25px;"></td>
                        <td></td>
                    </tr>
                </form>
            </table>
            <input type="submit" name="boton" value="Volver">
        </form>
    </body>
</html>
