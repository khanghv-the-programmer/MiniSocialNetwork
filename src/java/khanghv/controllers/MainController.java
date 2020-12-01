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
import khanghv.dtos.AccountDTO;

/**
 *
 * @author USER
 */
public class MainController extends HttpServlet {

    private final static String ERROR = "error.jsp";
    private final static String LOGIN = "LoginController";
    private final static String REGISTER = "RegisterController";
    private final static String LOGOUT = "LogoutController";
    private final static String POST = "PostArticleController";
    private final static String DELETE = "DeleteArticleController";
    private final static String COMMENT = "UploadCommentController";
    private final static String GETPAGE = "ArticleLoadingController";
    private final static String SEEARTICLE = "ArticleDetailController";
    private final static String REACT = "ReactionController";
    private final static String DELETECOMMENT = "DeleteCommentController";
    private final static String EXPIRED = "index.jsp";
    private final static String VERIFY = "VerifyController";
    private final static String CHECK = "CheckVerifyController";
    private final static String SEND = "SendMailController";

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
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            AccountDTO dto = (AccountDTO) session.getAttribute("DTO");
            if (dto == null && !action.equals("Login") && !action.equals("Register") && !action.equals("Verify") && !action.equals("Check Verify") && !action.equals("Send")) {
                url = EXPIRED;
                request.setAttribute("EXPIRED", "This session has been expired, please log in again!");
            } else {
                switch (action) {
                    case "Login":
                        url = LOGIN;
                        break;
                    case "Register":
                        url = REGISTER;
                        break;
                    case "Log out":
                        url = LOGOUT;
                        break;
                    case "GetPage":
                    case "Search":
                    case "WriteArticle":
                        url = GETPAGE;
                        break;
                    case "See Detail":
                        url = SEEARTICLE;
                        break;
                    case "Post":
                        url = POST;
                        break;
                    case "Delete":
                        url = DELETE;
                        break;
                    case "Comment":
                        url = COMMENT;
                        break;
                    case "like":
                    case "dislike":
                        url = REACT;
                        break;
                    case "Delete Comment":
                        url = DELETECOMMENT;
                        break;
                    case "Verify":
                        url = VERIFY;
                        break;
                    case "Check Verify":
                        url = CHECK;
                        break;
                    case "Send":
                        url = SEND;
                        break;
                    default:
                        request.setAttribute("ERROR", "Invalid action!");
                }
            }

        } catch (Exception e) {
            log("ERROR at MainController: " + e.getMessage());
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
