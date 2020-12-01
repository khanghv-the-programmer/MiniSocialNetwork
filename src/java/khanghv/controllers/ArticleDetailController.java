/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khanghv.dtos.AccountDTO;
import khanghv.dtos.ArticleDTO;
import khanghv.dtos.CommentDTO;
import khanghv.dtos.ReactionDTO;
import khanghv.models.ArticleDAO;

/**
 *
 * @author USER
 */
public class ArticleDetailController extends HttpServlet {

    private static final String LOAD = "detail.jsp";
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
            ArticleDAO artDAO = new ArticleDAO();
            String notiId = request.getParameter("notiID");

            if (notiId != null) {
                String notiStt = request.getParameter("notiStt");
                if (notiStt.equals("unread")) {
                    boolean isOk = artDAO.updateNotification(notiId);
                    if (isOk) {
                        url = LOAD;
                        String artId = request.getParameter("articleID");
                        HttpSession session = request.getSession();
                        AccountDTO accDto = (AccountDTO) session.getAttribute("DTO");

                        ArticleDTO dto = artDAO.loadNewfeedDetail(artId);
                        request.setAttribute("ARTICLE", dto);
                        Vector<CommentDTO> cmtList = artDAO.loadCommentList(artId);
                        Vector<ReactionDTO> likeList = artDAO.getLikePeople(artId);
                        Vector<ReactionDTO> dislikeList = artDAO.getDislikePeople(artId);
                        request.setAttribute("COMMENTLIST", cmtList);
                        int likes = artDAO.getLikesNumber(artId);
                        int dislike = artDAO.getDislikesNumber(artId);
                        request.setAttribute("LIKES", likes);
                        request.setAttribute("DISLIKES", dislike);
                        request.setAttribute("LIKEP", likeList);
                        request.setAttribute("DISLIKEP", dislikeList);

                        String emotion = artDAO.getStatus(accDto.getEmail(), artId);
                        if (emotion.equals("Like") || emotion.equals("Dislike")) {
                            request.setAttribute("REACTION", "You have " + emotion + "d this post!");
                        }
                    } else {
                        request.setAttribute("ERROR", "Upload Notification failed!");
                    }
                } else {
                    url = LOAD;
                    String artId = request.getParameter("articleID");
                    HttpSession session = request.getSession();
                    AccountDTO accDto = (AccountDTO) session.getAttribute("DTO");

                    ArticleDTO dto = artDAO.loadNewfeedDetail(artId);
                    request.setAttribute("ARTICLE", dto);
                    Vector<CommentDTO> cmtList = artDAO.loadCommentList(artId);
                    Vector<ReactionDTO> likeList = artDAO.getLikePeople(artId);
                    Vector<ReactionDTO> dislikeList = artDAO.getDislikePeople(artId);
                    request.setAttribute("COMMENTLIST", cmtList);
                    int likes = artDAO.getLikesNumber(artId);
                    int dislike = artDAO.getDislikesNumber(artId);
                    request.setAttribute("LIKES", likes);
                    request.setAttribute("DISLIKES", dislike);
                    request.setAttribute("LIKEP", likeList);
                    request.setAttribute("DISLIKEP", dislikeList);

                    String emotion = artDAO.getStatus(accDto.getEmail(), artId);
                    if (emotion != null) {
                        if (emotion.equals("Like") || emotion.equals("Dislike")) {
                            request.setAttribute("REACTION", "You have " + emotion + "d this post!");
                        }
                    }
                }
            } else {
                url = LOAD;
                String artId = request.getParameter("articleID");
                HttpSession session = request.getSession();
                AccountDTO accDto = (AccountDTO) session.getAttribute("DTO");

                ArticleDTO dto = artDAO.loadNewfeedDetail(artId);
                request.setAttribute("ARTICLE", dto);
                Vector<CommentDTO> cmtList = artDAO.loadCommentList(artId);
                Vector<ReactionDTO> likeList = artDAO.getLikePeople(artId);
                Vector<ReactionDTO> dislikeList = artDAO.getDislikePeople(artId);
                request.setAttribute("COMMENTLIST", cmtList);
                int likes = artDAO.getLikesNumber(artId);
                int dislike = artDAO.getDislikesNumber(artId);
                request.setAttribute("LIKES", likes);
                request.setAttribute("DISLIKES", dislike);
                request.setAttribute("LIKEP", likeList);
                request.setAttribute("DISLIKEP", dislikeList);

                String emotion = artDAO.getStatus(accDto.getEmail(), artId);
                
                if (emotion != null) {
                    if (emotion.equals("Like") || emotion.equals("Dislike")) {
                        request.setAttribute("REACTION", "You have " + emotion + "d this post!");
                    }
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            log("ERROR at DetailController: " + e.getMessage());
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
