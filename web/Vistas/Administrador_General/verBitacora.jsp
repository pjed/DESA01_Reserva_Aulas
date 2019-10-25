<%-- 
    Document   : verBitacora
    Created on : 22-oct-2019, 8:51:43
    Author     : daw201
--%>

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
    </head>
    <body>
        <h3>Contenido del archivo Bitácora</h3>
        <%
            Scanner sc = new Scanner(new File("bitacora.txt"));
            while (sc.hasNextLine()) {
                out.println(sc.nextLine()+"<br>");
            }
            sc.close();
        %>
    </body>
</html>
