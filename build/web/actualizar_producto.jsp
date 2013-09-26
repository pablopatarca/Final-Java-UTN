<%@page import="Classes.Producto"%>
<%@page import="Datos.Producto_Datos"%>
<% 
Producto producto = new Producto();
producto.setNombre(request.getParameter("nombre").toString());
producto.setDescripcion(request.getParameter("descripcion").toString());
producto.setPresentacion(request.getParameter("presentacion").toString());
producto.setId(Integer.parseInt(request.getParameter("id")));
producto.setPrecio(Double.parseDouble(request.getParameter("precio")));
producto.setEnOferta(request.getParameter("en_oferta").toString());
Producto_Datos.editarProducto(producto);
response.sendRedirect("product.jsp?producto="+request.getParameter("id").toString());
%>