<%@page import="java.io.PrintWriter"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" type="image/png" href="assets/images/icon.png" sizes="192x192">
        <title>Consultar Articulos</title>       
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/tooplate.css">
    </head>

    <body class="bg03">
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

            try {
                System.out.println("si se conecto a la bd");
                Class.forName(driver);
                con = DriverManager.getConnection(url + db, user, password);                
                try {
                    Statement set = con.createStatement();
                    int id = Integer.parseInt(request.getParameter("coddel"));

                    String sql = "delete from `articulo` where (`id_art` = " + id + ")";
                    int val = set.executeUpdate(sql);
                    response.setContentType("text/html");
                    PrintWriter msg = response.getWriter();
                    msg.print(""
                    + "<div style=\"margin-bottom:-16.5px;\">\n"
                    + "  <div class=\"alert alert-danger alert-dismissible fade show text-center mx-5\" role=\"alert\">\n"
                    + "      <strong>¡Producto eliminado del catalogo!</strong>\n"
                    + "      <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n"
                    + "       <span aria-hidden=\"true\">&times;</span>\n"
                    + "      </button>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "");                                                                                                             
                    
                    request.getRequestDispatcher("conArticulo.jsp").include(request, response);                    
                    msg.close();
                    con.close();

                } catch (SQLException ex) {
                    System.out.println("xd");
                    System.out.println(ex.getSQLState());
                    System.out.println("No se conecto a la tabla1");
                    System.out.println(ex.getMessage());
                    System.out.println(ex.getStackTrace());
                }//fin de catch anidado            

            } catch (Exception e) {
                System.out.println("2");
                System.out.println("No se elimino de catalogo");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }

        %>
        
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        <a class="navbar-brand" href="dashboard.jsp">
                            <i class="fas fa-3x fa-user-astronaut tm-site-icon"></i>
                            <h1 class="tm-site-title mb-0">Dashboard</h1>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="dashboard.jsp">Dashboard
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false">Articulos</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="conArticulo.jsp">Consultar articulos</a>
                                        <a class="dropdown-item" href="addArticulo.jsp">Agregar articulos</a>                                        
                                    </div>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                       aria-expanded="false">Cuentas</a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="addAdmin.jsp">Agregar Administrador</a>
                                        <a class="dropdown-item" href="conCuenta.jsp">Consultar cuentas</a>
                                        <a class="dropdown-item" href="modCuenta.jsp">Modificar cuenta</a>
                                        <a class="dropdown-item" href="eliCuenta.jsp">Eliminar cuenta</a>
                                    </div>
                                </li>
                            </ul>
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-flex" href="LogOut">
                                        <i class="fa fa-sign-out-alt mr-2 tm-logout-icon"></i> 
                                        <span>Salir</span>                                     
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            
            
            <!---------------><br>
            <div class="bg-white ">
                <h1>ERROR AL ELIMINAR PRODUCTO</h1>
            </div>
            <!--------------->
            <footer class="row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="d-inline-block tm-bg-black text-white py-2 px-4 text-white tm-footer-link">
                        Copyright &copy; 2020 The World Of Creations
                    </p>
                </div>
            </footer>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>

</html>

