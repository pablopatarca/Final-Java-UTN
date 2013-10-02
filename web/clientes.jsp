<%-- 
    Document   : clientes
    Created on : 05/05/2013, 18:54:20
    Author     : Pablo

    Lista los clientes
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Cliente"%>
<%@page import="Datos.Cliente_Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Clientes</title>
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

                ArrayList<Cliente> listaClientes =  Cliente_Datos.getClientes();

                for (Cliente cliente : listaClientes){
                    out.println("<tr>");
                    out.println("<td>" + cliente.getNombre() + "</td>");
                    out.println("<td>" + cliente.getApellido() + "</td>");
                    out.println("<td>" + cliente.getUsuario() + "</td>");
                    out.println("<td>" + cliente.getDireccion() + "</td>");
                    out.println("<td>" + cliente.getTelefono() + "</td>");
                    out.println("<td>" + cliente.getEmail() + "</td>");
                    out.println("<td><a href='eliminarCliente.jsp?cliente_id=" + cliente.getId() + "' class='btn'>X</a></td>");
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
