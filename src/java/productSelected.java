/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Melyz
 */
public class productSelected extends HttpServlet {

    private Connection con = null;
    private PreparedStatement pr = null;
    private ResultSet rs = null;

    public void init(ServletConfig cfg) throws ServletException {
        String URL = "jdbc:mysql:3306//localhost/carrito"; //se traza la ruta de conexion, donde esta la bd
        String userName = "root"; //se determina el usuario de conexion de mysql
        String password = "n0m3l0"; //n0m3l0 //el password si es que cuenta con uno
        try {
            Class.forName("com.mysql.jdbc.Driver");
            URL = "jdbc:mysql://localhost/carrito";
        } catch (Exception e) {
            System.out.println("No hay base T_T");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            String usuario = "";
            HttpSession sesionOk = request.getSession();
            if (sesionOk.getAttribute("usuario") == null) {
                System.out.println("no hay user activo ");
            } else {
                //Si la sesion si es valida
                usuario = (String) sesionOk.getAttribute("usuario");
            }
            String art = request.getParameter("favorito");

            String nombre = request.getParameter("nombre");
            String precio = request.getParameter("precio");
            float prc = 0;
            String descripcion = "";
            String link = "";
            String type = "";
            String imagen = "";

            try {

                con = Conexion.getConexion();
                String q = "Select * from articulo where  nom_art = '" + nombre + "'";
                pr = con.prepareStatement(q);
                rs = pr.executeQuery();

                while (rs.next()) {
                    descripcion = rs.getString("des_art");
                    imagen = rs.getString("img_art");
                    prc = rs.getFloat("prc_art");
                    art = rs.getString("id_art");
                    if (rs.getString("wts_art") == null) {
                        type = "hidden";
                        link = "";
                    } else {
                        type = "";
                        link = rs.getString("wts_art");
                    }
                }
            } catch (Exception e) {
                System.out.println("No encontro la tabla");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            } finally {
                try {
                    rs.close();
                    pr.close();
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                    System.out.println(ex.getMessage());
                }

            }
            out.println("<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "  <head>\n"
                    + "\n"
                    + "    <meta charset=\"utf-8\">\n"
                    + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n"
                    + "    <meta name=\"description\" content=\"\">\n"
                    + "    <meta name=\"author\" content=\"\">\n"
                    + "    <link href=\"https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700\" rel=\"stylesheet\">\n"
                    + "    <link rel=\"icon\" type=\"image/png\" href=\"assets/images/icon.png\" sizes=\"192x192\">\n"
                    + "    <title>The World Of Creations- Tienda Online</title>\n"
                    + "    <!-- Bootstrap core CSS -->\n"
                    + "    <link href=\"vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                    + "\n"
                    + "\n"
                    + "    <!-- Additional CSS Files -->\n"
                    + "    <link rel=\"stylesheet\" href=\"assets/css/fontawesome.css\">\n"
                    + "    <link rel=\"stylesheet\" href=\"assets/css/tooplate-main.css\">\n"
                    + "    <link rel=\"stylesheet\" href=\"assets/css/owl.css\">\n"
                    + "    <link rel=\"stylesheet\" href=\"assets/css/flex-slider.css\">\n"
                    + "    <!-- Link de ventana emergente -->\n"
                    + "    <script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>\n"
                    + "<!--\n"
                    + "Tooplate 2114 Pixie\n"
                    + "https://www.tooplate.com/view/2114-pixie\n"
                    + "-->\n"
                    + "  </head>\n"
                    + "\n"
                    + "  <body>\n"
+ "    <!-- Pre Header -->\n"
+ "    <div id=\"pre-header\" class=\"login-menu\">\n"
+ "      <div class=\"container\">\n"
+ "        <div class=\"row\">\n"
+ "          <div class=\"col-md-12\">\n"
+ "            <ul>\n"
+ "              <!--<li><a href=\"login.html\"><i class=\"fa fa-user\"></i> Ingresar</a></li>-->\n"
+ "              <li class=\"cart\"><a role=\"button\" class=\"button producto\" href=\"favoritos.jsp\"><i class=\"fa fa-heart\"></i></a></li> "
+ "              <li class=\"cart\"><a role=\"button\" class=\"button producto\" href=\"dis_cart.jsp\"><i class=\"fa fa-shopping-cart\"></i></a></li> "
+ "              <li ><a href=\"LogOut\">  Salir  <i class=\"fa fa-sign-out\"></i></a></li>\n"
+ "            </ul>\n"
+ "          </div>\n"
+ "        </div>\n"
+ "      </div>\n"
+ "    </div>\n"
+ "    \n"
+ "\n"
+ "    <!-- Navigation -->\n"
+ "    <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark static-top\">\n"
+ "      <div class=\"container\">\n"
+ "        <a class=\"navbar-brand\" ><img src=\"assets/images/header-logo.jpg\" height=\"48px\" width=\"170px\" alt=\"\"></a>\n"
+ "        <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarResponsive\" aria-controls=\"navbarResponsive\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n"
+ "          <span class=\"navbar-toggler-icon\"></span>\n"
+ "        </button>\n"
+ "        <div class=\"collapse navbar-collapse\" id=\"navbarResponsive\">\n"
+ "          <ul class=\"navbar-nav ml-auto\">\n"
+ "            <li class=\"nav-item\">\n"
+ "              <a class=\"nav-link\" href=\"indexwl.jsp\"><i class=\"fa fa-home\"></i> Inicio\n"
+ "              </a>\n"
+ "            </li>\n"
+ "            <li class=\"nav-item active\">\n"
+ "              <a class=\"nav-link\" href=\"products.jsp\"><i class=\"fa fa-tags\"></i> Productos\n"
+ "              <span class=\"sr-only\">(current)</span></a>\n"
+ "            </li>\n"
+ "            <li class=\"nav-item\">\n"
+ "              <a class=\"nav-link\" href=\"about.jsp\"><i class=\"fa fa-users\"></i> Acerca de nosotros</a>\n"
+ "            </li>\n"
+ "            <li class=\"nav-item\">\n"
+ "              <a class=\"nav-link\" href=\"contact.jsp\"><i class=\"fa fa-envelope\"></i> Contáctanos</a>\n"
+ "            </li>\n"
+ "          </ul>\n"
+ "        </div>\n"
+ "      </div>\n"
+ "    </nav>"
+ "\n"
+ "    <!-- Page Content -->\n"
+ "    <!-- Single Starts Here -->\n"
+ "    <div class=\"single-product\">\n"
+ "      <div class=\"container\">\n"
+ "        <div class=\"row\">\n"
+ "          <div class=\"col-md-12\">\n"
+ "            <div class=\"section-heading\">\n"
+ "              <div class=\"line-dec\"></div>\n"
+ "              <h1>Producto Elegido</h1>\n"
+ "            </div>\n"
+ "          </div>"
+ "<div class=\"col-md-6\">\n"
+ "            <div class=\"product-slider\">\n"
+ "              <div id=\"slider\" class=\"flexslider\">\n"
+ "                <ul class=\"slides\">\n"
+ "                  <li>\n"
+ "                    <img src=" + imagen + ">\n"
+ "                  </li>\n"
+ "                </ul>\n"
+ "              </div>\n"
+ "            </div>\n"
+ "          </div>\n"
+ "          <div class=\"col-md-6\">\n"
+ "            <div class=\"right-content\">\n"
+ "              <h4>" + nombre + ": </h4>\n"
+ "              <h6>" + precio + "</h6>\n"
+ "              <p>" + descripcion + "</p>\n"
+ "              <button " + type + " class=\"btn btn-success pb-2\"><i class=\"fa fa-whatsapp\"></i><a class=\" text-white \" href=\"" + link + "\"> Solicitar Información</a></button>\n"
+ "              <br>                    \n"
+ "              <a class=\"btn btn-primary pr-2 pb-2 mt-2\" href=\"products.jsp\">Seguir Navegando</a>\n"
+ "              <div class=\"clearfix\">                                 \n"
+ "             <!-- form 4 add product 2 cart -->\n"
+ "                 <form action=\"carrito.jsp\" method=\"post\" class=\"float-left mt-2 \">\n"
+ "                    <div hidden>\n"
+ "                      <input hidden id=\"usuario\" name=\"usr\" value=\"" + usuario + "\">\n"
+ "                      <input hidden id=\"art\" name=\"art\" value=\"" + art + "\">\n"
+ "                    </div>\n"
+ "                   <label for=\"quantity\">Cantidad:</label>\n"
+ "                   <input name=\"cantidad\" type=\"number\" class=\"quantity-number\" id=\"cantidad\" value=\"1\" min=\"1\" max=\"10\" minlength=\"1\" maxlength=\"2\" > \n"
+ "                     <button type=\"submit\" class=\"btn btn-dark text-white ml-3 py-2\"><i class=\"fa fa-shopping-cart\"></i></button>\n"
+ "                    <br><br>\n"
+ "                 </form>\n"
+ "             <!-- form 4 add product 2 favourites -->\n"
+ "                <form action=\"favourite.jsp\" method=\"post\" class=\"float-left pl-3 mt-2  \">\n"
+ "                  <div hidden>\n"
+ "                   <input hidden id=\"usuario\" value=\"" + usuario + "\">\n"
+ "                      <input hidden id=\"art\" name=\"art\" value=\"" + art + "\">\n"
+ "                    </div>\n"
+ "                    <button type=\"submit\" class=\"btn btn-danger py-2\"><i class=\"fa fa-heart-o\"></i></button>\n"
+ "                  </form>\n"
+ "              </div>                                \n"
+ "              <br><br>                        \n"
+ "              <div class=\"down-content\">\n"
+ "                <div class=\"share\">\n"
+ "                  <h6>Compartir vía: <span><a href=\"#\"><i class=\"fa fa-facebook\"></i></a><a href=\"#\"><i class=\"fa fa-linkedin\"></i></a><a href=\"#\"><i class=\"fa fa-twitter\"></i></a></span></h6>\n"
+ "                </div>\n"
+ "              </div>\n"
+ "            </div>\n"
+ "          </div>\n"
+ "        </div>\n"
+ "      </div>\n"
+ "    </div>\n"
+ "<hr>"
+ "    <!-- Single Page Ends Here -->\n"
+ "\n"
+ "\n"
+ "    </div>\n"
+ "          </div>\n"
+ "        </div>\n"
+ "      </div>\n"
+ "    </div>\n"
+ "    <!-- Similar Ends Here -->\n"
+ "\n"
+ "\n"
+ "    <!-- Subscribe Form Starts Here -->\n"
+ "    <div class=\"subscribe-form\">\n"
+ "      <div class=\"container\">\n"
+ "        <div class=\"row\">\n"
+ "          <div class=\"col-md-12\">\n"
+ "            <div class=\"section-heading\">\n"
+ "              <div class=\"line-dec\"></div>\n"
+ "              <h1>¡Aprovecha ofertas de temporada!</h1>\n"
+ "            </div>\n"
+ "          </div>\n"
+ "          <div class=\"col-md-8 offset-md-2\">\n"
+ "            <div class=\"main-content\">\n"
+ "              <p>En la compra superior a $1000 MXN el costo de envío va por nuestra cuenta</p>\n"
+ "              </div>\n"
+ "          </div>\n"
+ "        </div>\n"
+ "      </div>\n"
+ "    </div>\n"
+ "    <!-- Subscribe Form Ends Here -->\n"
+ "\n"
+ "\n"
+ "    \n"
+ "  \n"
+ "<!-- Footer Starts Here -->\n"
+ "<div class=\"footer\">\n"
+ "  <div class=\"container\">\n"
+ "    <div class=\"row\">\n"
+ "      <div class=\"col-md-12\">\n"
+ "        <div class=\"logo\">\n"
+ "          <img src=\"assets/images/lo.jpg\" height=\"70px\" width=\"165px\" alt=\"\">\n"
+ "        </div>\n"
+ "      </div>\n"
+ "      <div class=\"col-md-12\">\n"
+ "        <div class=\"footer-menu\">\n"
+ "          <ul>\n"
+ "            <li><a href=\"indexwl.jsp\">Inicio</a></li>\n"
+ "            <li><a href=\"help.jsp\">Ayuda</a></li>\n"
+ "            <li><a href=\"politics.jsp\"> <span>Politicas de privacidad</a> </li>\n"
+ "            <li><a href=\"contact.jsp\">Contáctanos</a></li>\n"
+ "          </ul>\n"
+ "        </div>\n"
+ "      </div>\n"
+ "      <div class=\"col-md-12\">\n"
+ "        <div class=\"social-icons\">\n"
+ "          <ul>\n"
+ "            <li><a href=\"https://www.facebook.com/The-World-Of-Creations-107994600676781/\"><i class=\"fa fa-facebook\"></i></a></li>\n"
+ "            <li><a href=\"https://web.whatsapp.com/\"><i class=\"fa fa-whatsapp\"></i></a></li>\n"
+ "            \n"
+ "            <li><a href=\"https://www.instagram.com/the_world_of_creations_\"><i class=\"fa fa-instagram\"></i></a></li>\n"
+ "          </ul>\n"
+ "        </div>\n"
+ "      </div>\n"
+ "    </div>\n"
+ "  </div>\n"
+ "</div>\n"
+ "<!-- Footer Ends Here -->\n"
+ "\n"
+ "\n"
+ "    <!-- Sub Footer Starts Here -->\n"
+ "    <div class=\"sub-footer\">\n"
+ "      <div class=\"container\">\n"
+ "        <div class=\"row\">\n"
+ "          <div class=\"col-md-12\">\n"
+ "            <div class=\"copyright-text\">\n"
+ "              <p>Copyright &copy; 2020 The World Of Creations</p>\n"
+ "            </div>\n"
+ "          </div>\n"
+ "        </div>\n"
+ "      </div>\n"
+ "    </div>\n"
+ "    <!-- Sub Footer Ends Here -->\n"
+ "\n"
+ "\n"
+ "    <!-- Bootstrap core JavaScript -->\n"
+ "    <script src=\"vendor/jquery/jquery.min.js\"></script>\n"
+ "    <script src=\"vendor/bootstrap/js/bootstrap.bundle.min.js\"></script>\n"
+ "\n"
+ "\n"
+ "    <!-- Additional Scripts -->\n"
+ "    <script src=\"assets/js/custom.js\"></script>\n"
+ "    <script src=\"assets/js/owl.js\"></script>\n"
+ "    <script src=\"assets/js/isotope.js\"></script>\n"
+ "    <script src=\"assets/js/flex-slider.js\"></script>\n"
+ "    \n"
+ "\n"
+ "\n"
+ "\n"
+ "\n"
                    + "  </body>\n"
                    + "\n"
                    + "</html>");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void destroy() {
        try {
            rs.close();
            pr.close();
            con.close();
        } catch (Exception e) {
            super.destroy();
        }
    }

}
