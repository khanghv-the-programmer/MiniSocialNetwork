/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khanghv.dtos.AccountDTO;
import khanghv.dtos.NotificationDTO;
import khanghv.models.ArticleDAO;

/**
 *
 * @author USER
 */
public class DeleteArticleController extends HttpServlet {

    private static final String GETTONEWFEED = "ArticleLoadingController";
    private static final String ERROR = "errorupload.jsp";

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
            ArticleDAO dao = new ArticleDAO();
            String id = request.getParameter("articleID");

            HttpSession session = request.getSession();
            AccountDTO accDto = (AccountDTO) session.getAttribute("DTO");

            if (accDto.getRole().equals("admin")) {
                int getLastNotiId = dao.getLastNotiId() + 1;
                String notiId = Integer.toString(getLastNotiId);
                String owner = request.getParameter("ownerID");
                java.util.Date dateNow = new java.util.Date();
                Date getDate = new Date(dateNow.getTime());
                String message = "Admin has delete your article!";
                String status = "unread";
                NotificationDTO dto = new NotificationDTO(notiId, message, status, id, owner, getDate);
                boolean isOk = dao.addOneNotification(dto);
                if (isOk) {
                    boolean isDone = dao.deleteArticleAdmin(id);
                    if (isDone) {
                        url = GETTONEWFEED;

                    } else {
                        request.setAttribute("ERROR", "Failed to delete article!");
                    }

                } else {
                    request.setAttribute("ERROR", "Failed to add Notification!");
                }
            } else {
                boolean isOK = dao.deleteArticle(id, accDto.getEmail());
                if (isOK) {
                    url = GETTONEWFEED;
                } else {
                    request.setAttribute("ERROR", "Delete Failed!");
                }
            }

        } catch (Exception e) {
            log("ERROR at DeleteArticleController: " + e.getMessage());
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
