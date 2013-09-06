<%-- 
    Document   : clientes
    Created on : 05/11/2012, 18:54:20
    Author     : Benjamin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Cliente"%>
<%@page import="Datos.ClienteDA"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="includes/scripts.jsp" flush="false" />
    </head>
    <body>
        <jsp:include page="includes/menu.jsp" flush="false" />
        <div class="well">
            <h2>Clientes</h2>
            <table class="table">
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Usuario</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Email</th>
                    <th></th>
                </tr>
                <%

                ArrayList<Cliente> listaClientes =  ClienteDA.getClientes();

                for (Cliente cliente : listaClientes){
                    out.println("<tr>");
                    out.println("<td>" + cliente.getNombre() + "</td>");
                    out.println("<td>" + cliente.getApellido() + "</td>");
                    out.println("<td>" + cliente.getUsuario() + "</td>");
                    out.println("<td>" + cliente.getDireccion() + "</td>");
                    out.println("<td>" + cliente.getTelefono() + "</td>");
                    out.println("<td>" + cliente.getEmail() + "</td>");
                    out.println("<td><a href='eliminar_cliente.jsp?cliente_id=" + cliente.getId() + "' class='btn'>X</a></td>");
                    out.println("</tr>");
                }
                %>

            </table>
        </div>
        <div>
           <jsp:include page="includes/footer.jsp" flush="false" />
        </div>
    </body>
</html>
