<%-- 
    Document   : carrito
    Created on : 08/09/2013, 16:09:38
    Author     : Pablo

    Muestra el carrito del usuario con sus productos
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Classes.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito de Compras</title>
        <jsp:include page="includes/scripts.jsp" flush="false" />
        <style>
        th{
            padding: 0 70px 0 0;
        }
        </style>
    </head>
    <body>
        <jsp:include page="includes/menu.jsp" flush="false" />
        
        <div class="container carrito">
            <h2>Mi Lista de Productos</h2>
            <div class="span10">
                <div class="span8" style="width: 720px;">
                    <table calss="table lista-productos">
                        <tr>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Cantidad</th>
                            <th>SubTotal</th>
                            <th></th>
                        </tr>
                    <%
                        HttpSession sesion = request.getSession(false);
                        ArrayList<Producto> listaProductos;
                        double total = 0;
                        double subtotal = 0;
                        if(sesion.getAttribute("listaProductos") != null ){
                            
                            //Agrego el producto a la lista de la sesion
                            listaProductos = (ArrayList<Producto>) sesion.getAttribute("listaProductos");

                            for( Producto producto : listaProductos){
                                out.println("<tr>");
                                out.println("<td>" + producto.getNombre() +"</td>");
                                out.println("<td>" + producto.getPrecio() +"</td>");
                                out.println("<td>" + producto.getCanidad() +"</td>");
                                subtotal = Math.rint((producto.getCanidad() * producto.getPrecio())*100)/100;
                                out.println("<td>" + subtotal +"</td>");
                                total = total + subtotal;
                                out.println("<td><a href='quitar.jsp?producto_id=" + producto.getId() + "' class='btn'><i class='icon-remove'></a></td>");
                                out.println("</tr>");
                            }
                        }
                    %>
                    </table>
                    <h3>Total : 
                    <%
                        out.println(total);
                    %>
                    </h3>
                </div>
                <form method="POST" action="ArmarPedido" class="form-horizontal">
                    <a href="index.jsp" class="btn span3"><i class="icon-arrow-left "></i> Volver</a>
                    <input type="submit" value="Realizar Pedido" class="btn span3"></input>
                </form>
                    <a href="limpiarCarrito.jsp" class="btn span3" style="margin-top: 10px; margin-bottom: 10px;"><i class="icon-remove "></i> limpiar carrito</a>
            </div>
        </div>
    </body>
</html>
