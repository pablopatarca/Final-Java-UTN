<%-- 
    Document   : cerrar
    Created on : 07/09/2013, 19:45:55
    Author     : Pablo

    Cierra la session y retorna al index
--%>

<%
    HttpSession sesionUsu = request.getSession(true);
    sesionUsu.invalidate();
    response.sendRedirect("index.jsp");

%>