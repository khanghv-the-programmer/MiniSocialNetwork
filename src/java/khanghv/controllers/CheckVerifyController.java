/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import khanghv.models.AccountDAO;

/**
 *
 * @author USER
 */
public class CheckVerifyController extends HttpServlet {

    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try {
            String email = request.getParameter("txtEmail");
            boolean isValid = true;
            if (!email.matches("[A-Za-z0-9]{5,60}@gmail.com") && !email.matches("[A-Za-z0-9]{5,60}@gmail.com.vn") && !email.matches("[A-Za-z0-9]{5,60}@fpt.edu.vn") && !email.matches("[A-Za-z0-9]{5,60}@yahoo.com") && !email.matches("[A-Za-z0-9]{5,60}@gmail.com.vn")) {
                isValid = false;
            }
            if (!isValid) {
                request.setAttribute("EERR", "Invalid email!");
                request.setAttribute("LIAME", email);
            } else {
                
                AccountDAO dao = new AccountDAO();
                String status = dao.checkVerify(email);
                if (status.equals("new")) {
                    request.setAttribute("NOTVER", "Your account has not been verified!");
                    request.setAttribute("LIAME", email);
                } else if (status.equals("active")) {
                    request.setAttribute("VER", "Your account has been verified!");
                }
                else
                {
                    
                    request.setAttribute("ERRR", "Can't find this account! Please go to register page!");
                }
            }

        } catch (Exception e) {
            log("ERROR at CheckVerifyController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("checkverify.jsp").forward(request, response);
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
