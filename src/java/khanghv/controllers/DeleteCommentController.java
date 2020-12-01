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
public class DeleteCommentController extends HttpServlet {

    private static final String GETTOARTICLE = "ArticleDetailController";
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

            String cmtID = request.getParameter("commentID");
            ArticleDAO artDao = new ArticleDAO();
            HttpSession session = request.getSession();
            AccountDTO accDto = (AccountDTO) session.getAttribute("DTO");

            if (accDto.getRole().equals("admin")) {
                int getLastNotiId = artDao.getLastNotiId() + 1;
                String notiId = Integer.toString(getLastNotiId);
                String owner = request.getParameter("ownerID");
                String articleId = request.getParameter("articleID");
                java.util.Date dateNow = new java.util.Date();
                Date getDate = new Date(dateNow.getTime());
                String message = "Admin has delete your comment!";
                String status = "unread";
                NotificationDTO dto = new NotificationDTO(notiId, message, status, articleId, owner, getDate);
                boolean isOk = artDao.addOneNotification(dto);
                if (isOk) {
                    boolean isDone = artDao.deleteCommentAdmin(cmtID);
                    if (isDone) {
                        url = GETTOARTICLE;

                    } else {
                        request.setAttribute("ERROR", "Failed to delete comment!");
                    }

                } else {
                    request.setAttribute("ERROR", "Failed to add Notification!");
                }
            } else {
                boolean isOk = artDao.deleteComment(cmtID, accDto.getEmail());
                if (isOk) {
                    url = GETTOARTICLE;

                } else {
                    request.setAttribute("ERROR", "Failed to delete comment!");
                }
            }

        } catch (Exception e) {
            log("ERROR at DeleteCommentController: " + e.getMessage());
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
