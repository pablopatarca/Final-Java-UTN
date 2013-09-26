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
    </head>
    <body>
        <jsp:include page="includes/menu.jsp" flush="false" />
        <h1>Mi Carrito</h1>
        
        <div class="container carrito">
            <div class="span10">
                <a href="limpiar_carrito.jsp" class="btn">limpiar carrito</a>
                <div class="span8">
                    <table calss="table">
                        <tr>
                            <th>Nombre</th>
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
                                out.println("<td>" + producto.getCanidad() +"</td>");
                                subtotal = Math.rint((producto.getCanidad() * producto.getPrecio())*100)/100;
                                out.println("<td>" + subtotal +"</td>");
                                total =+ subtotal;
                                out.println("<td><a href='quitar.jsp?producto_id=" + producto.getId() + "' class='btn'>X</a></td>");
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
                <a href="index.jsp" class="btn span3">Volver</a>
            
                <form method="post" action="ArmarPedido" class="form-horizontal">
                    <input type="submit" value="Realizar Pedido" class="btn span3" />
                </form>
            </div>
        </div>
    </body>
</html>
