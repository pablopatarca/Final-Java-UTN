<%-- 
    Document   : index
    Created on : 15-ago-2013, 20:32:55
    Author     : Pablo

    Lista todos los productos de la base de datos
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Producto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.Producto_Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catálogo de Productos</title>
         <jsp:include page="includes/scripts.jsp" flush="false" />
    </head>
    <body>
         <jsp:include page="includes/menu.jsp" flush="false" />
        <div class="well">
            <ul class="thumbnails">
            <%
            ArrayList<Producto> listaProductos = (ArrayList<Producto>) Producto_Datos.getListaProductos(0);
            Iterator<Producto> itr = listaProductos.iterator();
            while (itr.hasNext()) {
              Producto producto = itr.next();
            %>       
           <li class="span4">
                <div class="thumbnail">
                    <div class="image_container">
                      <img src="images/<%out.println(producto.getImagen());%>" alt="">
                    </div>
                    <div class="caption">
                      <h3><%out.println(producto.getNombre());%></h3>
                      
                      <p> <%
                      //Acorto la cantidad de caracteres de la descripción a 25 caracteres
                      if(producto.getDescripcion().length()>25){
                          out.println(producto.getDescripcion().substring(0, 25));
                      }
                      else{
                          out.println(producto.getDescripcion());
                      };
                      %>...</p>
                      <a href="producto.jsp?producto=<%out.println(producto.getId());%>" class="btn btn-primary">Ver Más</a>
                      <p class="" style="float: right;" > $ <%out.println(producto.getPrecio());%></p>
                    </div>
                </div>
            </li>
            <%
            }
            %>
            </ul>
        </div>
        <div>
           <jsp:include page="includes/footer.jsp" flush="false" />
        </div>
    </body>
</html>
