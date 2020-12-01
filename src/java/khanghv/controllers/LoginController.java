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
import javax.servlet.http.HttpSession;
import khanghv.utils.EncryptCodeSHA256;
import khanghv.dtos.AccountDTO;
import khanghv.models.AccountDAO;

/**
 *
 * @author USER
 */
public class LoginController extends HttpServlet {

    private final static String MEMBER = "ArticleLoadingController";
    private final static String ADMIN = "ArticleLoadingController";
    private final static String ERROR = "error.jsp";
    private final static String INVALID = "index.jsp";

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
            boolean isValid = true;
            String email = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            if (email.equals("")) {
                isValid = false;
                request.setAttribute("UERR", "Please input Username (Email)!");
            }
            if (password.equals("")) {
                isValid = false;
                request.setAttribute("PERR", "Please input password");
            }
            if (isValid) {
                AccountDAO dao = new AccountDAO();
                EncryptCodeSHA256 encryptTool = new EncryptCodeSHA256();
                password = encryptTool.toHexString(encryptTool.getSHA(password));
                AccountDTO dto = dao.checkLogin(email, password);
                if (dto != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("DTO", dto);
                    session.setAttribute("ROLE", dto.getRole());
                    if (dto.getRole().equals("member")) {
                        url = MEMBER;
                    } else if (dto.getRole().equals("admin")) {
                        url = ADMIN;
                    } else {
                        request.setAttribute("ERROR", "Invalid role!");
                    }
                } else {
                    request.setAttribute("ERROR", "Wrong Username or Password!");
                }
            } else {
                url = INVALID;
                request.setAttribute("USERNAME", email);
            }
        } catch (Exception e) {
            log("ERROR at LoginController: " + e.getMessage());
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
