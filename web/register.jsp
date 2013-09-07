<%-- 
    Document   : register
    Created on : 16-ago-2012, 20:42:35
    Author     : Pablo
--%>

<%@page language="java" session="true" %>
<head>
    <title>Registrate!</title>
    <jsp:include page="includes/scripts.jsp" flush="false" />
</head>
<body>
    <jsp:include page="includes/menu.jsp" flush="false" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/validator.js"></script>
    <script>
        $(document).ready(function(){
           $('#submit-button').click(function(){
              var user_info = {
                  name                  : $('#nombre').val(),
                  lname                 : $('#apellido').val(),
                  phone                 : $('#telefono').val(),
                  email                 : $('#email').val(),
                  address               : $('#direccion').val(),
                  username              : $('#usuario').val(),
                  password              : $('#password').val(),
                  repeat_password       : $('#repeat_password').val()
              };
              
              if(validation(user_info)){
                  return true;
              }else{
                  alert('Datos de registro incorrectos');
                  return false;
              }
              
           }); 
        });
        
        function validation(user_info){
            var result = false;
            if(validateNotEmpty(user_info.name)){
                    if(validateNotEmpty(user_info.lname)){
                            if(validateNotEmpty(user_info.email)){
                                    if(validateEmail(user_info.email)){
                                            if(validateNotEmpty(user_info.address)){
                                                    if(validateNotEmpty(user_info.password)){
                                                            if(validateNotEmpty(user_info.repeat_password)){
                                                                if(validateNotEmpty(user_info.phone)){
                                                                    if(validateNotEmpty(user_info.username)){
                                                                        if(user_info.repeat_password == user_info.password){
                                                                            result = true;
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                    }	
                                            }
                                    }
                            }
                    }
            }

            return result;

}
    </script>
    <div>
    
        <div class="contenido_submenu"></div>
    
    </div>
    <div class="contenido well">
       
    
        <h1>Ingrese sus datos</h1>
    
        <form name="formReg" method="POST" action="Registro" class="form-horizontal">
            <input type="hidden" name="enviado" value="1" />
            <div class="control-group">
                <label class="control-label">Nombre</label>
                <input name="nombre" id="nombre" type="text" class="control" />
            </div>
            <div class="control-group">
                <label class="control-label">Apellido</label>
                <input name="apellido" id="apellido" type="text" class="control" />
            </div>
            <div class="control-group">
                <label class="control-label">Telefono</label>
                <input name="telefono" id="telefono" type="text" class="control" />
            </div>
            <div class="control-group">
                <label class="control-label">Email</label>
                <input name="email" id="email" type="text" class="control" />
            </div>
            <div class="control-group">
                <label class="control-label">Direccion</label>
                <input name="direccion" id="direccion" type="text" class="control" />
            </div>
            <div class="control-group">
                <label class="control-label">Nombre de usuario</label>
                <input name="usuario" id="usuario" type="text" class="control" />
            </div>
            <div class="control-group">
                <label class="control-label">Password</label>
                <input name="password" id="password" type="password" class="control" />
            </div>
            <div class="control-group">
                <label class="control-label">Repeat Password</label>
                <input name="repeat_password" id="repeat_password" type="password" class="control" />
            </div>
            <div class="control-group">
                <input type="submit" value="Registrarse" id="submit-button" class="btn control" />
            </div>
        </form>
    </div>
    <jsp:include page="includes/footer.jsp" flush="false" />
</body>
