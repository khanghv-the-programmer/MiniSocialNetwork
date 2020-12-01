/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khanghv.dtos.AccountDTO;
import khanghv.dtos.NotificationDTO;
import khanghv.dtos.ReactionDTO;
import khanghv.models.ArticleDAO;

/**
 *
 * @author USER
 */
public class ReactionController extends HttpServlet {

    private static final String SUCCESS = "ArticleDetailController";
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
            HttpSession session = request.getSession();
            AccountDTO dto = (AccountDTO) session.getAttribute("DTO");
            String username = dto.getEmail();
            String articleID = request.getParameter("articleID");
            String owner = request.getParameter("ownerID");
            ArticleDAO artDAO = new ArticleDAO();
            String currentReaction = artDAO.getStatus(username, articleID);
            String reaction = request.getParameter("action");
            java.util.Date getCurrentDate = new java.util.Date();
            Date updateDate = new Date(getCurrentDate.getTime());
            if (!dto.getEmail().equals(owner)) {
                int getLastNotiId = artDAO.getLastNotiId() + 1;
                String notiId = Integer.toString(getLastNotiId);
                String message = dto.getFullName() + " has " + reaction + "d your article!";
                String status = "unread";
                NotificationDTO notiDTO = new NotificationDTO(notiId, message, status, articleID, owner, updateDate);
                boolean isDone = artDAO.addOneNotification(notiDTO);
                if (isDone) {
                    if (currentReaction == null) {
                        int getId = artDAO.getLastReactionId() + 1;
                        String reactionID = Integer.toString(getId);
                        if (reaction.equals("like")) {
                            reaction = "Like";
                        } else {
                            reaction = "Dislike";
                        }
                        ReactionDTO reactDto = new ReactionDTO(reactionID, reaction, username, articleID, updateDate);
                        boolean isOK = artDAO.addReaction(reactDto);
                        if (isOK) {
                            url = SUCCESS;
                        } else {
                            request.setAttribute("ERROR", "Add Reaction Failed!");
                        }

                    } else {
                        if (currentReaction.equals("Like")) {
                            if (reaction.equals("like")) {
                                reaction = "Nothing";
                            } else {
                                reaction = "Dislike";
                            }
                        } else if (currentReaction.equals("Dislike")) {
                            if (reaction.equals("dislike")) {
                                reaction = "Nothing";
                            } else {
                                reaction = "Like";
                            }
                        } else {
                            if (reaction.equals("dislike")) {
                                reaction = "Dislike";
                            } else {
                                reaction = "Like";
                            }
                        }

                        boolean isOK = artDAO.updateReaction(reaction, username, articleID, updateDate);
                        if (isOK) {
                            url = SUCCESS;
                        } else {
                            request.setAttribute("ERROR", "Reaction Update Failed!");
                        }
                    }
                } else {
                    request.setAttribute("ERROR", "Failed to add Notification!");
                }
            } else {
                if (currentReaction == null) {
                    int getId = artDAO.getLastReactionId() + 1;
                    String reactionID = Integer.toString(getId);
                    if (reaction.equals("like")) {
                        reaction = "Like";
                    } else {
                        reaction = "Dislike";
                    }
                    ReactionDTO reactDto = new ReactionDTO(reactionID, reaction, username, articleID, updateDate);
                    boolean isOK = artDAO.addReaction(reactDto);
                    if (isOK) {
                        url = SUCCESS;
                    } else {
                        request.setAttribute("ERROR", "Add Reaction Failed!");
                    }

                } else {
                    if (currentReaction.equals("Like")) {
                        if (reaction.equals("like")) {
                            reaction = "Nothing";
                        } else {
                            reaction = "Dislike";
                        }
                    } else if (currentReaction.equals("Dislike")) {
                        if (reaction.equals("dislike")) {
                            reaction = "Nothing";
                        } else {
                            reaction = "Like";
                        }
                    } else {
                        if (reaction.equals("dislike")) {
                            reaction = "Dislike";
                        } else {
                            reaction = "Like";
                        }
                    }

                    boolean isOK = artDAO.updateReaction(reaction, username, articleID, updateDate);
                    if (isOK) {
                        url = SUCCESS;
                    } else {
                        request.setAttribute("ERROR", "Reaction Update Failed!");
                    }
                }
            }

        } catch (Exception e) {
            log("ERROR at ReactionCOntroller: " + e.getMessage());
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
