<%-- 
    Document   : ofertas
    Created on : 26-ago-2012, 20:43:46
    Author     : Nicolas
--%>
<%@page import="java.util.Iterator"%>
<%@page import="Datos.ProductoDA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Classes.Producto"%>
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
            <ul class="thumbnails">
            <%    
            ArrayList<Producto> listaProductos = (ArrayList<Producto>) ProductoDA.getListaProductos(0);
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
                      
                      <p> <%if(producto.getDescripcion().length()>25){
                          out.println(producto.getDescripcion().substring(0, 25));
                      }
                      else{
                          out.println(producto.getDescripcion());
                      };
                      %>...</p>
                      <a href="product.jsp?producto=<%out.println(producto.getId());%>" class="btn btn-primary span1">Ver Más</a>
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