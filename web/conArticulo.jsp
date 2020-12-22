
<%@page language="java" import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Consultar Articulos</title>
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
                            <!--
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    Ventas
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="chooseTicket.jsp">Consultar ventas (Tickets)</a>
                                </div>
                            </li>
                            -->
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
        <!---------------><br>
        <div class="bg-white ">
            <table class="table table-hover table-striped table-bordered table-responsive">
                    <tbody class="responsive">
                        <thead class="bg-dark text-white">
                            <th  scope="col">ID
                            </th>
                            <th scope="col">Nombre
                            </th>
                            <th scope="col">Descripcion
                            </th>
                            <th scope="col">Precio
                            </th>
                            <th scope="col">Stock
                            </th>
                            <th>Imagen
                            </th>
                            <th  scope="col">Contacto
                            </th>
                        </thead>
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

                                System.out.println("Sihubobase");

                                st = cn.createStatement();
                                String q = "Select * from articulo order by id_art ASC";
                                rs = st.executeQuery(q);

                                while(rs.next()){
                                
                            if(i == (i/2)*2){

                           %>

                            <tr>
                              <td><%=rs.getInt("id_art")%> 
                              </td>
                              <td><%=rs.getString("nom_art")%> 
                              </td>
                              <td width="350px"><%=rs.getString("des_art")%> 
                              </td>
                              <td><%=rs.getFloat("prc_art")%> 
                              </td>
                              <td><%=rs.getInt("stock_art")%> 
                              </td>
                              <td><img src="<%=rs.getString("img_art")%>" width="200px" height="200px"> 
                              </td>
                              <!--<td width="100px"><%=rs.getString("wts_art")%></td>
                              -->
                            </tr>

                            <% System.out.println(rs.getString("wts_art"));
                                 }else{// aqui va el else %>


                            <tr>
                              <td><%=rs.getInt("id_art")%> 
                              </td>
                              <td><%=rs.getString("nom_art")%> 
                              </td>
                              <td width="350px"><%=rs.getString("des_art")%> 
                              </td>
                              <td><%=rs.getFloat("prc_art")%> 
                              </td>
                              <td><%=rs.getInt("stock_art")%> 
                              </td>
                              <td><img src="<%=rs.getString("img_art")%>" width="200px" height="200px"> 
                              </td>
                            </tr>  
                    </tbody>
                         <%         }
                            System.out.println(rs.getString("wts_art"));
                              i++;
                             //este es de mi whiel
                             
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

