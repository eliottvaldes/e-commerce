/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Melyz
 */
public class NuevoArticulo extends HttpServlet {

    private Connection con;
    private Statement set;
    private ResultSet rs;
    
    public void init(ServletConfig cfg) throws ServletException {
    String URL = "jdbc:mysql:3306//localhost/carrito"; //se traza la ruta de conexion, donde esta la bd
    String userName = "root"; //se determina el usuario de conexion de mysql
    String password = "n0m3l0"; //n0m3l0 //el password si es que cuenta con uno
    try {
        Class.forName("com.mysql.jdbc.Driver");//esto es el driver
        //ya que esta el driver se debe establecer la conexión
        URL = "jdbc:mysql://localhost/carrito";
        con = DriverManager.getConnection(URL,userName,password);
        
        //Preapramos la sentencia para la conexión a la BD
        set = con.createStatement();
        
        //Verificamos la conexión
        System.out.println("Si hay base w");
    } catch (Exception e) {
        //Si no encuentra la base
        System.out.println("No se hay base T_T");
        System.out.println(e.getMessage());
        System.out.println(e.getStackTrace());
    }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
         try (PrintWriter out = response.getWriter()){
        response.setContentType("text/html;charset=UTF-8");
        out.println("<html lang=\"en\">\n" +
            "\n" +
            "<head>\n" +
            "    <meta charset=\"UTF-8\">\n" +
            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
            "    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n" +
            "    <title>Agregar Articulo</title>\n" +
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
"                        </ul>"+
            "                    </div>\n" +
            "                </nav>\n" +
            "            </div>\n" +
            "        </div>"
                + "<div class=\"row tm-content-row tm-mt-big\">\n" +
"            <div class=\"tm-col tm-col-big\">\n" +
"                <div class=\"bg-white tm-block\">\n" +
"                    <div class=\"row\">");
        FileItemFactory file_factory = new DiskFileItemFactory();
        ServletFileUpload sfu = new ServletFileUpload(file_factory);
        
        int id_art=0;
        String nom_art ="";
        String des_art ="";
        String wts_art ="";
        float prc_art =0;
        int stock_art =0;
        String img_art = "";
        ArrayList<String> campos = new ArrayList<>();
        //Este es para que guarde la ruta de la img para la bd
        ArrayList<String> imgs = new ArrayList<>();
        boolean guardo = true;
        try{
            List items = sfu.parseRequest(request);
            for (int i = 0; i < items.size(); i++) {
                FileItem item = (FileItem) items.get(i);
                //formfield se refiere a los campos de formulario de cualquier tipo que no sea "file"
                if (!item.isFormField()) {
                    //Osea que es de tipo file, so la guardamos en el servidor en la ruta correcta
                    File archivo = new File("C:\\Users\\Eliot\\Documents\\ACatalogo\\CatalogoPA\\web\\assets\\images\\"+item.getName());
                    //Le pasamos la ruta:
                    
                    item.write(archivo);
                    imgs.add("assets/imgProductos/"+item.getName());
                }else{
                    //va a ser un campo texto o number o etc
                    campos.add(item.getString());
                }
            }
                Articulo art = new Articulo();
                Validacion v = new Validacion();
                if(v.validarArticulo(campos.get(0))==false){
                    out.println("<h1>No es valido ese nombre para el articulo</h1>");
                    guardo=false;
                }else{
                    nom_art = campos.get(0);
                    if(v.validarDescripcion(campos.get(1))==false){
                        out.println("<h1>La descripcion es muy larga</h1>");
                        guardo=false;
                    }else{
                        if (v.validarPrecio(campos.get(2))==false) {
                            out.println("<h1>No es valido ese precio para el articulo</h1>");
                            guardo=false;
                        }else{
                            prc_art = Float.parseFloat(campos.get(2));
                            if (v.validarStock(campos.get(3))==false) {
                                out.println("<h1>No es valido esa cantidad para el articulo</h1>");
                                guardo=false;
                            }else{
                                stock_art = Integer.parseInt(campos.get(3));
                                img_art = imgs.get(0);
                                id_art = art.crearId();
                                des_art = campos.get(1);
                                wts_art = campos.get(4);
                                guardo = true;
                            }
                        }
                    }
                }
            }catch(Exception ex){
            ex.printStackTrace();
            ex.getMessage();
            guardo = false;
            }
        
                System.out.println(guardo);
                try{
                    boolean existe = false;
                    if(guardo==true){
                        
                        set = con.createStatement();
                        rs = set.executeQuery("select * from articulo");
                        
                        while(rs.next()){
                            if (nom_art.equalsIgnoreCase(rs.getString("nom_art"))) {
                                out.println("<h1>Ya existe ese artculo dentro del carrito</h1>");
                                existe = true;
                                break;
                            }
                        }
                        if (existe==false) {
                            String q = "insert into articulo (id_art, nom_art, des_art, prc_art, stock_art, img_art, wts_art) values("+id_art+", '"+nom_art+"', '"+des_art+"', "+prc_art+", "+stock_art+", '"+img_art+"', '"+wts_art+"')";
                            set.executeUpdate(q);                  
                            out.println("<h1>¡Artículo Registrado!<h1>");
                            System.out.println("Todo cool");
                        }
                        
                    }
                    else{
                        out.println("<br><h2>Hubo un problema al entrar, debiste haber ingresado mal los datos</h2>");
                    }
                    
                    }catch(Exception e){
                    System.out.println("No encontro la tabla");
                    out.println("<br><h2>Hubo un problema al guardar el articulo,intentalo de nuevo</h2>");
                    System.out.println(e.getMessage());
                    System.out.println(e.getStackTrace());
                    }finally{
                    try{
                        rs.close();
                        set.close();
                        con.close();
                    }catch(SQLException ex){
                    ex.printStackTrace();
                    System.out.println(ex.getMessage());
                    }
                    
                }
                out.println("</div>"
                            + "<div class=\"row\">\n" +
"                            <h1 class=\"tm-block-title d-inline-block\">Intentalo de nuevo o elige que más deseas de hacer en el menú :3</h1>\n" +
"                            </div>"
                            + "</div>\n" +
"                           </div>"
                            + "</div>\n" +
                "            </div>\n" +
                "            \n" +
                "        </div>\n" +
                "        <footer class=\"row tm-mt-small\">\n" +
                "            <div class=\"col-12 font-weight-light\">\n" +
                "                <p class=\"d-inline-block tm-bg-black text-white py-2 px-4\">\n" +
                "                    Copyright &copy; 2018 Admin Dashboard . Created by\n" +
                "                    <a rel=\"nofollow\" href=\"https://www.tooplate.com\" class=\"text-white tm-footer-link\">Tooplate</a>\n" +
                "                </p>\n" +
                "            </div>\n" +
                "        </footer>\n" +
                "    </div>\n" +
                "\n" +
                "    <script src=\"js/jquery-3.3.1.min.js\"></script>\n" +
                "    <!-- https://jquery.com/download/ -->\n" +
                "    <script src=\"js/bootstrap.min.js\"></script>\n" +
                "    <!-- https://getbootstrap.com/ -->"
                            + "</body>");
                    out.println("</html>");
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
