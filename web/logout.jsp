<%-- 
    Document   : success
    Created on : 16-ago-2012, 19:44:20
    Author     : Nicolas
--%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<html>
<head>
    <title>Successfully Login by JSP</title>
</head>

<body>
<%
    String username=(String)session.getAttribute("username");
    if(username!=null)
        {
            session.removeAttribute("username");   
        }
     else 
         {
             response.sendRedirect("index.jsp?messagge=Ud. ha sido correctamente deslogueado.");
        }
%> 
</body>
</html>