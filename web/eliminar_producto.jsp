<%-- 
    Document   : eliminar_producto.jsp
    Created on : 19-nov-2012, 20:42:10
    Author     : Nicolas
--%>
<%@page import="Classes.Producto"%>
<%@page import="Datos.ProductoDA"%>

<% 
ProductoDA.eliminarProducto(request.getParameter("id"));
response.sendRedirect("product.jsp?producto="+request.getParameter("id").toString());
%>