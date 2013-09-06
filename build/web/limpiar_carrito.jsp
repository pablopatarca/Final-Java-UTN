<%-- 
    Document   : limpiar_carrito
    Created on : 23/10/2012, 11:20:20
    Author     : bengui
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Producto"%>
<%
    //HttpSession sesion = request.getSession();
    HttpSession sesion = request.getSession(false);
    ArrayList<Producto> listaProductos;
    if(sesion.getAttribute("listaProductos") != null ){
        //Agrego el producto a la lista de la sesion
        listaProductos = new ArrayList<Producto>();
        session.setAttribute("listaProductos", listaProductos);
        response.sendRedirect("carrito.jsp");
    }
%>