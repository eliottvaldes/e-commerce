import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SVerificarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String user_usr, pas_usr;
            
            user_usr = request.getParameter("username");
            pas_usr = request.getParameter("password");
            
            
            Usuario u = new Usuario();
            
            u = u.verificarUsuario(user_usr, pas_usr);
            
            if(u != null){
                //El usuario existe
                //Por lo tanto esta seion es verdadera
                //En este revisa que el usuario exista en la bd
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", u);
                
                //Pero la verificamos
                //Este es para poder mostrar la pagina de inicio
                HttpSession sesionOk = request.getSession();
                sesionOk.setAttribute("usuario", user_usr);
                
                if(u.getPriv_usr() == 0){
                    //Si es un cliente lo manda a la pagina de inicio pra clientes
                    response.sendRedirect("indexwl.jsp");
                }else{
                    //Si es un administrador lo manda a las paginas de admin
                    response.sendRedirect("dashboard.jsp");
                }
            }else{
                //Si el usuario no exite o ingreso mal el nombre o la contraseña lo manda a una pagina de errores
                HttpSession sesionFalse = request.getSession();
                sesionFalse.invalidate();
                response.sendRedirect("error.jsp");                
            }
        }
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

}
