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
        PrintWriter out = response.getWriter();
        out.print(""
        + "<div style=\"background-color:black; margin-bottom:-17px;\">\n"
        + " <div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">\n"
        + "  <strong>¡Sesión cerrada exitosamente!</strong> Esperamos verte pronto.\n"
        + "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n"
        + "    <span aria-hidden=\"true\">&times;</span>\n"
        + "  </button>\n"
        + " </div>\n"
        + "</div>\n"
        + "");
        request.getRequestDispatcher("index.html").include(request, response);
        HttpSession session = request.getSession();
        session.invalidate();        
        out.close();
        request.getRequestDispatcher("index.html").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
