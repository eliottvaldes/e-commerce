<%-- 
    Document   : about
    Created on : 2/12/2020, 01:16:54 AM
    Author     : Eliot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
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
        <link rel="stylesheet" href="assets/css/flex-slider.css">

    </head>
    <body>
        <%
            String usuario = "";
            HttpSession sesionOk = request.getSession();

            if (sesionOk.getAttribute("usuario") == null) {
                //Si la sesión no es valida
        %>
        <jsp:forward page="about.html">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>
        <%
            } else {
                //Si la sesion si es valida
                usuario = (String) sesionOk.getAttribute("usuario");
            }
        %>

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
                        <li class="nav-item">
                            <a class="nav-link" href="products.jsp"><i class="fa fa-tags"></i> Productos</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="about.html"><i class="fa fa-users"></i> Acerca de nosotros</a>
                            <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html"><i class="fa fa-envelope"></i> Contáctanos</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <!-- About Page Starts Here -->
        <div class="about-page">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <div class="line-dec"></div>
                            <h1>Conócenos</h1>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="left-image">
                            <img src="assets/images/about-us.jpg" alt="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-content">
                            <h4>TWOC- Una empresa 100% Mexicana</h4>
                            <p><a href="https://www.pexels.com/photo/group-of-people-raising-right-hand-1059120/">Photo Credit</a> goes to Pexels website. Aliquam erat volutpat. Pellentesque fringilla, ligula consectetur cursus scelerisque, leo elit pellentesque sapien, et pharetra arcu elit vitae sem. Suspendisse erat dui, condimentum in mi ac, varius tempor sapien. Donec in justo sit amet ex aliquet maximus ac quis erat.</p> 
                            <br>
                            <p>Donec fermentum tincidunt tellus quis fermentum. Proin eget imperdiet purus. Nulla facilisi. Aliquam tincidunt porttitor dui sed euismod. Duis est libero, rhoncus fermentum turpis id, tempus fringilla ipsum. Nullam venenatis tincidunt neque vel hendrerit. Suspendisse porta pretium porttitor.</p>
                            <br>
                            <p>Sed purus quam, ultricies eu leo in, sollicitudin varius quam. Proin dictum urna ac diam fermentum tempus. Pellentesque urna urna, ullamcorper a tincidunt dignissim, venenatis in nisi. Vivamus in volutpat tellus. Etiam fermentum luctus posuere.</p>
                            <br>
                            <p><a rel="nofollow" href="https://www.tooplate.com/view/2114-pixie">Pixie HTML Template</a> can be converted into your desired CMS theme. You can use this Bootstrap v4.1.3 layout for any online shop. Please tell your friends about <a rel="nofollow" href="https://www.facebook.com/tooplate/">Tooplate</a>. Thank you.</p>
                            <div class="share">
                            </div>            

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About Page Ends Here -->

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
                                <li><a href="indexwl.html">Inicio</a></li>
                                <li><a href="help.jsp">Ayuda</a></li>
                                <li><a href="politics.jsp"> <span>Politicas de privacidad</a> </li>
                                <li><a href="contact.jsp">Contáctanos</a></li>
                            </ul>
                        </div>                    </div>
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
        <script src="assets/js/flex-slider.js"></script>

    </body>
</html>
