<%-- 
    Document   : editarProducto
    Created on : 15-ago-2013, 20:32:55
    Author     : Pablo
--%>
<%@page import="Datos.Producto_Datos"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Producto"%>
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
        Producto producto = Producto_Datos.getProducto(request.getParameter("producto"));
            
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
            <form name="formReg" method="POST" action="actualizarProducto.jsp">
             <input type="hidden" name="enviado" value="1" />
             <table width="700px" border="0" >
                  <tr>
                     <td width="350"><input name="id" type="hidden" value="<% out.print(producto.getId()); %>" /></td>
                 </tr>
                 <tr>
                     <td width="350">Nombre:</td>
                     <td width="350"><input name="nombre" type="text" value="<% out.print(producto.getNombre()); %>" width="350px" /></td>
                 </tr>
                 <tr>
                     <td width="350">Descripcion:</td>
                     <td width="350"><input name="descripcion" type="text" value="<% out.print(producto.getDescripcion()); %>"  width="350px" /></td>
                 </tr>
                
                 <tr>
                     <td width="350">Presentacion: </td>
                     <td width="350"><input name="presentacion" type="text" value="<% out.print(producto.getPresentacion()); %>"  width="350px" /></td>
                 </tr>
                 <tr>
                     <td width="350">Precio: </td>
                     <td width="350"><input name="precio" type="text" value="<% out.print(producto.getPrecio()); %>"  width="350px" /></td>
                 </tr>
                  <tr>
                     <td width="350">En oferta: </td>
                     <td width="350">
                         <select name="en_oferta">
                             <% 
                             if(producto.getEnOferta() == 0){
                             %>
                             <option selected="true" value="0">No</option>
                             <option value="1">Si</option>
                             <%
                             }else{
                             %>
                             <option value="0">No</option>
                             <option selected="true" value="1">Si</option>
                             <%
                             }
                             %>
                         </select>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="2" align="center"><input name="Enviar" type="submit" value="Enviar" /></td>
                 </tr>
             </table>
            </form>
             <h3>Imagen del Producto:</h3>
                Seleccionar una imagen: <br />
                <form action="SubirImage" method="post"     enctype="multipart/form-data">
                        <input type="file" name="file" size="50" />
                        <input type="text" name="photoname" value="<% out.println(producto.getImagen()); %>" size="50" />
                        <input type="hidden" name="id" value="<% out.println(producto.getId()); %>" size="50" />
                        <br />
                        <input type="submit" value="Subir archivo" />
                </form>
        </div>
           
                   
       
           <jsp:include page="includes/footer.jsp" flush="false" />
        </div>
    </body>
</html>
