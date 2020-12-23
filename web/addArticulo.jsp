<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" type="image/png" href="assets/images/icon.png" sizes="192x192">
        <title>Agregar Articulo</title>   
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
            <!-- row -->
            <div class="row tm-content-row tm-mt-big">
                <div class="tm-col tm-col-big">
                    <div class="bg-white tm-block">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Mis Articulos</h2>
                            </div>
                        </div>
                        <table class="table table-hover table-striped">
                            <%//Conexion a la BD
                                String DRIVER = "com.mysql.jdbc.Driver";
                                Class.forName(DRIVER).newInstance();
                                Connection cn = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    String url = "jdbc:mysql://localhost:3306/carrito?user=root&password=n0m3l0";
                                    int i = 1;
                                    cn = DriverManager.getConnection(url);

                                    st = cn.createStatement();
                                    String q = "Select * from articulo order by id_art ASC";
                                    rs = st.executeQuery(q);

                                    while (rs.next()) {
                                        if (i == (i / 2) * 2) {

                            %>
                            <tr>
                                <td><%=i%> 

                                </td>
                                <td><%=rs.getString("nom_art")%> 

                                </td>
                            </tr>
                            <%
                            } else {// aqui va el else %>
                            <tr>
                                <td><%=i%> 

                                </td>
                                <td><%=rs.getString("nom_art")%> 

                                </td>
                            </tr>
                            <%         }
                                        i++;
                                    }
                                    rs.close();
                                    st.close();
                                    cn.close();
                                } catch (Exception e) {
                                    System.out.println(e.getMessage());
                                    System.out.println(e.getStackTrace());
                                }

                            %>
                        </table>
                    </div>
                </div>
                <div class="tm-col tm-col-big" style="width: 60%; ">
                    <div class="bg-white tm-block shadow bg-white rounded">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title text-center">Nuevo Articulo <i class="fa fa-plus-circle"></i> </h2>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <form action="NuevoArticulo" method="post" enctype="multipart/form-data" class="needs-validation " novalidate >
                                    <div class="form-group">
                                        <label for="name">Nombre</label>
                                        <input placeholder="Articulo" id="name" name="name" type="text" class="form-control validate" minlength="3" maxlength="30" required>
                                        <div class="invalid-feedback">
                                            Ingresa el nombre del producto
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="des">Descripcion</label>
                                        <textarea placeholder="Descripcion" id="des" name="des" cols="25" rows="4" class="form-control validate" maxlength="500" required></textarea>
                                        <div class="invalid-feedback">
                                            Ingresa la descripción del producto
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="precio">Precio</label>
                                            <input placeholder="1" id="price" name="price" type="number" class="form-control validate" min="1" max="1000" required>
                                            <div class="invalid-feedback">
                                                Ingresa el precio del producto
                                            </div>
                                        </div>
                                        <div class="col">
                                            <label for="stock">Cantidad</label>
                                            <input placeholder="0" id="stock" name="stock" type="number" class="form-control validate" min="1" max="500"  required>
                                            <div class="invalid-feedback">
                                                Ingresa el stock del producto
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-4">
                                        <label for="fileInput">Imagen</label>
                                        <input id="fileInput" type="file" name="fileInput" required>                                       
                                        <div class="invalid-feedback">
                                            Selecciona la imagen del producto
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="link">Link de Contacto</label>
                                        <input placeholder="https://whatsapp.com" id="link" name="link" type="text" class="form-control validate">
                                        <div class="valid-feedback">
                                            Puedes dejar en blaco este campo
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row g-3">
                                        <div class="col-auto">
                                            <button type="submit" class="btn btn-success">Registrar Articulo <i class="fa fa-save"></i>
                                            </button>
                                        </div>
                                        <br> 
                                        <div class="col-auto">
                                            <button type="reset" class="btn btn-warning">Limpiar Campos <i class="fa fa-undo-alt"></i>
                                            </button>
                                        </div>
                                    </div>
                            </div>
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
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                    .forEach(function (form) {
                        form.addEventListener('submit', function (event) {
                            if (!form.checkValidity()) {
                                event.preventDefault()
                                event.stopPropagation()
                            }

                            form.classList.add('was-validated')
                        }, false)
                    })
        })()
    </script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
</body>

</html>
