<%@page import="Datos.ClienteDA"%>
<%
    HttpSession sesion = request.getSession(false);

    int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
    ClienteDA.eliminarCliente(cliente_id);
    response.sendRedirect("clientes.jsp");
%>