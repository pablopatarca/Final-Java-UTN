<%-- 
    Document   : pedidos_realizados
    Created on : 05/11/2012, 20:49:07
    Author     : Benjamin
--%>

<%@page import="Classes.Pedido"%>
<%@page import="Datos.Pedido_Datos"%>
<%@page import="Datos.Cliente_Datos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Pedidos</title>
        <jsp:include page="includes/scripts.jsp" flush="false" />
    </head>
    <body>
        <jsp:include page="includes/menu.jsp" flush="false" />
        <div class="well">
            <div class="container">
            <h2>Lista de Pedidos</h2>
            <%
            ArrayList<Cliente> listaClientes =  Cliente_Datos.getClientes();

                    for (Cliente cliente : listaClientes){

                        out.println("<h3>" + cliente.getNombre() + " " + cliente.getApellido() + "</h3>");
                        out.println("<h4>" + cliente.getId() + "</h4>");

                        ArrayList<Pedido> listaPedidos = Pedido_Datos.getPedidos(cliente.getId());
                        out.println("<table class='table'>");
                        for(Pedido pedido : listaPedidos){

                            out.print("<tr>");
                            out.print("<td>" + pedido.getFecha() + "</td>");
                            out.print("<td>" + pedido.getId() + "</td>");
                            out.print("<td>" + pedido.getTotal() + "</td>");
                            out.print("</tr>");

                        }
                        out.println("</table>");
                        out.println("<br>");
                    }
            %>
            </div>
        </div>
        <jsp:include page="includes/footer.jsp" flush="false" />
    </body>
     
</html>
