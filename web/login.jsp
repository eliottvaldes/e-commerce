
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
        <title>The World Of Creations México - Tienda Online</title> 
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
        <!-- https://fonts.google.com/specimen/Open+Sans -->
        <link rel="stylesheet" href="assets/css_crud/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="assets/css_crud/fullcalendar.min.css">
        <!-- https://fullcalendar.io/ -->
        <link rel="stylesheet" href="assets/css_crud/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="assets/css_crud//tooplate.css">
      </head>
<body>
    <body class="bg03">
        <div class="container">
            <div class="row tm-mt-big">
                <div class="col-12 mx-auto tm-login-col">
                    <div class="bg-white tm-block">
                        <div class="row">
                            <div class="col-12 text-center">
                                <img src="assets/images/load.gif" alt="cargando" width="65%" height="75%" class="rounded-circle">
                                <h1 class="tm-block-title mt-3">Iniciar de Sesion</h1>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <form action="SVerificarUsuario" method="post" class="tm-login-form">
                                    
                                    <div class="input-group">
                                        <label for="username" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Usuario: </label>
                                        <input name="username" placeholder="Usuario" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" id="username" value="" required>
                                    </div>
                                    <div class="input-group mt-3">
                                        <label for="password" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Contraseña: </label>
                                        <input name="password" placeholder="Contraseña" type="password" class="form-control validate" id="password" value="" required>
                                    </div>
                                    <br>
                                    <div class="input-group mt-3">
                                        <button type="submit" class="btn btn-success d-inline-block mx-auto">Login</button>
                                    </div>
                                    <br>
                                    <div class="input-group mt-3">
                                        <a href="singup.html">O Registrate Aquí</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="row tm-mt-big">
                <div class="col-12 font-weight-light text-center">
                    <p class="d-inline-block tm-bg-black text-white py-2 px-4">
                        Copyright &copy; 2020 The World Of Creations
                    </p>
                </div>
            </footer>
        </div>
    </body>
</body>
</html>
