
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
    
        <title>The World OF Creations México - Tienda Online</title> 
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
            <div class="row tm-mt-big">
                <div class="col-12 mx-auto tm-login-col">
                    <div class="bg-white tm-block">
                        <div class="row">
                            <div class="col-12 text-center">
                                <img src="assets/images/error.png" alt="error">
                                <h2 class="tm-block-title mt-3">Ingresa correctamente el usuario y la contraseña</h2>
                                <a href="login.jsp">Da click aqui e intentalo de nuevo</a>
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
</html>

