import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Melyz
 */
public class VerTicket extends HttpServlet {

    private Connection con;
    private Statement set;
    private ResultSet rs;
    
    public void init(ServletConfig cfg) throws ServletException {
    String URL = "jdbc:mysql:3306//localhost/carrito"; //se traza la ruta de conexion, donde esta la bd
    String userName = "root"; //se determina el usuario de conexion de mysql
    String password = "n0m3l0"; //n0m3l0 //el password si es que cuenta con uno
    try {
        Class.forName("com.mysql.jdbc.Driver");
        URL = "jdbc:mysql://localhost/carrito";
        con = DriverManager.getConnection(URL,userName,password);
        
        set = con.createStatement();
        
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html lang=\"en\">\n" +
"\n" +
"<head>\n" +
"    <meta charset=\"UTF-8\">\n" +
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
"    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
"    <title>Ver Ticket</title>\n" +
"    <!--\n" +
"\n" +
"    Template 2108 Dashboard\n" +
"\n" +
"	http://www.tooplate.com/view/2108-dashboard\n" +
"\n" +
"    -->\n" +
"    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400,600\">\n" +
"    <!-- https://fonts.google.com/specimen/Open+Sans -->\n" +
"    <link rel=\"stylesheet\" href=\"css/fontawesome.min.css\">\n" +
"    <!-- https://fontawesome.com/ -->\n" +
"    <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n" +
"    <!-- https://getbootstrap.com/ -->\n" +
"    <link rel=\"stylesheet\" href=\"css/tooplate.css\">\n" +
"</head>\n" +
"\n" +
"<body class=\"bg03\">\n" +
"    <div class=\"container\">\n" +
"        <div class=\"row\">\n" +
"            <div class=\"col-12\">\n" +
"                <nav class=\"navbar navbar-expand-xl navbar-light bg-light\">\n" +
"                    <a class=\"navbar-brand\" href=\"dashboard.jsp\">\n" +
"                        <i class=\"fas fa-3x fa-tachometer-alt tm-site-icon\"></i>\n" +
"                        <h1 class=\"tm-site-title mb-0\">Dashboard</h1>\n" +
"                    </a>\n" +
"                    <button class=\"navbar-toggler ml-auto mr-0\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\"\n" +
"                        aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n" +
"                        <span class=\"navbar-toggler-icon\"></span>\n" +
"                    </button>\n" +
"\n" +
"                    <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n" +
"                        <ul class=\"navbar-nav mx-auto\">\n" +
"                            <li class=\"nav-item\">\n" +
"                                <a class=\"nav-link\" href=\"dashboard.jsp\">Dashboard\n" +
"                                    <span class=\"sr-only\">(current)</span>\n" +
"                                </a>\n" +
"                            </li>\n" +
"                            <li class=\"nav-item dropdown\">\n" +
"                                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\"\n" +
"                                        aria-expanded=\"false\">Articulos</a>\n" +
"                                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n" +
"                                        <a class=\"dropdown-item\" href=\"conArticulo.jsp\">Consultar articulos</a>\n" +
"                                        <a class=\"dropdown-item\" href=\"addArticulo.jsp\">Agregar articulos</a>\n" +
"                                        <a class=\"dropdown-item\" href=\"modArticulo.jsp\">Modificar articulos</a>\n" +
"                                        <a class=\"dropdown-item\" href=\"eliArticulo.jsp\">Eliminar articulos</a>\n" +
"                                    </div>\n" +
"                                </li>\n" +
"\n" +
"                            <li class=\"nav-item dropdown\">\n" +
"                                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\"\n" +
"                                        aria-expanded=\"false\">Cuentas</a>\n" +
"                                    <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n" +
"                                        <a class=\"dropdown-item\" href=\"addAdmin.jsp\">Agregar Administrador</a>\n" +
"                                        <a class=\"dropdown-item\" href=\"conCuenta.jsp\">Consultar cuentas</a>\n" +
"                                        <a class=\"dropdown-item\" href=\"modCuenta.jsp\">Modificar cuenta</a>\n" +
"                                        <a class=\"dropdown-item\" href=\"eliCuenta.jsp\">Eliminar cuenta</a>\n" +
"                                    </div>\n" +
"                            </li>\n" +
"                            <li class=\"nav-item dropdown\">\n" +
"                                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\"\n" +
"                                    aria-expanded=\"false\">\n" +
"                                    Ventas\n" +
"                                </a>\n" +
"                                <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n" +
"                                    <a class=\"dropdown-item\" href=\"chooseTicket.jsp\">Consultar ventas (Tickets)</a>\n" +
"                                </div>\n" +
"                            </li>\n" +
"                        </ul>\n" +
"                        <ul class=\"navbar-nav\">\n" +
"                            <li class=\"nav-item\">\n" +
"                                <a class=\"nav-link d-flex\" href=\"index.html\">\n" +
"                                    <i class=\"far fa-user mr-2 tm-logout-icon\"></i>\n" +
"                                    <span>Salir</span>\n" +
"                                </a>\n" +
"                            </li>\n" +
"                        </ul>\n" +
"                    </div>\n" +
"                </nav>\n" +
"            </div>\n" +
"        </div>\n" +
"        <!--------------->\n"
                    + "<br>" +
"        <div class=\"bg-white tm-block\" style =\"width: 70%; margin-left: 15%;\">\n");
            try{
               String id = request.getParameter("id");
            int id_com = 0;
            Validacion v = new Validacion();
            if(v.validarStock(id)==false){
                out.println("<h2>Ese numero de lista no es valido</h2>");
            }else{
                id_com = Integer.parseInt(id);
                    set = con.createStatement();
                    rs = set.executeQuery("select * from compra");
                    boolean existe= false;

                    while(rs.next()){
                        if (id_com == rs.getInt("id_com")){
                            existe = true;
                            break;
                        }
                    }
                if(existe==false){
                    out.println("<h2>No existe ese numero de compra</h2>");
                }else{
                    int id_usr=0;
                    String user_usr = "";
                    String muestraArticulo = "";
                    double total = 0;
                    set = con.createStatement();
                    rs = set.executeQuery("select * from compra where id_com = "+id_com);

                    while(rs.next()){
                        id_usr = rs.getInt("id_usr");
                        total = rs.getDouble("total_com");
                    }
                    
                    set = con.createStatement();
                    rs = set.executeQuery("select * from usuario where id_usr = "+id_usr);

                    while(rs.next()){
                        user_usr = rs.getString("user_usr");
                    }
                    double iva = 0;
                    String detalle = "";
                    ArrayList id_art = new ArrayList();
                    set = con.createStatement();
                    rs = set.executeQuery("select * from dcompra where id_com = "+id_com);

                    while(rs.next()){
                        id_art.add(rs.getInt("id_art"));
                    }
                    ArrayList prc_art = new ArrayList();
                    ArrayList nom_art = new ArrayList();
                    for (int i = 0; i < id_art.size(); i++) {
                         set = con.createStatement();
                        rs = set.executeQuery("select * from articulo where id_art = "+id_art.get(i));

                        while(rs.next()){
                            nom_art.add(rs.getString("nom_art"));
                            prc_art.add(rs.getFloat("prc_art"));
                        }
                    }
                    
                    
                    set = con.createStatement();
                    rs = set.executeQuery("select * from dcompra where id_com = "+id_com);
                    int cont = 0;
                    double suma = 0;
                    while(rs.next()){
                        detalle += "<tr>\n" +
"                              <td>"+nom_art.get(cont)+" \n" +
"                              </td>\n" +
                               "<td>"+prc_art.get(cont)+" \n" +
"                              </td>\n"+
"                              <td>"+rs.getInt("cant_com")+" \n" +
"                              </td>\n" +
                               "<td>"+rs.getDouble("subt_com")+"\n" +
"                              </td>\n" +
"                          </tr>";
                        cont++;
                        suma += rs.getDouble("subt_com");
                    }
                    
                    iva = (suma)*0.16;
                    out.println("<h4># Compra: "+id+"</h4>"
                            + "<h4>Usuario que realizo la compra: "+user_usr+"</h4>"
                            + "<table class=\"table table-hover table-striped\">\n" +
"                    <tbody>"
                                    + "<td>Nombres de los Articulos\n" +
"\n" +
"                        </td>\n" +
                        "<td>Precio Unitario\n" +
"\n" +
"                        </td>\n" +                    
"                        <td>Cantidad\n" +
"\n" +
"                        </td>\n" +                   
"                        <td>Subtotal\n" +
"\n" +
"                        </td>"
           + "</tr>"
                                      + detalle
                     + "</tbody>"
                     + "</table>"
                             + "<h5 style=\"text-align:center;\">Iva: $"+iva+"</h5>"
                                     + "<h5 style=\"text-align:center;\">Total: $"+total+"</h5>");
                    
                }   
            } 
            }catch(Exception e){
                System.out.println("No encontro la tabla");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
            
      
            

out.println("        </div>\n" +
"        <!--------------->\n" +
"       <footer class=\"row tm-mt-small\">\n" +
"            <div class=\"col-12 font-weight-light\">\n" +
"                <p class=\"d-inline-block tm-bg-black text-white py-2 px-4 text-white tm-footer-link\">\n" +
"                    Copyright &copy; 2020 The World Of Creations\n" +
"                </p>\n" +
"            </div>\n" +
"        </footer>\n" +
"    </div>\n" +
"\n" +
"    <script src=\"js/jquery-3.3.1.min.js\"></script>\n" +
"    <!-- https://jquery.com/download/ -->\n" +
"    <script src=\"js/bootstrap.min.js\"></script>\n" +
"    <!-- https://getbootstrap.com/ -->\n" +
"</body>\n" +
"\n" +
"</html>");
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

    public void destroy(){
        try{
            rs.close();
            set.close();
            con.close();
        }catch(Exception e){
            super.destroy();
        }
    }
}
