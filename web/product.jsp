<%-- 
    Document   : index
    Created on : 15-ago-2012, 20:32:55
    Author     : Nicolas
--%>

<%@page import="Classes.Producto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.ProductoDA"%>
<%//@page contentType="text/html" pageEncoding="UTF-8"%>
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
            
            Producto rs = ProductoDA.getProducto(request.getParameter("producto"));
            %>   
            <a class="thumbnail pull-right span3">
                <img class="image_description" src="images/<%out.println(rs.getImagen());%>" alt="">
            </a>
            <div class="well product_desc span6">
                <h2 class="span4"><%out.println(rs.getNombre());%></h2>
                <h2 class="span2" style="float:right; text-align: right;">$ <%out.println(rs.getPrecio());%></h2>
            </div>
            <div class="well product span6">
                <p><%out.println(rs.getDescripcion());%></p>
                <p><%out.println(rs.getPresentacion());%></p>  
            </div>
            <div class="product">

                    <%
                    if(sesion.getAttribute("cliente")!=null){
                        
                        if(!sesion.getAttribute("usuario").toString().equals("administrador")){
                    
                        %>
                        <div class="control-group span5" >
                            <form method="post" action="Carrito" class="form-horizontal span3">
                                <input type="hidden" name="producto_id" value="<%out.println(rs.getId());%>>" />
                                <select name="cantidad" class="control span1">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                                <input type="submit" value="Agregar al carrito" class="control btn" />
                            </form>
                        </div>
                        <!--
                        <div class="offset2 span3">
                            <a class="btn btn-large">Editar</a>
                            <a class="btn btn-large">Borrar</a>
                        </div>
                        -->
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
