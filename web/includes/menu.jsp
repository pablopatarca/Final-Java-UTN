<%@page import="Classes.Cliente"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>

<div class="navbar">
    <div class="well" style="padding: 5px;">
        <div class="logo-portada"><img style="width: 80px;float: left;" src="images/logo-portada.jpg"/></div>
        <div style="float: right; margin-top: 20px;">
        <%
            HttpSession sesion = request.getSession(false);
            if(sesion.getAttribute("cliente")!=null){
                %>
            <a href="editar.jsp"><i class="icon-user"></i>
                <%
                    out.println(sesion.getAttribute("usuario"));
            %>
            </a><a href="cerrar.jsp">Cerrar sesi&oacute;n</a></h3>
            <%
            }
            else{
            %>
        <form action="login.jsp" class=" form-inline" style="margin: 0 0 0 0">
          <input type="text" class="input-small" name="usuario" size="15" tabindex="1" maxlength="20" placeholder="Usuario" class="control">
          <input type="password" class="input-small" name="password" size="15" tabindex="2" maxlength="20" placeholder="Contraseña" class="control"/>
          <label class="checkbox">
            <input type="checkbox"> Recordar
          </label>
          <button type="submit" name="submit" class="btn">Entrar</button>
        </form>
            <%
            }     
            %>
        </div>
        <div style="clear: both"></div>
    </div>
</div>


<div class="navbar">
  <div class="navbar-inner">
    <a href="index.jsp"><div class="logo"></div></a>
    <div class="menu">
        <ul class="nav">
            <li>
                <a tabindex="-1" href="index.jsp"><i class="icon-home"></i> Inicio</a>
            </li>
            <%
            if(sesion.getAttribute("cliente")==null){
            %>
            <li>
                <a tabindex="-1" href="register.jsp"><i class="icon-pencil"></i> Registrarse</a>
            </li>
            <%
            }    
            %>
            <li>
                <a tabindex="-1" href="#" class="dropdown-toggle" data-toggle="dropdown" ><i class="icon-shopping-cart"></i> Productos</a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                    <li>
                        <a href="ofertas.jsp"><div class="titulos_submenu"> Ofertas</div></a>
                    </li>
                    <li>
                        <a href="catalogo.jsp"><div class="titulos_submenu"> Todos</div></a>
                    </li>
                </ul>
            </li>
            <%
            if(sesion.getAttribute("cliente")!=null){
                if(sesion.getAttribute("usuario").toString().equals("administrador")){
            %>
                <li><a tabindex="-1" href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i> Administrador</a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                        <li>
                            <a href="nuevoProducto.jsp"><div class="titulos_submenu">Nuevo Producto</div></a>
                        </li>
                        <li>
                            <a href="pedidosRealizados.jsp"><div class="titulos_submenu">Pedidos</div></a>
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
                   <a tabindex="-1" href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i> Usuario</a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                        <li>
                            <a href="carrito.jsp"><div class="titulos_submenu">Mi carrito</div></a>
                        </li>
                        <li>
                            <a href="editar.jsp"><div class="titulos_submenu">Mi información</div></a>
                        </li>
                        <li>
                            <a href="listaPedidos.jsp"><div class="titulos_submenu">Mis pedidos</div></a>
                        </li>
                    </ul>
               </li>
            <%
                }
            }
            %>
            <li>
                <a tabindex="-1" href="contacto.jsp"><i class="icon-envelope"></i> Contacto</a>
            </li>
            </ul>
        <ul class="nav" style="float: right">
            <li>
                <form action="index.jsp">
                    <input class="span2" type="text" name="string" placeholder="Buscar" style=" margin: 4px 0px 4px 0px;">
                    <button class="btn" type="submit" style="margin: 4px 0px 4px 0px;">Buscar</button>
                </form>
            </li>
        </ul>
    </div>
 </div>
</div>