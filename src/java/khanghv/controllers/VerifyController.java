/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khanghv.models.AccountDAO;

/**
 *
 * @author USER
 */
public class VerifyController extends HttpServlet {

    private static final String SUCCESS = "index.jsp";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "verify.jsp";

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
        String url = ERROR;
        try {
            String email = request.getParameter("5141912");
            String verifyCode = request.getParameter("txtCode");
            HttpSession session = request.getSession();
            String currentCode = (String) session.getAttribute("CODE");
            AccountDAO dao = new AccountDAO();
            
            if (currentCode.trim().equals(verifyCode)) {
                boolean isOk = dao.verifyAccount(email);
                if (isOk) {
                    url = SUCCESS;
                    request.setAttribute("OK", "Verify Successfully!");
                    request.setAttribute("USERNAME", email);
                } else {
                    request.setAttribute("ERROR", "Verify failed!");
                }
            }
            else
            {
                url = INVALID;
                request.setAttribute("LIAME", email);
                request.setAttribute("VERR", "Wrong Code! Please try again!");
            }

        } catch (Exception e) {
            log("ERROR at VerifyController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
