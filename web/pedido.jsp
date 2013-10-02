<%-- 
    Document   : pedido
    Created on : 23-ago-2013, 10:56:58
    Author     : Pablo
--%>

<%@page import="Classes.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido</title>
        <jsp:include page="includes/scripts.jsp" flush="false" />
    </head>
    <body>
        <jsp:include page="includes/menu.jsp" flush="false" />
        <div class="well">
            <div class="container">
                <h3>Pedido</h3>
                <table calss="table-striped">
                    <tr>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>SubTotal</th>
                    </tr>
                    <%
                        HttpSession sesion = request.getSession(false);
                        ArrayList<Producto> listaProductos;
                        Pedido pedido;
                        if(sesion.getAttribute("pedido") != null ){
                            //Agrego el producto a la lista de la sesion
                            pedido = (Pedido) sesion.getAttribute("pedido");
                            listaProductos = pedido.getListaProductos();

                            for( Producto producto : listaProductos){
                                out.println("<tr>");
                                out.println("<td>" + producto.getNombre() +"</td>");
                                out.println("<td>" + producto.getCanidad() +"</td>");
                                out.println("<td>" + (Math.rint((producto.getCanidad() * producto.getPrecio())*100)/100)  +"</td>");
                                out.println("</tr>");
                            }
                        }
                    %>
                </table>
                <%

                if(sesion.getAttribute("pedido") != null ){

                    pedido = (Pedido) sesion.getAttribute("pedido");

                    out.println("<p>Total: ");
                    out.println(Math.rint(pedido.getTotal()*100)/100);
                    out.println("</p>");
                }
                %>
                <a href="index.jsp" class="btn span3">Pantalla inicial</a>
            </div>
        </div>
        
        
        
    </body>
</html>
