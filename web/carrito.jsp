<%-- 
    Document   : carrito
    Created on : 11/11/2020, 05:11:16 AM
    Author     : Windows 10
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
        <title>The World Of Creations - Tienda Online</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/tooplate-main.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/flex-slider.css">     

    </head>





    <body>
        <%@page language="java" import="java.util.*,java.sql.*,java.text.*"%>
        <%
            String usuario = "";
            HttpSession sesionOk = request.getSession();

            if (sesionOk.getAttribute("usuario") == null) {
                //Si la sesión no es valida
        %>
        <jsp:forward page="login.jsp">
            <jsp:param name="error" value="Es obligatorio identificarse"/>
        </jsp:forward>
        <%
            } else {
                //Si la sesion si es valida
                usuario = (String) sesionOk.getAttribute("usuario");
            }
        %>

        <%
            //vamos a crear la conexion con la bd
            Connection con = null;

            String url = "jdbc:mysql://localhost:3306/";
            String user = "root";
            String password = "n0m3l0";
            String db = "carrito";
            String driver = "com.mysql.jdbc.Driver";
            Statement st = null;
            ResultSet rs = null;
            int para = 0;
            try {
                System.out.println("si se conecto a la bd");
                Class.forName(driver);
                con = DriverManager.getConnection(url + db, user, password);
                //se pasan los 3 parametros + el nombre de usuario 
                //la bd ahora va a verificar que este bien
                try {
                    st = con.createStatement();
                    String q = "Select id_usr from usuario where user_usr ='" + usuario + "' ";
                    rs = st.executeQuery(q);
                    while (rs.next()) {
                        para = rs.getInt(1);
                    }
                    System.out.println("El parametro que se asigno para usuario es: " + para);

                    System.out.println("Si se va a agregar a CARRITO");
                    Statement set = con.createStatement();

                    int art = Integer.parseInt(request.getParameter("art"));
                    int quantity = Integer.parseInt(request.getParameter("cantidad"));

                    String sql = "insert into carrito.cart (id_user, id_arti, count_arti) "
                            + "values (" + para + "," + art + "," + quantity + ")";
                    System.out.println("El usuario que agrego a carrito fue: " + usuario);
                    System.out.println("Los datos fueron: " + sql);
                    int val = set.executeUpdate(sql);

                    request.getRequestDispatcher("dis_cart.jsp").forward(request, response);

                    rs.close();
                    st.close();
                    con.close();

                } catch (SQLException ex) {
                    System.out.println("carrito no furula xd");
                    System.out.println(ex.getSQLState());
                    System.out.println("No se conecto a la tabla1");
                    System.out.println(ex.getMessage());
                    System.out.println(ex.getStackTrace());
                }//fin de catch anidado            

            } catch (Exception e) {
                System.out.println("2");
                System.out.println("No se agrego a carrito");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
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
                            <li ><a href="LogOut" onclick="localStorage.clear();" >  Salir  <i class="fa fa-sign-out"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
            <div class="container">
                <a class="navbar-brand"><img src="assets/images/header-logo.jpg" height="48px" width="155px" alt=""></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="indexwl.jsp" id="i"><i class="fa fa-home"></i> Inicio
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="products.jsp"><i class="fa fa-tags"></i> Productos</a>
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
        <!-- About Page Starts Here -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading">
                        <div class="line-dec"></div>
                        <h1><i class="fa fa-shopping-cart"></i> Carrito</h1>
                        <h1>¡Yeah mi querido <%=usuario%>!</h1>
                        <h2>Lametablemente ocurrio un error unu</h2>
                    </div>
                </div>          
            </div>  




            <br>
            <br>
        </div><!-- Fin de products -->
        <br>
        <br>
    </div><!-- Fin de container -->
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
                        <img src="assets/images/lo.jpg" height="70px" width="165px" alt="logo">
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
