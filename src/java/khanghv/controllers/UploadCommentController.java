/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import java.util.Date;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khanghv.dtos.AccountDTO;
import khanghv.dtos.CommentDTO;
import khanghv.dtos.NotificationDTO;
import khanghv.models.ArticleDAO;

/**
 *
 * @author USER
 */
public class UploadCommentController extends HttpServlet {

    private static final String ERROR = "errorupload.jsp";
    private static final String BACKTOPOST = "ArticleDetailController";

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
            String content = request.getParameter("txtComment");
            if (content.trim().equals("")) {
                isValid = false;
                request.setAttribute("CERR", "Please input your comment!");
            }
            if (isValid) {
                HttpSession session = request.getSession();
                AccountDTO accDto = (AccountDTO) session.getAttribute("DTO");
                String owner = request.getParameter("ownerID");
                String ownerName = request.getParameter("ownerName");
                String articleID = request.getParameter("articleID");
                Date getCurrentDate = new Date();
                java.sql.Date uploadDate = new java.sql.Date(getCurrentDate.getTime());
                ArticleDAO artDao = new ArticleDAO();
                if (!accDto.getEmail().equals(owner)) {
                    int getLastNotiId = artDao.getLastNotiId();
                    Vector<NotificationDTO> notiList = new Vector<>();
                    getLastNotiId++;
                    String idToOwner = Integer.toString(getLastNotiId);
                    String message = accDto.getFullName() + " has posted a comment into your post!";
                    NotificationDTO noti = new NotificationDTO(idToOwner, message, "unread", articleID, owner, uploadDate);
                    boolean isYes = artDao.addOneNotification(noti);
                    if (!isYes) {
                        request.setAttribute("ERROR", "Failed to Upload Notification!");
                    }
                    String[] getAccounts = request.getParameterValues("userEmails");
                    if (getAccounts != null) {
                        if (getAccounts.length > 0) {

                            if (getAccounts.length > 0) {
                                Vector<String> getListDiffence = new Vector<>();
                                for (int i = 0; i < getAccounts.length; i++) {
                                    if (!khanghv.utils.SearchArrayElements.isFound(getListDiffence, getAccounts[i])) {
                                        getListDiffence.add(getAccounts[i]);
                                    }
                                }
                                for (int i = 0; i < getListDiffence.size(); i++) {
                                    if (!accDto.getEmail().equals(getListDiffence.get(i)) && !getListDiffence.get(i).equals(owner)) {
                                        getLastNotiId++;
                                        String idNoti = Integer.toString(getLastNotiId);
                                        String notiContent = accDto.getFullName() + " has posted comment into " + ownerName + " article!";
                                        NotificationDTO notiDto = new NotificationDTO(idNoti, notiContent, "unread", articleID, getListDiffence.get(i), uploadDate);
                                        notiList.add(notiDto);
                                    }

                                }
                            }

                            boolean isGood = artDao.addNotifications(notiList);
                            if (!isGood) {
                                request.setAttribute("ERROR", "Failed to Upload Notification!");
                            }
                        }
                    }
                } else {

                    String[] getAccounts = request.getParameterValues("userEmails");

                    if (getAccounts != null) {
                        int getLastNotiId = artDao.getLastNotiId();
                        Vector<NotificationDTO> notiList = new Vector<>();

                        if (getAccounts.length > 0) {
                            Vector<String> getListDiffence = new Vector<>();
                            for (int i = 0; i < getAccounts.length; i++) {
                                if (!khanghv.utils.SearchArrayElements.isFound(getListDiffence, getAccounts[i])) {
                                    getListDiffence.add(getAccounts[i]);
                                }
                            }
                            for (int i = 0; i < getListDiffence.size(); i++) {
                                if (!accDto.getEmail().equals(getListDiffence.get(i))) {
                                    getLastNotiId++;
                                    String idNoti = Integer.toString(getLastNotiId);
                                    String notiContent = accDto.getFullName() + " has posted comment into his/her article!";
                                    NotificationDTO notiDto = new NotificationDTO(idNoti, notiContent, "unread", articleID, getListDiffence.get(i), uploadDate);
                                    notiList.add(notiDto);
                                }

                            }
                        }

                        boolean isGood = artDao.addNotifications(notiList);
                        if (!isGood) {
                            request.setAttribute("ERROR", "Failed to Upload Notification!");
                        }

                    }

                }
                String email = accDto.getEmail();
                int getLastId = artDao.getLastCommentId() + 1;
                String cmtId = Integer.toString(getLastId);
                String status = "active";
                CommentDTO cmtDto = new CommentDTO(cmtId, content, email, articleID, uploadDate, status);
                boolean isOk = artDao.postArticlComment(cmtDto);
                if (isOk) {
                    url = BACKTOPOST;
                } else {
                    request.setAttribute("ERROR", "Upload failed!");
                }
            } else {
                url = BACKTOPOST;
            }

        } catch (Exception e) {
            log("ERROR at UploadCommentController: " + e.getMessage());
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
