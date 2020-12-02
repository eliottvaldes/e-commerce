<%-- 
    Document   : contact
    Created on : 2/12/2020, 01:17:30 AM
    Author     : Eliot
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
        <link rel="icon" type="image/png" href="assets/images/icon.png" sizes="192x192">
        <title>The World of Creations México - Tienda Online</title> 
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
        <jsp:forward page="contact.html">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>
        <%
            } else {
                //Si la sesion si es valida
                usuario = (String) sesionOk.getAttribute("usuario");
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
                        <li class="nav-item">
                            <a class="nav-link" href="indexwl.jsp"><i class="fa fa-home"></i> Inicio                
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="products.jsp"><i class="fa fa-tags"></i> Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp"><i class="fa fa-users"></i> Acerca de nosotros</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="contact.jsp"><i class="fa fa-envelope"></i> Contáctanos
                                <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <!-- About Page Starts Here -->
        <div class="contact-page">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="section-heading">
                            <div class="line-dec"></div>
                            <h1>Enviar Email</h1>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div id="map">
                            <!-- How to change your own map point
                               1. Go to Google Maps
                               2. Click on your location point
                               3. Click "Share" and choose "Embed map" tab
                               4. Copy only URL and paste it within the src="" field below
                            -->

                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d481726.88754090015!2d-99.42381575901958!3d19.3911668366046!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x85ce0026db097507%3A0x54061076265ee841!2sCiudad%20de%20M%C3%A9xico%2C%20CDMX!5e0!3m2!1ses-419!2smx!4v1605350274735!5m2!1ses-419!2smx" width="100%" height="500px" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-content">
                            <div class="container">
                                <form id="contact" action="" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <fieldset>
                                                <input name="name" type="text" class="form-control" id="name" placeholder="Nombre..." required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-md-6">
                                            <fieldset>
                                                <input name="email" type="text" class="form-control" id="email" placeholder="Email..." required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-md-12">
                                            <fieldset>
                                                <input name="subject" type="text" class="form-control" id="subject" placeholder="Asunto..." required="">
                                            </fieldset>
                                        </div>
                                        <div class="col-md-12">
                                            <fieldset>
                                                <textarea name="message" rows="6" class="form-control" id="message" placeholder="Tu mensaje..." required=""></textarea>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-12">
                                            <fieldset>
                                                <button type="submit" id="form-submit" class="button"><u>Enviar Mensaje</u></button>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="share">

                                            </div>
                                        </div>
                                    </div>
                                </form>
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
        <script src="assets/js/flex-slider.js"></script> 


    </body>
</html>
