<%-- 
    Document   : eliminarProducto.jsp
    Created on : 19-05-2013, 20:42:10
    Author     : Pablo
--%>
<%@page import="Classes.Producto"%>
<%@page import="Datos.Producto_Datos"%>

<% 
Producto_Datos.eliminarProducto(request.getParameter("producto"));
response.sendRedirect("index.jsp");
%>