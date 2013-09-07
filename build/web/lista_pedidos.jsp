<%-- 
    Document   : lista_pedidos
    Created on : 25/10/2012, 09:56:21
    Author     : bengui
--%>

<%@page import="com.sun.faces.facelets.tag.jstl.core.ForEachHandler"%>
<%@page import="Classes.Pedido"%>
<%@page import="Datos.Pedido_Datos"%>
<%@page import="Classes.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
        <jsp:include page="includes/scripts.jsp" flush="false" />
    </head>
    <body>
        <jsp:include page="includes/menu.jsp" flush="false" />
        <div class="container">
            <div class="well span8">
                <table class="table">
                    <tr>
                        <th>Fecha</th>
                        <th>ID</th>
                        <th>Total</th>
                    </tr>
                            
                <%
                    //HttpSession sesion = request.getSession();
                    HttpSession sesion = request.getSession(false);
                    if(sesion.getAttribute("cliente") != null ){
                        Cliente cliente = (Cliente)sesion.getAttribute("cliente");
                        int cliente_id = cliente.getId();
                        ArrayList<Pedido> listaPedidos = Pedido_Datos.getPedidos(cliente_id);
                        for (Pedido pedido : listaPedidos){
                            out.print("<tr>");
                                out.print("<td>" + pedido.getFecha() + "</td>");
                                out.print("<td>" + pedido.getId() + "</td>");
                                out.print("<td>" + pedido.getTotal() + "</td>");
                            out.print("</tr>");
                        }
                    }
                %>
                </table>
            </div>
         
        </div>
        <jsp:include page="includes/footer.jsp" flush="false" />
    </body>
</html>
