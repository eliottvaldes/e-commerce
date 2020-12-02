/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eliot
 */
public class LogOut extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();                          
            request.getRequestDispatcher("index.html").include(request, response);                
            HttpSession session=request.getSession();  
            session.invalidate();                
            out.print("Has salido exitosamente de tu sesión!");                
            out.close();  
            request.getRequestDispatcher("index.html").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
