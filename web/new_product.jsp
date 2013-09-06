<%-- 
    Document   : new_product.jsp
    Created on : 30-ago-2012, 22:20:25
    Author     : Nicolas
--%>


<%@page language="java" session="true" %>
<head>
    <title>Nuevo Producto</title>
    <jsp:include page="includes/scripts.jsp" flush="false" />
</head>
<body>
    <div>
    <jsp:include page="includes/menu.jsp" flush="false" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/validator.js"></script>
    <script>
        $(document).ready(function(){
           $('#submit-button').click(function(){
              var product_info = {
                  name                  : $('#nombre').val(),
                  description           : $('#descripcion').val(),
                  presentation          : $('#presentacion').val(),
                  price                 : $('#precio').val()
              };
              
              if(validation(product_info)){
                  return true;
              }else{
                  alert('Los datos del nuevo producto son incorrectos');
                  return false;
              }
              
           }); 
        });
        
        function validation(product_info){
            var result = false;
            if(validateNotEmpty(product_info.name)){
                    if(validateNotEmpty(product_info.description)){
                            if(validateNotEmpty(product_info.presentation)){
                                if(validateNotEmpty(product_info.price)){
                                   if(validateNumeric(product_info.price)){
                                            result = true;
                                    } 
                                }

                            }
                    }
            }

            return result;

    }
    </script>
    </div>
    <%
        if(request.getAttribute("mensaje")!=null){
            out.println("<div class='alert'><p>" + request.getAttribute("mensaje") + "</p></div>");
        }
    %>
    
    <div class="contenido well">
       
    
        <h1>Ingrese los datos</h1>
    
        <form name="formReg" method="POST" action="NuevoProducto">
            <input type="hidden" name="enviado" value="1" />
            <table width="700px" border="0" >
                <tr>
                    <td width="350">Nombre:</td>
                    <td width="350"><input name="nombre" id="nombre" type="text" width="350px" /></td>
                </tr>
                <tr>
                    <td width="350">Descripcion:</td>
                    <td width="350"><input name="descripcion" id="descripcion" type="text" width="350px" /></td>
                </tr>
                <tr>
                    <td width="350">Presentacion</td>
                    <td width="350"><input name="presentacion" id="presentacion" type="text" width="350px" /></td>
                </tr>
                <tr>
                    <td width="350">Precio</td>
                    <td width="350"><input name="precio" id="precio" type="text" width="350px" /></td>
                </tr>
                <tr>
                    <td width="350">Promocionado:</td>
                    <td width="350"><select name="en_oferta" type="text" width="350px">
                            <option value="0">No</option>
                            <option value="1">Si</option>
                        </select></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center"><input name="Enviar" type="submit" id="submit-button" value="Enviar" /></td>
                </tr>
            </table>
        </form>
    </div>
    <jsp:include page="includes/footer.jsp" flush="false" />
</body>
