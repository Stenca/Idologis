package org.rb.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.rb.servlets.Utilisateur;
import org.rb.servlets.DB;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Utilisateur extends HttpServlet {
    public Utilisateur() {

    }
    
    public static void main(String[] args) {
        DB bddtest = new DB();
        bddtest.connect();
        try {
            bddtest.execute("test");
        } catch (SQLException ex) {
            Logger.getLogger(Utilisateur.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String password =  request.getParameter("password");


        request.setAttribute("login", login);
        request.setAttribute("password", password);

        String auth = "p";
        ResultSet rs = null;
        try {
            DB bdd2 = new DB();
            bdd2.connect();
            rs = bdd2.query("SELECT nom FROM CONNEXION");
            auth = rs.getString("nom");
        } catch (SQLException ex) {
            Logger.getLogger(Utilisateur.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet saisieTitre</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet saisieTitre at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            out.println(auth);
            
        }

        request.getServletContext().getRequestDispatcher("/index.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       processRequest(request, response);
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
