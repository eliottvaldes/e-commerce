

<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Agregar Administrador</title>
    <!--

    Template 2108 Dashboard

	http://www.tooplate.com/view/2108-dashboard

    -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>

<body class="bg03">
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
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-expand-xl navbar-light bg-light">
                    <a class="navbar-brand" href="dashboard.jsp">
                        <i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i>
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
                                        <a class="dropdown-item" href="modArticulo.jsp">Modificar articulos</a>
                                        <a class="dropdown-item" href="eliArticulo.jsp">Eliminar articulos</a>
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
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    Ventas
                                </a><div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="chooseTicket.jsp">Consultar ventas (Tickets)</a>
                                </div>
                            </li>
                        </ul>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link d-flex" href="index.html">
                                    <i class="far fa-user mr-2 tm-logout-icon"></i>
                                    <span>Salir</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- row -->
        <br>
            <div style="text-align: center; width: 70%; margin-left: 15%;">
                <div class="bg-white tm-block">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-block-title">Ingrese los datos del nuevo Administrador</h2>
                        </div>
                    </div>
                    <div>
                        <div class="col-12">
                            <form action="RegistroAdmin" method="post" class="tm-login-form">
                                    <div class="input-group">
                                        <label for="name" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Nombre(s): </label>
                                        <input name="name" placeholder="Nombre(s)" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" id="name" value="" required>
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <label for="appat" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Apellido Paterno: </label>
                                        <input name="appat" placeholder="Apellido Paterno" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" id="appat" value="" required>
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <label for="apmat" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Apellido Materno: </label>
                                        <input name="apmat" placeholder="Apellido Materno" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" id="apmat" value="" required>
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <label for="username" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Nombre de Usuario: </label>
                                        <input name="username" placeholder="Nombre de usuario" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" id="username" value="" required>
                                    </div>
                                    <div class="input-group mt-3">
                                        <label for="email" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Email:  </label>
                                        <input name="email" type="text" placeholder="Email" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" id="email" value="" required>
                                    </div>
                                    <div class="input-group mt-3">
                                        <label for="password" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Contraseña: </label>
                                        <input name="password" type="password" placeholder="Contraseña" class="form-control validate" id="password" value="" required>
                                    </div>
                                    <div class="input-group mt-3">
                                        <label for="password2" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Repita la contraseña: </label>
                                        <input name="password2" type="password" placeholder="Contraseña" class="form-control validate" id="password2" value="" required>
                                    </div><br>
                                    <div class="input-group mt-3">
                                        <button type="submit" class="btn btn-primary d-inline-block mx-auto">Aceptar</button>
                                    </div><br>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
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

