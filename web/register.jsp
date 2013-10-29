<%-- 
    Document   : register
    Created on : 16/06/2013, 20:42:35
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
function validate(form){

	if(form.nombre.value.length == 0) { //comprueba que no esté vacío
		form.nombre.focus();   
		alert('No has escrito tu nombre'); 
		return false;
	}

	if(form.apellido.value.length == 0) { //comprueba que no esté vacío
		form.apellido.focus();   
		alert('No has escrito tu apellido'); 
		return false;
	}

	if(form.email.value.length == 0) { //comprueba que no esté vacío
		form.email.focus();
		alert('No has escrito tu Email');
		return false;
	}else{

		if( !(/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+/.test(form.email.value)) ) { //comprueba que sea un email válido
			form.email.focus();
			alert('No es un Email válido');
	 		return false;
		}
		
	}
        
        if(form.telefono.value.length == 0) { //comprueba que no esté vacío
		form.telefono.focus();   
		alert('No has escrito tu nombre de usuario'); 
		return false;
	}

	if(form.usuario.value.length == 0) { //comprueba que no esté vacío
		form.usuario.focus();   
		alert('No has escrito tu nombre de usuario'); 
		return false;
	}

	if (form.password.value.length < 4) { //comprueba que no sea corta

		if(form.password.value.length == 0) { //comprueba que no esté vacío
			form.password.focus();
			alert('No has escrito tu contraseña'); 
			return false;
		}else{
			form.password.focus();
			alert('La contraseña es demasiado corta');
			return false;
		}

	}

	if(form.password.value != form.repeat_password.value) {
		form.password.focus();            //comprueba que sean iguales
		alert('Las contraseñas no coinciden');
		return false;
	}

	return true;

}
    </script>
    <div>
    
        <div class="contenido_submenu"></div>
    
    </div>
    <div class="contenido well">
       
    
        <h1>Ingrese sus datos</h1>
    
        <form name="formReg" method="POST" action="Registro" class="form-horizontal" onsubmit="return validate(this);">
            <input type="hidden" name="enviado" value="1" />
            <div class="control-group">
                <label class="control-label">Nombre</label>
                <div class="controls">
                    <input name="nombre" id="nombre" type="text" class="control" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Apellido</label>
                <div class="controls">
                    <input name="apellido" id="apellido" type="text" class="control" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Telefono</label>
                <div class="controls">
                    <input name="telefono" id="telefono" type="text" class="control" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Email</label>
                <div class="controls">
                    <input name="email" id="email" type="text" class="control" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Direccion</label>
                <div class="controls">
                    <input name="direccion" id="direccion" type="text" class="control" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Nombre de usuario</label>
                <div class="controls">
                    <input name="usuario" id="usuario" type="text" class="control" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Password</label>
                <div class="controls">
                    <input name="password" id="password" type="password" class="control" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Repeat Password</label>
                <div class="controls">
                    <input name="repeat_password" id="repeat_password" type="password" class="control" />
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <input type="submit" value="Registrarse" id="submit-button" class="btn control" />
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="includes/footer.jsp" flush="false" />
</body>
