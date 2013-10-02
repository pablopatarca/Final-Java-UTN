
<%@page import="Datos.Cliente_Datos"%>
<%@page import="Classes.Cliente"%>
<%
HttpSession sesion = request.getSession(false);
int id;
String usuario = request.getParameter ("usuario");
String password = request.getParameter ("password");

Cliente cliValido = Cliente_Datos.ValidarCliente(usuario, password);
if(cliValido!=null){
    usuario = cliValido.getUsuario();
    id = cliValido.getId();
    sesion.setAttribute("cliente",cliValido);
    sesion.setAttribute("usuario", usuario);
}
response.sendRedirect("index.jsp");  
    
%>