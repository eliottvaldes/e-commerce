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


public class RegistroUsuario extends HttpServlet {

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
            try{int priv_usr = 0;
                if(!(pas1.equals(pas2))){
                    message ="<h2>Las contraseñas no concuerdan,ingresalas de nuevo</h2>";
                }else{
                    pas_usr = pas1;
                    set = con.createStatement();
                    rs = set.executeQuery("SELECT * FROM usuario");
                    boolean existe= false;

                    while(rs.next()){
                        if (user_usr.equals(rs.getString("user_usr"))){
                            existe = true;
                            break;
                        }
                    }

                    if (existe==true){
                        message = "<h2 class=\"tm-block-title mt-3\">Ese usuario ya existe en el sistema</h2>\n"
                                + "<a href=\"singup.html\">Da click aqui e intentalo de nuevo</a>\n";
                    }else{
                        Validacion v = new Validacion();
                        if(v.validarName(name_usr)==false){
                            message = "<h2 class=\"tm-block-title mt-3\">Ingresa solo letras en el nombre, no debe ser mayor a 30 caracteres</h2>\n"
                                    + "<a href=\"singup.html\">Da click aqui e intentalo de nuevo</a>\n";
                        }else{
                            if( v.validarApellidos(appat_usr)==false || v.validarApellidos(apmat_usr)==false ){
                                message = "<h2 class=\"tm-block-title mt-3\">Ingresa solo letras en los apellido, no debe ser mayor a 20 caracteres</h2>\n"
                                        + "<a href=\"singup.html\">Da click aqui e intentalo de nuevo</a>\n";
                            }else{
                                if(v.validarEmail(ema_usr)==false){
                                    message = "<h2 class=\"tm-block-title mt-3\">El correo que ingresaste no es valido, no debe ser mayor a 50 caracteres</h2>\n"
                                            + "<a href=\"singup.html\">Da click aqui e intentalo de nuevo</a>\n";
                                }else{
                                    if(v.validarUserName(user_usr)==false){
                                        message = "<h2 class=\"tm-block-title mt-3\">El nombre de usuario que ingresaste no es valido, no debe ser mayor a 20 caracteres</h2>\n"
                                                + "<a href=\"singup.html\">Da click aqui e intentalo de nuevo</a>\n";
                                    }else{
                                        if(v.validarPass(pas_usr)==false){
                                            message = "<h2 class=\"tm-block-title mt-3\">La contraseña debe tener tener entre 6 y 15 caracteres</h2>\n"
                                                    + "<a href=\"singup.html\">Da click aqui e intentalo de nuevo</a>\n";
                                        }else{
                                            
                                            String part1 =user_usr.substring(0,2);
                                            String part2 =pas_usr.substring(0,2);
                                            String part3 =user_usr.substring(2,4);
                                            String part4 =pas_usr.substring(2,4);
                                            String part5 =pas_usr.substring(4,6);
                                            String part6 =pas_usr.substring(6,8);
                                            //llave de 16 caracteres para cifrar con aes de 128 bits
                                            //String key16 = part1+"?"+part5+part2.toUpperCase()+"#"+part4.toUpperCase()+"$"+part3+part6.toUpperCase()+"%";                                            
                                            String key16="8$m@S4@7g8Tv&#Za";
                                            //System.err.println("\nla llave para cifrar es: "+key16 + " y tiene una longitud de: "+key16.length()+" caracteres\n\n");                                            
                                            //posible llave de 32 caracteres para un cifrado aes de 264 bits
                                            //String key32 = part1+"?"+part2+"/"+part5.toUpperCase()+"#"+part4.toUpperCase()+"$"+part3+"¿"+part6.toUpperCase()+"%"+part1.toUpperCase()+"^"+part2.toUpperCase()+"!"+part3.toUpperCase()+"<"+part5+">"+part4;;                                                                                        
                                            
                                            String q = "INSERT INTO usuario VALUES(" + id_usr + ",  AES_ENCRYPT('" + name_usr + "','" + key16 + "'),  AES_ENCRYPT('" + appat_usr + "','" + key16 + "'),  AES_ENCRYPT('" + apmat_usr + "','" + key16 + "'), '" + user_usr + "', AES_ENCRYPT('" + ema_usr + "','" + key16 + "'), AES_ENCRYPT('" + pas_usr + "','" + key16 + "'), " + priv_usr + ")";
                                            
                                            set.executeUpdate(q);
                                            message = "<h2 class=\"tm-block-title mt-3\">¡Registro completado!</h2>\n"
                                                    + "<a href=\"login.jsp\">Da click aqui para iniciar sesion</a>\n";
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
"    <head>\n" +
"\n" +
"        <meta charset=\"utf-8\">\n" +
"        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n" +
"        <meta name=\"description\" content=\"\">\n" +
"        <meta name=\"author\" content=\"\">\n" +
"        <link href=\"https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700\" rel=\"stylesheet\">\n" +
"    \n" +
"        <title>CuteMark México - Tienda Online</title> \n" +
"        <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,400,600\">\n" +
"        <!-- https://fonts.google.com/specimen/Open+Sans -->\n" +
"        <link rel=\"stylesheet\" href=\"assets/css_crud/fontawesome.min.css\">\n" +
"        <!-- https://fontawesome.com/ -->\n" +
"        <link rel=\"stylesheet\" href=\"assets/css_crud/fullcalendar.min.css\">\n" +
"        <!-- https://fullcalendar.io/ -->\n" +
"        <link rel=\"stylesheet\" href=\"assets/css_crud/bootstrap.min.css\">\n" +
"        <!-- https://getbootstrap.com/ -->\n" +
"        <link rel=\"stylesheet\" href=\"assets/css_crud//tooplate.css\">\n" +
"      </head>\n" +
"<body>\n" +
"    <body class=\"bg03\">\n" +
"        <div class=\"container\">\n" +
"            <div class=\"row tm-mt-big\">\n" +
"                <div class=\"col-12 mx-auto tm-login-col\">\n" +
"                    <div class=\"bg-white tm-block\">\n" +
"                        <div class=\"row\">\n" +
"                            <div class=\"col-12 text-center\">\n" +
"                                <img src=\"assets/images/error.png\" alt=\"error\">\n" +
"                                "+message+
"                                "+
"                            </div>\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"            <footer class=\"row tm-mt-big\">\n" +
"                <div class=\"col-12 font-weight-light text-center\">\n" +
"                    <p class=\"d-inline-block tm-bg-black text-white py-2 px-4\">\n" +
"                        Copyright &copy; 2020 The World Of Creations\n" +
"                    </p>\n" +
"                </div>\n" +
"            </footer>\n" +
"        </div>\n" +
"    </body>\n" +
"</body>\n" +
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
