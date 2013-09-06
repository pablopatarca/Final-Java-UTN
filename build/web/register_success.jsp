<%-- 
    Document   : register_success
    Created on : 23-ago-2012, 19:44:48
    Author     : Nicolas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito</title>
         <jsp:include page="includes/scripts.jsp" flush="false" />
    </head>
    <body>
         <jsp:include page="includes/menu.jsp" flush="false" />
         <div>
             <h1>Se ha registrado satisfactoriamente, <a href="index.jsp">volver al inicio</a>. </h1>
             <% response.sendRedirect("index.jsp"); %>
         </div>
         
         <jsp:include page="includes/footer.jsp" flush="false" />
        
    </body>
</html>
