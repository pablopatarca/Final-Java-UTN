<%@page import="Classes.Producto"%>
<%@page import="Datos.Producto_Datos"%>
<% 
Producto producto = new Producto();
producto.setNombre(request.getParameter("nombre").toString());
producto.setDescripcion(request.getParameter("descripcion").toString());
producto.setPresentacion(request.getParameter("presentacion").toString());
producto.setId(Integer.parseInt(request.getParameter("id")));
producto.setPrecio(Double.parseDouble(request.getParameter("precio")));
producto.setEnOferta(Integer.parseInt(request.getParameter("en_oferta")));
Producto_Datos.editarProducto(producto);
response.sendRedirect("producto.jsp?producto="+request.getParameter("id").toString());
%>