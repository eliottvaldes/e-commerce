
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/png" href="assets/images/icon.png" sizes="192x192">
    <title>Eliminar Cuenta</title>   
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
                            <h2 class="tm-block-title d-inline-block">Cuentas</h2>
                        </div>
                    </div>
                    <table class="table table-hover table-striped">
                         <%//Conexion a la BD
                            String DRIVER = "com.mysql.jdbc.Driver";
                            Class.forName(DRIVER).newInstance();
                            Connection cn = null;
                            Statement st = null;
                            ResultSet rs = null;
                            try{
                                String url = "jdbc:mysql://localhost:3306/carrito?user=root&password=n0m3l0";
                                int i = 1;
                                cn = DriverManager.getConnection(url);

                                st = cn.createStatement();
                                String q = "Select * from usuario order by id_usr ASC";
                                rs = st.executeQuery(q);

                                while(rs.next()){
                                    int tipo = rs.getInt("priv_usr");
                            if(tipo==1){    
                                    
                                
                            if(i == (i/2)*2){

                           %>
                        <tr>
                              <td><%=rs.getInt("id_usr")%> 

                              </td>
                              <td><%=rs.getString("user_usr")%> 

                              </td>
                          </tr>
                          <% 
                                 }else{// aqui va el else %>
                        <tr>
                              <td><%=rs.getInt("id_usr")%> 

                              </td>
                              <td><%=rs.getString("user_usr")%> 

                              </td>
                          </tr>
                         <%         }
                              i++;
                                 }
                                }
                                rs.close();
                                 st.close();
                                 cn.close();
                             }catch(Exception e){
                                 System.out.println(e.getMessage());
                                 System.out.println(e.getStackTrace());
                             }

                         %>
                    </table>
                </div>
            </div>
            <div class="tm-col tm-col-big" style="width: 60%; text-align: center;">
                <div class="bg-white tm-block">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-block-title">No puedes eliminar clientes</h2>
                            <h2 class="tm-block-title">Ingresa el numero de lista del usuario que deseas eliminar y tu contraseña para confirmar</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <form action="EliminarUsuario" method="post" class="tm-login-form">
                                    <div class="input-group">
                                        <label for="id" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Num. Lista usuario: </label>
                                        <input name="id" placeholder="1" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" id="name" value="" required>
                                    </div>
                                    <div class="input-group mt-3">
                                        <label for="password" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Contraseña: </label>
                                        <input name="password" type="password" placeholder="Contraseña" class="form-control validate" id="password" value="" required>
                                    </div>
                                    <div class="input-group mt-3">
                                        <button type="submit" class="btn btn-danger d-inline-block mx-auto">Eliminar</button>
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