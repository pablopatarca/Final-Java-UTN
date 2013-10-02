<%-- 
    Document   : quitar
    Created on : 08/06/2012, 17:50:41
    Author     : Pablo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    HttpSession sesion = request.getSession(false);
    ArrayList<Producto> listaProductos;
    int producto_id = Integer.parseInt(request.getParameter("producto_id"));
    if(sesion.getAttribute("listaProductos") != null ){
        //Agrego el producto a la lista de la sesion
        listaProductos = (ArrayList<Producto>) sesion.getAttribute("listaProductos");

        for( Producto producto : listaProductos){
            if(producto.getId() == producto_id){
                listaProductos.remove(producto);
                break;
            }
        }
        response.sendRedirect("carrito.jsp");
    }



%>
