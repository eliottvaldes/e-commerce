


<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
    <link rel="icon" type="image/png" href="assets/images/icon.png" sizes="192x192">
    <title>The World Of Creations México - Tienda Online</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/tooplate-main.css">
    <link rel="stylesheet" href="assets/css/owl.css">
<!--
Tooplate 2114 Pixie
https://www.tooplate.com/view/2114-pixie
-->
  </head>

  <body>
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
        <a class="navbar-brand" ><img src="assets/images/header-logo.jpg" height="48px" width="170px" alt=""></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item ">
              <a class="nav-link" href="indexwl.jsp"><i class="fa fa-home"></i> Inicio
              </a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="products.jsp"><i class="fa fa-tags"></i> Productos
              <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="about.jsp"><i class="fa fa-users"></i> Acerca de nosotros</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.jsp" id="ii"><i class="fa fa-envelope"></i> Contáctanos</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <!-- Items Starts Here -->
    <div class="featured-page">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1>Productos</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="featured container no-gutter">

    <hr style="border: 5px; border-color: blue;">
      <div class="row posts">
            <%//Conexion a la BD
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

                        <div id="<%=rs.getInt("id_art")%>" class="item new col-md-4">
                          <div class="featured-item">
                              <form action="productSelected" method="post">                               
                                  <img src=<%=rs.getString("img_art")%> alt=<%="Product"+rs.getString("id_art")%> >
                               <hr>
                               <input class="h5" id="nombre" name="nombre" type="text" value="<%=rs.getString("nom_art")%>" style="text-align: center; border:0px;" size="25" readonly>
                               <input class="h6" id="precio" name="precio" type="text" value="<%="$"+rs.getFloat("prc_art")+"MXN"%>" style="text-align: center; color: blue; border:0px;" size="15" readonly>
                                <button type="submit" class="btn btn-info" href="EliminarFav.jsp?view=<%=rs.getInt("id_art")%> ">
                                   Ver descripción
                                </button>                               
                            </form>
                          </div>
                      </div>
                          <% 
                                 }else{// aqui va el else %>

                       <div id="<%=rs.getInt("id_art")%>" class="item new col-md-4">
                          <div class="featured-item">
                              <form action="productSelected" method="post">                               
                               <img src=<%=rs.getString("img_art")%> alt=<%="Product"+rs.getString("id_art")%>  >
                               <hr>
                               <input class="h5" id="nombre" name="nombre" type="text" value="<%=rs.getString("nom_art")%>" style="text-align: center; border:0px;" size="25" readonly>
                               <input class="h6" id="precio" name="precio" type="text" value="<%="$"+rs.getFloat("prc_art")+"MXN"%>" style="text-align: center; color: blue; border:0px;" size="15" readonly>
                                <button type="submit" class="btn btn-info" href="EliminarFav.jsp?view=<%=rs.getInt("id_art")%> ">
                                   Ver descripción
                                </button>                               
                            </form>
                          </div>
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
    <!-- Featred Page Ends Here -->


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
            <li><a href="help.jsp">Ayuda</a></li>
            <li><a href="politics.jsp"> <span>Politicas de privacidad</a> </li>
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
    <script src="assets/js/isotope.js"></script>
    

  </body>


</html>