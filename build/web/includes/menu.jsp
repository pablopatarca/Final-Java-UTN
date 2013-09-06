<%@page import="Classes.Cliente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="true"%>
       
<div class="header well">
    <div class="logo">
        <a href="index.jsp"><img src="includes/ciguena-bebe.jpg"></a>
    </div>
    <div class="offset1 span5">
        <h1>Verte Crecer</h1>
    </div>
        <div class="span6 pull-right">
            <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("cliente")!=null){
                    out.println("Bienvenido "+sesion.getAttribute("usuario"));
            %>
            <br />
            <a href="cerrar.jsp">Cerrar la sesi&oacute;n</a></h3>
            <%
            }
            else{
            %>

            <form action="login.jsp" method="post" name="formLogin" class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">Usuario:</label>
                    <input type="text"  name="usuario" size="15" tabindex="1" maxlength="20" class="control"/>
                </div>
                <div class="control-group">
                    <label class="control-label">Password:</label>
                    <input type="password" name="password" size="15" tabindex="2" maxlength="20" class="control"/>
                </div>
                <div class="control-group pull-right">
                    <input type="submit" name="Submit" value="Ingresar" tabindex="3" style="text-align:center" class="btn control"/>
                </div>
            </form>
            <%
            }     
            %>

    </div>
</div>
<div class="navbar">
  <div class="navbar-inner">
    <a href="index.jsp"><div class="logo"></div></a>
    <div class="menu">
        <ul class="nav">
            <li>
                <a tabindex="-1" href="contacto.jsp">Contacto</a>
            </li>
            <%
            if(sesion.getAttribute("cliente")==null){
            %>
            <li>
                <a tabindex="-1" href="register.jsp">Registrarse</a>
            </li>
            <%
            }    
            %>
            <li>
                <a tabindex="-1" href="#" class="dropdown-toggle" data-toggle="dropdown" >Productos</a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                    <li>
                        <a href="ofertas.jsp"><div class="titulos_submenu">Ofertas</div></a>
                    </li>
                    <!--
                    <li>
                        <a href="promocionados.jsp"><div class="titulos_submenu">Promocionados</div></a>
                    </li>
                    -->
                    <li>
                        <a href="catalogo.jsp"><div class="titulos_submenu">Lista Completa</div></a>
                    </li>
                </ul>
            </li>
            <%
            if(sesion.getAttribute("cliente")!=null){
                if(sesion.getAttribute("usuario").toString().equals("administrador")){
            %>
                <li><a tabindex="-1" href="#" class="dropdown-toggle" data-toggle="dropdown">Administrador</a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                        <li>
                            <a href="new_product.jsp"><div class="titulos_submenu">Nuevo Producto</div></a>
                        </li>
                        <li>
                            <a href="pedidos_realizados.jsp"><div class="titulos_submenu">Pedidos</div></a>
                        </li>
                        <li>
                            <a href="clientes.jsp"><div class="titulos_submenu">Clientes</div></a>
                        </li>
                    </ul>
               </li>
            <%
                }else{   
            %>
               <li>
                   <a tabindex="-1" href="#" class="dropdown-toggle" data-toggle="dropdown">Usuario</a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                        <li>
                            <a href="carrito.jsp"><div class="titulos_submenu">Mi carrito</div></a>
                        </li>
                        <li>
                            <a href="editar.jsp"><div class="titulos_submenu">Mi información</div></a>
                        </li>
                        <li>
                            <a href="lista_pedidos.jsp"><div class="titulos_submenu">Mis pedidos</div></a>
                        </li>
                    </ul>
               </li>
            <%
                }
            }
            %>
        </ul>
    </div>
 </div>
</div>