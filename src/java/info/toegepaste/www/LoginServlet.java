/*
    This file is part of javaProject2TI.

    javaProject2TI is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    javaProject2TI is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with javaProject2TI.  If not, see <http://www.gnu.org/licenses/>.
*/
package info.toegepaste.www;

import info.toegepaste.www.entity.Docent;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author robin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        EntityManagerFactory emf = null;
        HttpSession session = request.getSession();
        try {

            RequestDispatcher rd = null;
            emf = Persistence.createEntityManagerFactory("2TI3_Cominotto_Robin_project2013PU");
            EntityManager em = emf.createEntityManager();
            if (request.getParameter("inloggen") != null) {

                String gebruikersnaam = request.getParameter("gebruikersnaam");
                String wachtwoord = request.getParameter("wachtwoord");
                Query q = em.createNamedQuery("Docenten.inloggen");
                q.setParameter("voornaam", gebruikersnaam);
                q.setParameter("familienaam", wachtwoord);
                List<Docent> docent = q.getResultList();
                em.close();
                if (!docent.isEmpty()) {

                    session.setAttribute("ingelogd", docent.get(0));
                    response.sendRedirect("ManageServlet?examen=examen");
                } else {
                    String boodschap = "Verkeerde login gegevens!";
                    String titel = "Login error";

                    request.setAttribute("boodschap", boodschap);
                    request.setAttribute("titel", titel);
                    rd = request.getRequestDispatcher("boodschap.jsp");
                    rd.forward(request, response);
                }



            } else if (request.getParameter("uitloggen") != null) {

                session.invalidate();


                response.sendRedirect("ManageServlet?examen=examen");

            } else if (request.getParameter("inloggenPagina") != null) {



                response.sendRedirect("login.jsp");

            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
