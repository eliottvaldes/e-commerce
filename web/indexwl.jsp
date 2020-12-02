<%-- 
    Document   : indexwl.jsp
    Created on : 1/06/2020, 01:11:37 PM
    Author     : Eliot
--%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" language="java" import="java.util.*" session="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
    <link rel="icon" type="image/png" href="assets/images/icon.png" sizes="192x192">
    <title>The World Of Creations- Tienda Online</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/tooplate-main.css">
    <link rel="stylesheet" href="assets/css/owl.css">

  </head>

  <body>
    <!--Codigo java para comprobar la sesión-->
    <%
        String usuario="";
        HttpSession sesionOk = request.getSession();        
        
        if(sesionOk.getAttribute("usuario")== null){  
        //Si la sesión no es valida
    %>
    <jsp:forward page="login.jsp">
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
                <li class="float-left"><h5>¡Bienvenido <%=usuario%>!</h5> </li>              
                <li><a role="button" class="button producto" href="favoritos.jsp"> <i class="fa fa-heart"></i></a></li> 
                <li><a role="button" class="button producto" href="dis_cart.jsp"> <i class="fa fa-shopping-cart"></i></a></li> 
                <li><a href="LogOut">Salir<i class="fa fa-sign-out"></i></a>
                </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
        <a class="navbar-brand"><img src="assets/images/header-logo.jpg" height="48px" width="170px" alt=""></a>
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

    <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="banner">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="caption">
              <h2>Personalizando tu mundo</h2>
              <div class="line-dec"></div>
              <p align="justify">Somos una empresa dedicada al diseño, elaboración y entrega de distintos productos personalizables con el fin de traer a la realidad <strong>cualquier diseño que puedas imaginar</strong> y llevarlo al alcance de tus manos.
              <br><br>Nos ubicamos en la CDMX y contamos con envíos nacionales e internacionales.</p>
              <div class="main-button">
               <a href="products.jsp">Ordena Ahora</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->

    <!-- Featured Starts Here -->
    <div class="featured-items">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1>Productos destacados</h1>
            </div>
          </div>
          <div class="col-md-12">
            <div class="owl-carousel owl-theme">
                <%
                            String DRIVER = "com.mysql.jdbc.Driver";
                            Class.forName(DRIVER).newInstance();
                            Connection cn = null;
                            Statement st = null;
                            ResultSet rs = null;
                            try{
                                String url = "jdbc:mysql://localhost:3306/carrito?user=root&password=n0m3l0";
                                int i = 1;
                                cn = DriverManager.getConnection(url);

                                System.out.println("Sihubobase");

                                st = cn.createStatement();
                                String q = "Select * from articulo order by id_art ASC";
                                rs = st.executeQuery(q);

                                while(rs.next()){
                                //vamos a hacer que los imprima directo en la tabla
                                
                            if(i == (i/2)*2){

                           %>
 
                          <div class="featured-item" style="text-align: center;">
                              <form action="productSelected" method="post">
                                  <img src=<%=rs.getString("img_art")%> alt=<%="Product"+rs.getString("id_art")%> width="20%" height="20%">
                               <hr>
                               <input class="h6" id="nombre" name="nombre" type="text" value="<%=rs.getString("nom_art")%>" style="text-align: center; border:0px;" size="25" readonly>
                               <input class="h6" id="precio" name="precio" type="text" value="<%="$"+rs.getFloat("prc_art")+"MXN"%>" style="text-align: center; color: blue; border:0px;" size="25" readonly>
                               <br>
                               <button type="submit" class="btn btn-success" style="float: right;">Ver descripción</button>
                            </form>
                          </div>

                          <% 
                                 }else{// aqui va el else %>
                                 
                            <div class="featured-item">
                              <form action="productSelected" method="post">
                                  <img src=<%=rs.getString("img_art")%> alt=<%="Product"+rs.getString("id_art")%> width="20%" height="20%">
                               <hr>
                               <input class="h6" id="nombre" name="nombre" type="text" value="<%=rs.getString("nom_art")%>" style="text-align: center; border:0px;" size="25" readonly>
                               <input class="h6" id="precio" name="precio" type="text" value="<%="$"+rs.getFloat("prc_art")+"MXN"%>" style="text-align: center; color: blue; border:0px;" size="25" readonly>
                               <br>
                               <button type="submit" class="btn btn-success" style="float: right;">Ver descripción</button>
                            </form>
                          </div>

                         <%         }
                              i++;
                             //este es de mi whiel
                                 }
                                rs.close();
                                 st.close();
                                 cn.close();
                             }catch(Exception e){
                                 System.out.println(e.getMessage());
                                 System.out.println(e.getStackTrace());
                             }

                         %>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Featred Ends Here -->


    <!-- Subscribe Form Starts Here -->
    <div class="subscribe-form">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1>¡Aprovecha ofertas de temporada!</h1>
            </div>
          </div>
          <div class="col-md-8 offset-md-2">
            <div class="main-content">
              <p>En la compra superior a $1000 MXN el costo de envío va por nuestra cuenta</p>
              </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Subscribe Form Ends Here -->
    <!-- Modal -->
      <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header bg-secondary">
                    <h5 class="modal-title text-white" id="staticBackdropLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
                    <p>
                      Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium dolorum non animi ullam deserunt. Illo sint ipsa, fuga ad totam libero odio eligendi recusandae ipsum perspiciatis vero excepturi pariatur commodi.
                    </p>
                    <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    <a href="politics.html"><button type="button" class="btn btn-primary">Understood</button></a>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Starts Here -->
    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="logo">
              <img src="assets/images/lo.jpg" height="70px" width="165px" alt="">
            </div>
          </div>
          <div class="col-md-12">
            <div class="footer-menu">
              <ul>
                <li><a href="indexwl.jsp">Inicio</a></li>
                <li><a href="help.jsp"> Ayuda <i class="fa fa-question "></i></a></li>
            <li><a data-toggle="modal" data-target="#staticBackdrop"> <span>Politicas de privacidad</span></a> </li>
                <li><a href="contact.jsp">Contáctanos</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-12">
            <div class="social-icons">
              <ul>
                <li><a href="https://www.facebook.com/The-World-Of-Creations-107994600676781/"><i class="fa fa-facebook"></i></a></li>
                <li><a href="https://web.whatsapp.com/"><i class="fa fa-whatsapp"></i></a></li>
                
                <li><a href="https://www.instagram.com/the_world_of_creations_"><i class="fa fa-instagram"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer Ends Here -->


    <!-- Sub Footer Starts Here -->
    <div class="sub-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="copyright-text">
              
              <p>Copyright &copy; 2020 The World Of Creations</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Sub Footer Ends Here -->


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>

  </body>

</html>

