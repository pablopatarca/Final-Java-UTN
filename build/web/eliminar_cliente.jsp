<%@page import="Datos.Cliente_Datos"%>
<%
    HttpSession sesion = request.getSession(false);

    int cliente_id = Integer.parseInt(request.getParameter("cliente_id"));
    Cliente_Datos.eliminarCliente(cliente_id);
    response.sendRedirect("clientes.jsp");
%>