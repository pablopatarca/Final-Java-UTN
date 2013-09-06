<%@page import="Classes.Cliente"%>
<%@page import="Classes.Cliente"%>
<%@page language="java" session="true" %>
<head>
    <title>Conctactate con nosotros</title>
    
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
              var user_info = {
                  name                  : $('#nombreyapellido').val(),
                  phone                 : $('#telefono').val(),
                  email                 : $('#mail').val(),
                  subject               : $('#asunto').val(),
                  message              : $('#mensaje').val()
              };
              
              if(validation(user_info)){
                  return true;
              }else{
                  alert('Datos incorrectos');
                  return false;
              }
              
           }); 
        });
        
        function validation(user_info){
            var result = false;
            if(validateNotEmpty(user_info.name)){
                if(validateNotEmpty(user_info.phone)){
                    if(validateNotEmpty(user_info.email)){
                        if(validateNotEmpty(user_info.subject)){
                            if(validateNotEmpty(user_info.message)){
                                result = true;
                            }
                        }
                    }
                }
            }

            return result;

        }
    </script>
    <div class="contenido well">
     <h1>Contacto</h1>
           <% HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("cliente")!=null){
                Cliente cliente = (Cliente)sesion.getAttribute("cliente");
            %>
            <form method="POST" action="index.jsp" class="form-horizontal">
                <input type="hidden" name="enviado" value="1" />
                <div class="control-group">
                    <label class="control-label">Nombre y Apellido</label>
                    <div class="controls">
                        <input name="nombreyapellido" id="nombreyapellido" type="text" value="<% out.print(cliente.getNombre() + " " + cliente.getApellido());%>" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">e-mail</label>
                    <div class="controls">
                        <input name="mail" id="mail" type="text" value="<% out.print(cliente.getEmail());%>" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Telefono</label>
                    <div class="controls">
                        <input name="telefono" id="telefono" type="text" value="<% out.print(cliente.getTelefono());%>" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" >Asunto</label>
                    <div class="controls">
                        <input name="asunto" id="asunto" type="text" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Mensaje</label>
                    <textarea name="mensaje" id="mensaje" cols="60" rows="5">&nbsp;</textarea>
                </div>
                <div class="control-group">
                    <input name="Enviar" value="Enviar" id="submit-button" type="submit" />
                </div>
        </form>

        <%} else {%>
        
            <form method="POST" action="index.jsp" class="form-horizontal">
                <input type="hidden" name="enviado" value="1" />
                <div class="control-group">
                    <label class="control-label">Nombre y Apellido</label>
                    <div class="controls">
                        <input name="nombreyapellido" id="nombreyapellido" type="text" value="" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">e-mail</label>
                    <div class="controls">
                        <input name="mail" id="mail" type="text" value="" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Telefono</label>
                    <div class="controls">
                        <input name="telefono" id="telefono" type="text" value="" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Asunto</label>
                    <div class="controls">
                        <input name="asunto" id="asunto" type="text" />
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Mensaje</label>
                    <textarea name="mensaje" id="mensaje" ols="60" rows="5">&nbsp;</textarea>
                </div>
                <div class="control-group">
                    <input name="Enviar" value="Enviar" id="submit-button" type="submit" />
                </div>
        </form>


        <%}


        %>
        
    </div>
    <jsp:include page="includes/footer.jsp" flush="false" />
</body>


