<%-- 
    Document   : favoritos
    Created on : 12/11/2020, 04:08:53 AM
    Author     : Eliot
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
    
    <!-- Pre Header -->
    <div id="pre-header" class="login-menu">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <ul>
              <li class="cart"><a role="button" class="button producto" href="favoritos.jsp"> <i class="fa fa-heart"></i></a></li> 
              <li class="cart"><a role="button" class="button producto" href="dis_cart.jsp"> <i class="fa fa-shopping-cart"></i></a></li> 
              <li ><a href="LogOut">  Salir  <i class="fa fa-sign-out"></i></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
       <a class="navbar-brand" ><img src="assets/images/header-logo.jpg" height="48px" width="170px" alt=""></a>
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
              <a class="nav-link" href="about.html"><i class="fa fa-users"></i> Acerca de nosotros</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.html" id="ii"><i class="fa fa-envelope"></i> Contáctanos</a>
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
            <div class="section-heading clearfix"><br>
            <div class="line-dec"></div><br>                          
                <a class="h4"><i class="fa fa-shopping-cart"></i> Carrito </a>
                <a href="products.jsp" class="float-right"><p class="btn btn-dark text-white">Volver a catalogo</p></a>                                      
          </div>
        </div>          
      </div>                               
             <% //vamos a conectar con la DB
                    String DRIVER ="com.mysql.jdbc.Driver";
                    Class.forName(DRIVER).newInstance();
                    Connection con2=null;
                    Statement st = null;
                    ResultSet rs = null;
                    Statement st2= null;
                    ResultSet rs2= null;                    
                    Statement st3= null;
                    ResultSet rs3= null;                    
                    String hidetable="";
                    String hidemsg="";
                    int type=0;
                    int para=0;
                    try{
                        String url2="jdbc:mysql://localhost:3306/carrito?user=root&password=n0m3l0";
                        int i=1;
                        con2= DriverManager.getConnection(url2);                        
                        st = con2.createStatement();
                        String q = "Select id_usr from usuario where user_usr ='"+usuario+"' ";                    
                        rs = st.executeQuery(q);
                        while(rs.next()){
                            para=rs.getInt(1);
                        }   
                        //para obtener datos de producto
                        st2=con2.createStatement();
                        String g= "select distinct id_art, nom_art, des_art, prc_art, img_art from carrito.articulo, carrito.cart where id_art=id_arti and id_user="+para+"";
                        rs2=st2.executeQuery(g);
                        
                        //para ocultar tabla si no hay productos en carrito 
                        st3 = con2.createStatement();
                        String q3 = "SELECT COUNT(*) FROM carrito.cart WHERE id_user ="+para+"";                    
                        rs3 = st3.executeQuery(q3);
                        while(rs3.next()){
                            type=rs3.getInt(1);
                            if (type==0) {                           
                                hidetable="hidden";
                                hidemsg="";
                            }else{
                                hidetable="";
                                hidemsg="hidden";
                            }
                        
                        
                                                                              
                        //y asi como le hicimos  con los demas hay que recorrer la tabla con un while                        
            %>
        <!--yeah-->
        
        <div <%=hidemsg%> class="text-muted text-center">
            <br>
            <h1>Tu carrito en TWOC está vacio</h1>
            <br>
            <div>
                <i class="fa fa-cart-arrow-down " style="font-size: 300px;"></i>
            </div><br>
            <h2>Te invitamos a conocer más de nuestros productos</h2>
        </div>
        
        <div class="table-responsive text-center">
            
            <table <%=hidetable%> class="table table-hover table-striped">
                <tbody>                      
                        <thead class="bg-danger text-white">
                            <th width="5%" scope="col">
                                NOMBRE
                            </th>
                            <th width="10%" scope="col">
                                CANTIDAD
                            </th>
                            <th width="10%" scope="col">
                                PRECIO
                            </th>
                            <th width="20%" scope="col">
                                IMAGEN
                            </th>
                            <th class="bg-white text-dark" width="15%" scope="col">
                                Delete
                            </th>
                        </thead>
                
                    
                    <% 
                        }
                        while(rs2.next()){ 
                            //y vamos a hacer que se imprima directo en la tabla
                        if(1==(i/2)*2){
                    %>
                    <tr>
                        <td  class="align-middle" scope="row"><%= rs2.getString(2)%>    
                        </td>
                        <td  class="align-middle" scope="row"><%= rs2.getString(3)%>    
                        </td>
                        <td  class="align-middle" scope="row"><%= rs2.getString(4) %>    
                        </td>
                        <td  class="align-middle" scope="row">
                            <img src=<%=rs2.getString(5)%> alt=<%="Product"+rs2.getString(5)%> width="70%">
                        </td>                        
                        <td  class="align-middle">
                            <!--Con el parametro ?cod="" se le pasa el dato de la fila y la columna que se va a querer eliminar-->
                          <a  class="space" href="EliminarCart.jsp?coddel=<%= rs2.getString(1)%> ">Eliminar de Carrito</a>
                        </td>
                    </tr>
                    
                    
                    <%
                    }else{//aqui va el else%>
                    
                        <tr>
                            <td  class="align-middle" scope="row"><%= rs2.getString(2)%>    
                            </td>
                            <td  class="align-middle" scope="row"><%= rs2.getString(3)%>    
                            </td>
                            <td  class="align-middle" scope="row"><%= rs2.getString(4) %>    
                            </td>
                            <td  class="align-middle" scope="row">
                                <img src=<%=rs2.getString(5)%> alt=<%="Product"+rs2.getString(5)%> width="70%">
                            </td>
                            
                        <td  class="align-middle">
                            <!--Con el parametro ?cod="" se le pasa el dato de la fila y la columna que se va a querer eliminar-->
                          <a class="space" href="EliminarCart.jsp?coddel=<%= rs2.getString(1)%> ">Eliminar de Carrito</a>
                        </td>
                        </tr>
                            
                    <%       }   
                        i++;
                        //este es fin de mi while
                        }     
                        rs.close();
                        st.close();
                        rs2.close();
                        st2.close();
                        rs3.close();
                        st3.close();
                        con2.close();
                        }catch(Exception e){
                        System.out.println("Si aqui no sirve sout T_T");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                        }                
                     %>
                    </tbody>
            </table>             
            
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
            <li><a href="indexwl.html">Inicio</a></li>
            <li><a href="help.html">Ayuda</a></li>
            <li><a href="politics.html"> <span>Politicas de privacidad</a> </li>
            <li><a href="contact.html">Contáctanos</a></li>
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
