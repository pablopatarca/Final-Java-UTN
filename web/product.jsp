<%-- 
    Document   : index
    Created on : 15-ago-2013, 20:32:55
    Author     : Pablo
--%>

<%@page import="Classes.Producto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.Producto_Datos"%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
         <jsp:include page="includes/scripts.jsp" flush="false" />
    </head>
    <body>
        <jsp:include page="includes/menu.jsp" flush="false" />
            <div class="container">
            <%    
            HttpSession sesion = request.getSession(false);
            
            Producto rs = Producto_Datos.getProducto(request.getParameter("producto"));
            %>
            <a class="thumbnail pull-right span3">
                <img class="image_description" src="images/<%out.println(rs.getImagen());%>" alt="">
            </a>
            <div class="well product_desc span6">
                <h2 class="span4"><%out.println(rs.getNombre());%></h2>
                <h2 class="span2" style="float:right; text-align: right;">$ <%out.println(rs.getPrecio());%></h2>
            </div>
            <div class="well product span6">
                <p>Descripción: <%out.println(rs.getDescripcion());%></p>
                <p>Presentación: <%out.println(rs.getPresentacion());%></p>  
            </div>
            <div class="product">

                    <%
                    if(sesion.getAttribute("cliente")!=null){
                        
                        if(!sesion.getAttribute("usuario").toString().equals("administrador")){
                    
                        %>
                        <div class="control-group span5" >
                            <form method="post" action="Carrito" class="form-horizontal">
                                <input type="hidden" name="producto_id" value="<%out.println(rs.getId());%>>" />
                                <input type="number" name="cantidad" min="0" placeholder="Cantidad" required />
                                <input type="submit" value="Agregar al carrito" class="control btn" />
                            </form>
                        </div>
                        <% }

                        %>
                        <%
                        if(sesion.getAttribute("usuario").toString().equals("administrador")){
                            %>
                            <div class="offset2 span3">
                                <a class="btn btn-large" href="editar_producto.jsp?producto=<%out.println(rs.getId());%>">Editar</a>
                                <a class="btn btn-large" href="eliminar_producto.jsp?producto=<%out.println(rs.getId());%>">Borrar</a>
                            </div>
                             <%
                        }
                    }
                    %>
            </div>
        </div>
                         
           <jsp:include page="includes/footer.jsp" flush="false" />
        </div>
    </body>
</html>
