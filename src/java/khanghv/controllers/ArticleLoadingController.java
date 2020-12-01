/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import java.util.Collections;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khanghv.dtos.AccountDTO;
import khanghv.dtos.ArticleDTO;
import khanghv.dtos.NotificationDTO;
import khanghv.models.ArticleDAO;

/**
 *
 * @author USER
 */
public class ArticleLoadingController extends HttpServlet {

    private final static String MEMBER = "member.jsp";
    private final static String ADMIN = "admin.jsp";

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

        String url = MEMBER;
        try {
            HttpSession session = request.getSession();
            AccountDTO accDto = (AccountDTO) session.getAttribute("DTO");
            String role = accDto.getRole();
            if (role.equals("admin")) {
                url = ADMIN;
            }
            String search = request.getParameter("txtSearch");

            System.out.println("Search " + search);
            String pageId = request.getParameter("page");

            ArticleDAO dao = new ArticleDAO();
            String isPost = request.getParameter("isPost");

            if (pageId == null) {
                pageId = "1";
            }
            if (!pageId.matches("[0-9]{1,100}")) {
                pageId = "1";
            }
            int pageNum = Integer.parseInt(pageId);
            int pageSize = 20;
            Vector<ArticleDTO> arList = new Vector<>();
            if (search == null) {

                arList = dao.loadNewfeed();
                Collections.sort(arList);

            } else if (search.equals("")) {

                request.setAttribute("EMPTY", "Please input something!");

            } else {
                arList = dao.searchNewfeed(search);
                Collections.sort(arList);
                request.setAttribute("ISSEARCH", "OK");
                request.setAttribute("SEARCH", search);
            }

            Vector<NotificationDTO> notiList = dao.getListNotification(accDto.getEmail());
            Collections.sort(notiList);
            for (NotificationDTO noti : notiList) {
                if (noti.getStatus().equals("unread")) {
                    request.setAttribute("UNREAD", "You have new notifications!");
                }
            }
            session.setAttribute("NOTIFICATION", notiList);
            int totalPage = 1;
            if (arList.size() % pageSize == 0) {
                totalPage = (arList.size() / pageSize);
            } else {
                totalPage = (arList.size() / pageSize) + 1;
            }
            if (pageNum > totalPage) {
                pageNum = 1;
            }
            if (pageNum < 1) {
                pageNum = 1;
            }
            System.out.println(totalPage);
            request.setAttribute("PAGENUM", totalPage);
            Vector<ArticleDTO> listInPage = new Vector<>();
            for (int i = (pageNum - 1) * pageSize; i < (pageNum * pageSize); i++) {
                if (i >= arList.size()) {
                    break;
                } else {
                    listInPage.add(arList.get(i));
                }
            }

            request.setAttribute("ARLIST", listInPage);
            if (isPost != null) {
                request.setAttribute("POSTART", "OK");
            }
        } catch (Exception e) {

            log("ERROR at ArticleLoadingController: " + e.getMessage());

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
