<%-- 
    Document   : index
    Created on : 15-ago-2013, 20:32:55
    Author     : Pablo
--%>
<%@page import="Classes.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
         <jsp:include page="includes/scripts.jsp" flush="false" />
    </head>
    <body>
         <jsp:include page="includes/menu.jsp" flush="false" />
    
        <%    
        HttpSession sesion = request.getSession(false);
        Cliente cliente = (Cliente)sesion.getAttribute("cliente");
        
        %>
        <%
        if(request.getAttribute("mensaje") != null){
            String message = request.getAttribute("mensaje").toString();
        
        %>
        
        <div class="message">
            <p><% out.println(message); %></p> 
        </div>
        
        <%
        }
        %>
        <div class="well">
            <form name="formReg" method="POST" action="Editar">
             <input type="hidden" name="enviado" value="1" />
             <table width="700px" border="0" >
                 <tr>
                     <td width="350">Nombre:</td>
                     <td width="350"><input name="nombre" type="text" value="<% out.println(cliente.getNombre()); %>" width="350px" required/></td>
                 </tr>
                 <tr>
                     <td width="350">Apellido:</td>
                     <td width="350"><input name="apellido" type="text" value="<% out.println(cliente.getApellido()); %>"  width="350px" required/></td>
                 </tr>
                 <tr>
                     <td width="350">Telefono:</td>
                     <td width="350"><input name="telefono" type="tel" value="<% out.println(cliente.getTelefono()); %>"  width="350px" required/></td>
                 </tr>
                 <tr>
                     <td width="350">Direccion: </td>
                     <td width="350"><input name="direccion" type="text" value="<% out.println(cliente.getDireccion()); %>"  width="350px" required/></td>
                 </tr>
                 <tr>
                     <td width="350">Email:</td>
                     <td width="350"><input name="email" type="email" value="<% out.println(cliente.getEmail()); %>"  width="350px" required/></td>
                 </tr>
                 <tr>
                     <td colspan="2" align="center"><input name="Enviar" type="submit" value="Enviar" /></td>
                 </tr>
             </table>
            </form>
            
        </div>
           
                   
       
           <jsp:include page="includes/footer.jsp" flush="false" />
        </div>
    </body>
</html>
