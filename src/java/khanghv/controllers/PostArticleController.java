package khanghv.controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import khanghv.db.MyConnection;
import khanghv.dtos.AccountDTO;
import khanghv.dtos.ArticleDTO;
import khanghv.models.ArticleDAO;

/**
 *
 * @author USER
 */
public class PostArticleController extends HttpServlet {

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
            boolean isValid = true;
            String title = request.getParameter("txtTitle");
            if (title.trim().length() == 0) {
                isValid = false;
                request.setAttribute("TERR", "Please Input Title!");
            }
            String content = request.getParameter("txtPost");
            if (content.trim().length() == 0) {
                isValid = false;
                request.setAttribute("CERR", "Please Input Content!");
            }
            java.util.Date dateUtil = new java.util.Date();
            Date uploadDate = new Date(dateUtil.getTime());
            ArticleDAO dao = new ArticleDAO();
            int lastId = dao.getLastId();
            String id = Integer.toString(lastId + 1);
            HttpSession session = request.getSession();
            AccountDTO user = (AccountDTO) session.getAttribute("DTO");
            String username = user.getEmail();
            String image = request.getParameter("txtImage");
            String status = "active";
            if (isValid) {
                if (image == null) {
                    ArticleDTO dto = new ArticleDTO(id, title, content, username, status, uploadDate);
                    boolean isOk = dao.postArticleNoImg(dto);
                    if (isOk) {
                        url = GETTONEWFEED;
                    } else {
                        request.setAttribute("ERROR", "Upload failed!");
                    }
                } else {
                    ArticleDTO dto = new ArticleDTO(id, title, content, image, username, status, uploadDate);
                    boolean isOk = dao.postArticle(dto);
                    if (isOk) {
                        url = GETTONEWFEED;
                    } else {
                        request.setAttribute("ERROR", "Upload failed!");
                    }
                }
            } else {
                url = GETTONEWFEED;
                request.setAttribute("TITLE", title);
                request.setAttribute("CONT", content);
                request.setAttribute("POSTART", "OK");
            }

        } catch (Exception e) {
            log("ERROR at PostArticleController: " + e.getMessage());
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
