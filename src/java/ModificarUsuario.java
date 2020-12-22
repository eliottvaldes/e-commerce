import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Melyz
 */
public class ModificarUsuario extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                String id= request.getParameter("id");
                int id_usr=0;
                String message ="";
                int priv_usr = 0;
                String tipo = request.getParameter("tipo");
            try{
                Validacion v = new Validacion();
                if(v.validarStock(id)==false){
                    message ="<h2>El numero de lista no puede contener caracteres distintos a números</h2>";
                }else{
                    id_usr = Integer.parseInt(id);
                    set = con.createStatement();
                    rs = set.executeQuery("select * from usuario");
                    boolean existe= false;

                    while(rs.next()){
                        if (id_usr == rs.getInt("id_usr")){
                            existe = true;
                            break;
                        }
                    }
                    if (existe==false) {
                        message ="<h2>No existe ese numero de lista</h2>";
                    }else{
                        if(tipo.equalsIgnoreCase("Administrador")||tipo.equalsIgnoreCase("Cliente")){
                                            if (tipo.equalsIgnoreCase("Administrador")) {
                                                priv_usr = 1;
                                            }else{
                                                priv_usr=0;
                                            }
                                            String q = "update usuario set priv_usr= "+priv_usr+" where id_usr = "+id_usr;
                                            set.executeUpdate(q);
                                            message = "<h2 class=\"tm-block-title mt-3\">Se modificaron los datos del usuario</h2>\n";
                                        }else{
                                            message = "<h2 class=\"tm-block-title mt-3\">No ingresaste un tipo de usuario valido</h2>\n";
                                        }
                    }
                                
                            
                        
                }    
                
            }catch(Exception e){
                System.out.println("No encontro la tabla");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
             out.println("<html lang=\"en\">\n" +
"\n" +
"<head>\n" +
"    <meta charset=\"UTF-8\">\n" +
"    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
"    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
"    <title>Modificar Ususario</title>\n" +
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
/*"                            <li class=\"nav-item dropdown\">\n" +
"                                <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\"\n" +
"                                    aria-expanded=\"false\">\n" +
"                                    Ventas\n" +
"                                </a>\n" +
"                                <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n" +
"                                    <a class=\"dropdown-item\" href=\"chooseTicket.jsp\">Consultar ventas (Tickets)</a>\n"+
"                                </div>\n" +
"                            </li>\n" +
*/"                        </ul>\n" +
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
"        <!-- row -->\n" +
"        <br>\n" +
"            <div style=\"text-align: center; width: 70%; margin-left: 15%;\">\n"
                    + "<div class=\"bg-white tm-block\">" +
"                "+message+
"            </div>\n"
        + "</div>\n" +
"        </div>\n" +
"        <footer class=\"row tm-mt-small\">\n" +
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
