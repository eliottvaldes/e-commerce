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
                <table class="table table-hover table-striped table-bordered table-responsive">
                    <tbody class="responsive">
                    <thead class="bg-dark text-white">                       
                    <th width="10%" >Nombre
                    </th>
                    <th width="20%" >Descripcion
                    </th>
                    <th width="5%" >Precio
                    </th>
                    <th width="5%" >Stock
                    </th>
                    <th width="20%" >Imagen
                    </th>
                    <th width="5%" >Contacto
                    </th>
                    <th >Acciones
                    </th>
                    </thead>
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

                            System.out.println("Sihubobase");

                            st = cn.createStatement();
                            String q = "Select * from articulo order by id_art ASC";
                            rs = st.executeQuery(q);
                            
                            
                            
                            while (rs.next()) {
                                
                                String wc="";
                                if(rs.getString("wts_art").length()<10){
                                    wc="fa fa-times";
                                }else{
                                    wc="fa fa-check";
                                }
                                
                                if (i == (i / 2) * 2) {
                                   
                    %>

                    <tr class="text-center">                                               
                        <td class="align-middle">
                            <%=rs.getString("nom_art")%> 
                        </td>
                        <td class="align-middle">
                            <p class="text-break"><%=rs.getString("des_art")%> </p>                            
                        </td>
                        <td class="align-middle">$<%=rs.getFloat("prc_art")%> 
                        </td>
                        <td class="align-middle"><%=rs.getInt("stock_art")%> 
                        </td>
                        <td><img src="<%=rs.getString("img_art")%>" width="80%"> 
                        </td>
                        <td class="align-middle"><i class="<%=wc%>"></i></td>
                        <td  class="align-middle">   
                            <div class="clearfix">                                
                                <form method="POST" action="EditarArticulo.jsp" class="float-left">
                                <input type="hidden" name="codedit" id="codedit" value="<%= rs.getString(1)%>">
                                <button  type="submit" class="btn btn-info btn-sm"><i class="fa fa-edit"></i> </button>                               
                                </form>
                                <form method="POST" action="EliminarArticulo.jsp" class="float-right">
                                    <input type="hidden" name="coddel" id="coddel" value="<%= rs.getString(1)%>">
                                    <button  type="submit" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> </button>                               
                                </form> 
                            </div>                                                       
                        </td>

                    </tr>

                    <%
                       
                    } else {                           
                    %>

                    <tr class="text-center">                                               
                        <td class="align-middle">
                            <%=rs.getString("nom_art")%> 
                        </td>
                        <td class="align-middle">
                            <p class="text-break"><%=rs.getString("des_art")%> </p>                            
                        </td>
                        <td class="align-middle">$<%=rs.getFloat("prc_art")%> 
                        </td>
                        <td class="align-middle"><%=rs.getInt("stock_art")%> 
                        </td>
                        <td><img src="<%=rs.getString("img_art")%>" width="80%"> 
                        </td>
                        <td class="align-middle" ><i class="<%=wc%>"></i></td>
                        <td  class="align-middle">   
                            <div class="clearfix">
                                <form method="POST" action="EditarArticulo.jsp" class="float-left">
                                <input type="hidden" name="codedit" id="codedit" value="<%= rs.getString(1)%>">
                                <button  type="submit" class="btn btn-info btn-sm"><i class="fa fa-edit"></i> </button>                               
                                </form>
                                <form method="POST" action="EliminarArticulo.jsp" class="float-right">
                                    <input type="hidden" name="coddel" id="coddel" value="<%= rs.getString(1)%>">
                                    <button  type="submit" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> </button>                               
                                </form> 
                            </div>                                                       
                        </td>
                    </tr>  
                    </tbody>
                    <%         }                               
                                i++;
                                //este es de mi whiel

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

