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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
        <link rel="icon" type="image/png" href="assets/images/icon.png" sizes="192x192">
        <title>The World Of Creations- Tienda Online</title>
        <!--PARA LA PLATILLA BASE-->      
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">      
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/tooplate-main.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>
    <body>
        <%
            String usuario = "";
            HttpSession sesionOk = request.getSession();

            if (sesionOk.getAttribute("usuario") == null) {
                //Si la sesión no es valida
        %>
        <jsp:forward page="help.html">
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


        <!-- Page Content -->
        <br><br><br><br>

        <div class="container mx-auto">
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Información #1
                            </button>
                        </h2>
                    </div>

                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Información #2
                            </button>
                        </h2>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header" id="headingThree">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Información #3
                            </button>
                        </h2>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <hr class="mx-5">        

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
