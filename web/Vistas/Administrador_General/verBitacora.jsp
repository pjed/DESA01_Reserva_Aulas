<%-- 
    Document   : verBitacora
    Created on : 22-oct-2019, 8:51:43
    Author     : daw201
--%>

<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Bitácora Web</title>
    </head>
    <body>
        <h3>Contenido del archivo Bitácora</h3>
        <%
            String texto = "";

            FileReader fr = new FileReader("bitacora.txt");

            int valor = fr.read();
            while (valor != -1) {
                out.print((char) valor);
                valor = fr.read();
            }
            //Cerramos el stream
            fr.close();
        %>
    </body>
</html>
