<%-- 
    Document   : eliminar_producto.jsp
    Created on : 19-nov-2012, 20:42:10
    Author     : Nicolas
--%>
<%@page import="Classes.Producto"%>
<%@page import="Datos.Producto_Datos"%>

<% 
Producto_Datos.eliminarProducto(request.getParameter("id"));
response.sendRedirect("producto.jsp?producto="+request.getParameter("id").toString());
%>