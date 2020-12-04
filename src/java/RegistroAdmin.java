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
public class RegistroAdmin extends HttpServlet {

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
                Usuario u = new Usuario();
                int id_usr = u.crearId();
                String name_usr = request.getParameter("name");
                String appat_usr = request.getParameter("appat");
                String apmat_usr = request.getParameter("apmat");
                String user_usr = request.getParameter("username");
                String ema_usr = request.getParameter("email");
                String pas_usr="";
                String pas1 = request.getParameter("password");
                String pas2 = request.getParameter("password2");
                String message ="";
            try{int priv_usr = 1;
                if(!(pas1.equals(pas2))){
                    message ="<h2>Las contraseñas no concuerdan,ingresalas de nuevo</h2>";
                }else{
                    pas_usr = pas1;
                    set = con.createStatement();
                    rs = set.executeQuery("select * from usuario");
                    boolean existe= false;

                    while(rs.next()){
                        if (user_usr.equals(rs.getString("user_usr"))){
                            existe = true;
                            break;
                        }
                    }

                    if (existe==true){
                        message = "<h1>Ese usuario ya existe en el sistema</h1>\n";
                    }else{
                        Validacion v = new Validacion();
                        if(v.validarName(name_usr)==false){
                            message = "<h1>Ingresa solo letras en el nombre, no debe ser mayor a 30 caracteres</h1>\n";
                        }else{
                            if( v.validarApellidos(appat_usr)==false || v.validarApellidos(apmat_usr) == false){
                                message = "<h1>Ingresa solo letras en los apellidos, no debe ser mayor a 20 caracteres</h1>\n";
                            }else{
                                if(v.validarEmail(ema_usr)==false){
                                    message = "<h1>El correo que ingresaste no es valido, no debe ser mayor a 50 caracteres</h1>\n";
                                }else{
                                    if(v.validarUserName(user_usr)==false){
                                        message = "<h1>El nombre de usuario que ingresaste no es valido, no debe ser mayor a 20 caracteres</h1>\n";
                                    }else{
                                        if(v.validarPass(pas_usr)==false){
                                            message = "<h1>La contraseña debe tener tener entre 6 y 15 caracteres</h1>\n";
                                        }else{
                                            System.out.println(id_usr);
                                            
                                            String part1 =user_usr.substring(0,2);
                                            String part2 =pas_usr.substring(0,2);
                                            String part3 =user_usr.substring(2,4);
                                            String part4 =pas_usr.substring(2,4);
                                            String part5 =pas_usr.substring(4,6);
                                            String part6 =pas_usr.substring(6,8);
                                            //llave de 16 caracteres para cifrar con aes de 128 bits
                                            String key16 = part1+"?"+part5+part2.toUpperCase()+"#"+part4.toUpperCase()+"$"+part3+part6.toUpperCase()+"%";                                            
                                            System.err.println("\nla llave para cifrar es: "+key16 + " y tiene una longitud de: "+key16.length()+" caracteres\n\n");                                                                                        
                                                                                        
                                            String q = "INSERT INTO usuario VALUES(" + id_usr + ",  AES_ENCRYPT('" + name_usr + "','" + key16 + "'),  AES_ENCRYPT('" + appat_usr + "','" + key16 + "'),  AES_ENCRYPT('" + apmat_usr + "','" + key16 + "'), '" + user_usr + "', AES_ENCRYPT('" + ema_usr + "','" + key16 + "'), AES_ENCRYPT('" + pas_usr + "','" + key16 + "'), " + priv_usr + ")";
                                            set.executeUpdate(q);
                                            message = "<h1 class=\"tm-block-title mt-3\">¡Administrador registrado!</h1>\n";
                                        }
                                    }
                                    
                                }
                            }
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
"    <title>Agregar Administrador</title>\n" +
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
"                                    <a class=\"dropdown-item\" href=\"#\">Consultar ventas totales</a>\n"+
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

