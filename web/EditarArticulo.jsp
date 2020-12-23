<%@page import="java.io.PrintWriter"%>
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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

            <div class="container my-5 mx-auto">

                <%
                    String DRIVER = "com.mysql.jdbc.Driver";
                    Class.forName(DRIVER).newInstance();
                    Connection cn = null;
                    Statement st = null;
                    ResultSet rs = null;
                    try {
                        String url = "jdbc:mysql://localhost:3306/carrito?user=root&password=n0m3l0";
                        int i = 1;
                        cn = DriverManager.getConnection(url);
                        System.out.println("Sihubobase");

                        st = cn.createStatement();
                        int id = Integer.parseInt(request.getParameter("codedit"));

                        String sql = "select * from articulo where id_art = " + id + " ";
                        rs = st.executeQuery(sql);
                        System.out.println("muestra datos del producto");

                        //y asi como le hicimos  con los demas hay que recorrer la tabla con un while
                        while (rs.next()) {
                            //y vamos a hacer que se imprima directo en la tabla
                            if (1 == (i / 2) * 2) {
                %>

                <div class="col-7 mx-auto">
                    <form method="POST" class="bg-white needs-validation shadow p-3 mb-5 bg-white rounded" novalidate>
                        <div class="mx-4 mt-2">                        
                            <div class="form-group">
                                <label for="name">Producto</label>
                                <input  id="name" name="name" type="text" class="form-control validate" value="<%= rs.getString(2)%>" minlength="3" maxlength="30"   required>
                                <div class="invalid-feedback">
                                    Ingresa el nombre del producto
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="des">Descripcion</label>
                                <textarea  id="des" name="des" cols="25" rows="4" class="form-control validate" minlength="4" maxlength="500" required><%= rs.getString(3)%></textarea>
                                <div class="invalid-feedback">
                                    Ingresa una descripción del producto
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-auto">
                                    <label for="precio">Precio</label>
                                    <input  id="price" name="price" type="number" class="form-control validate" min="1" max="1000" maxlength="3" value="<%= rs.getString(4)%>" required>
                                    <div class="invalid-feedback">
                                        Ingresa el precio del producto
                                    </div><input type="hidden" name="id" value="<%= rs.getString(1)%>">
                                </div>
                                <div class="col-auto">
                                    <label for="stock">Cantidad</label>
                                    <input  id="stock" name="stock" type="number" class="form-control validate" min="1" max="500" maxlength="3" value="<%= rs.getString(5)%>" required>
                                    <div class="invalid-feedback">
                                        Ingresa la cantidad del producto en stock
                                    </div>
                                </div> 
                            </div> 
                            <div class="form-group">
                                <label for="link">Link de Contacto</label>
                                <input id="link" name="link" type="text" class="form-control validate" value="<%= rs.getString(7)%>">
                                <div class="valid-feedback">
                                    Puedes dejar vacio el link de contacto
                                </div>
                            </div>    
                            <br>

                            <div class="align-center">
                                <button type="submit" class="btn btn-success btn-sm" name="SaveChanges" >Guardar Cambios <i class="fa fa-save"></i></button>
                            </div> 
                        </div>

                        <br>
                    </form>
                </div>
            </div>



            <%
            } else {//aqui va el else
            %>

            <div class="col-7 mx-auto">
                <form method="POST" class="bg-white needs-validation shadow p-3 mb-5 bg-white rounded" novalidate>
                    <div class="mx-4 mt-2">                        
                        <div class="form-group">
                            <label for="name">Producto</label>
                            <input  id="name" name="name" type="text" class="form-control validate" value="<%= rs.getString(2)%>" minlength="3" maxlength="30"   required>
                            <div class="invalid-feedback">
                                Ingresa el nombre del producto
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="des">Descripcion</label>
                            <textarea  id="des" name="des" cols="25" rows="4" class="form-control validate" minlength="4" maxlength="500" required><%= rs.getString(3)%></textarea>
                            <div class="invalid-feedback">
                                Ingresa una descripción del producto
                            </div>
                        </div>
                        <div class="row g-3">
                            <div class="col-auto">
                                <label for="precio">Precio</label>
                                <input  id="price" name="price" type="number" class="form-control validate" min="1" max="1000" maxlength="3" value="<%= rs.getString(4)%>" required>
                                <div class="invalid-feedback">
                                    Ingresa el precio del producto
                                </div><input type="hidden" name="id" value="<%= rs.getString(1)%>">
                            </div>
                            <div class="col-auto">
                                <label for="stock">Cantidad</label>
                                <input  id="stock" name="stock" type="number" class="form-control validate" min="1" max="500" maxlength="2" value="<%= rs.getString(5)%>" required>
                                <div class="invalid-feedback">
                                    Ingresa la cantidad del producto en stock
                                </div>
                            </div> 
                        </div> 
                        <div class="form-group">
                            <label for="link">Link de Contacto</label>
                            <input id="link" name="link" type="text" class="form-control validate" value="<%= rs.getString(7)%>">
                            <div class="valid-feedback">
                                Puedes dejar vacio el link de contacto
                            </div>
                        </div>    
                        <br>

                        <div class="align-center">
                            <button type="submit" class="btn btn-success btn-sm" name="SaveChanges" >Guardar Cambios <i class="fa fa-save"></i></button>
                        </div> 
                    </div>

                    <br>
                </form>
            </div>
        </div>

        <%
            }
                i++;
                //este es fin de mi while
            }
                } catch (Exception e) {
                    System.out.println("Si aqui no sirve sout T_T");
                    System.out.println(e.getMessage());
                    System.out.println(e.getStackTrace());
                }

                    if (request.getParameter("SaveChanges") != null) {
                        Statement seet = cn.createStatement();
                        System.out.println("si va aguardar la edicion de datos");
                        String nombre = request.getParameter("name");
                        String descripcion = request.getParameter("des");
                        int precio = Integer.parseInt(request.getParameter("price"));
                        int stock = Integer.parseInt(request.getParameter("stock"));
                        String link = request.getParameter("link");
                        int id = Integer.parseInt(request.getParameter("id"));

                        String sqlup = "UPDATE articulo SET nom_art='" + nombre + "',des_art='" + descripcion + "',prc_art=" + precio + ",stock_art=" + stock + ",wts_art='" + link + "'"
                                + " WHERE id_art=" + id + "";
                        int val = seet.executeUpdate(sqlup);

                        System.out.println("saved changes");

                        response.setContentType("text/html");
                    PrintWriter msg = response.getWriter();
                    msg.print(""
                    + "<div style=\"margin-bottom:-16.5px;\">\n"
                    + "  <div class=\"alert alert-success alert-dismissible fade show text-center mx-5\" role=\"alert\">\n"
                    + "      <strong>¡Producto editado!</strong>\n"
                    + "      <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n"
                    + "       <span aria-hidden=\"true\">&times;</span>\n"
                    + "      </button>\n"
                    + "  </div>\n"
                    + "</div>\n"
                    + "");                                                                                                             
                    
                    request.getRequestDispatcher("conArticulo.jsp").include(request, response);       
                    msg.close();
                    }

            st.close();
            cn.close();

        %>                               

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
    <script src="js/bootstrap.min.js"></script>

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


</body>
</html>
