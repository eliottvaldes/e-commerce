<%-- 
    Document   : help
    Created on : 2/12/2020, 01:17:51 AM
    Author     : Eliot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String usuario="";
        HttpSession sesionOk = request.getSession();
        
        if(sesionOk.getAttribute("usuario")== null){  
        //Si la sesión no es valida
    %>
    <jsp:forward page="help.html">
        <jsp:param name="error" value="Es obligatorio identificarse"/>
    </jsp:forward>
    <% 
        }else{
        //Si la sesion si es valida
            usuario = (String)sesionOk.getAttribute("usuario");
        }
    %>
    
    
    
    
    <!-- Pre Header -->
    <div id="pre-header" class="login-menu">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul>
              <li class="cart"><a role="button" class="button producto" href="favoritos.jsp"> <i class="fa fa-heart"></i></a></li> 
              <li class="cart"><a role="button" class="button producto" href="dis_cart.jsp"> <i class="fa fa-shopping-cart"></i></a></li> 
              <li ><a href="LogOut">  Salir  <i class="fa fa-sign-out"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
        <a class="navbar-brand"><img src="assets/images/header-logo.jpg" height="48px" width="170px" alt="" position=center;></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="indexwl.jsp" id="i"><i class="fa fa-home"></i> Inicio
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="products.jsp"><i class="fa fa-tags"></i> Productos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html"><i class="fa fa-users"></i> Acerca de nosotros</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.html" id="ii"><i class="fa fa-envelope"></i> Contáctanos</a>
            </li>
          </ul>
        </div>
      </div>
    </nav> 
    
    
    
    
    </body>
</html>
