<%-- 
    Document   : index
    Created on : 15-ago-2012, 20:32:55
    Author     : Nicolas
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Datos.ProductoDA"%>
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
        ResultSet rs = (ResultSet) ProductoDA.GetPromocionados();
        rs.beforeFirst();
        while (rs.next())
        {    %>          
           
                <li class="span4">
                <div class="thumbnail">
                  <div class="image_container">
                    <img src="images/<%out.println(rs.getObject("nombre_imagen"));%>" alt="">
                  </div>
                  <div class="caption">
                    <h3><%out.println(rs.getObject("nombre"));%></h3>
                  <%  if(rs.getObject("descripcion").toString().length() > 35) { 
                           out.println(rs.getObject("descripcion").toString().substring(0, 35)+"...");
                      }else{ 
                           out.println(rs.getObject("descripcion").toString());
                  } %>
                    <p><a href="product.jsp?producto=<%out.println(rs.getObject("id"));%>" class="btn btn-primary">Ver Más</a> <a href="#" class="btn">Agregar al carrito</a></p>
                  </div>
                </div>
              </li>
           
                    <%
        }  rs.close();   %>
         </ul>
        <div>
           <jsp:include page="includes/footer.jsp" flush="false" />
        </div>
    </body>
</html>
