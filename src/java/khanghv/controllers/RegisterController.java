/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import khanghv.utils.EncryptCodeSHA256;
import khanghv.dtos.AccountDTO;
import khanghv.models.AccountDAO;

/**
 *
 * @author USER
 */
public class RegisterController extends HttpServlet {

    private final static String INVALID = "register.jsp";
    private final static String ERROR = "error.jsp";
    private final static String SUCCESS = "SendMailController";

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
            boolean isValid = true;
            String email = request.getParameter("txtEmail");
            String extend = request.getParameter("txtExtend");
            String password = request.getParameter("txtPassword");
            String fullName = request.getParameter("txtName");
            if (!email.matches("[A-Za-z0-9_.]{6,35}")) {
                isValid = false;
                request.setAttribute("EERR", "Invalid email address");
            }
            if (!password.matches("[A-Za-z0-9]{8,20}")) {
                isValid = false;
                request.setAttribute("PERR", "Invalid Password!");
            }
            if (!fullName.matches("[A-Za-z ]{8,50}")) {
                isValid = false;
                request.setAttribute("FERR", "Invalid Full Name!");
            }
            if (isValid) {
                String fullEmail = email + extend;
                String encryptedPass = EncryptCodeSHA256.toHexString(EncryptCodeSHA256.getSHA(password));
                String img = "https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119144247_350086329460855_7587612839311667552_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=i7oqf2hbhgYAX9Tadiy&_nc_ht=scontent.fsgn5-2.fna&oh=42f95a2ae4d763879eb1711f170b1ed2&oe=5F87B897";
                Random rand = new Random();
                int getRandomImg = rand.nextInt(10);
                switch (getRandomImg) {
                    case 0:
                        img = "https://scontent.fsgn5-4.fna.fbcdn.net/v/t1.15752-9/119240565_961542530987707_2725173534860989833_n.jpg?_nc_cat=102&_nc_sid=b96e70&_nc_ohc=qqF4Tp4FJ-MAX92Hocg&_nc_ht=scontent.fsgn5-4.fna&oh=7075e7127a673ada77e42698f6e50d78&oe=5F876AAB";
                        break;
                    case 1:
                        img = "https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119144247_350086329460855_7587612839311667552_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=i7oqf2hbhgYAX9Tadiy&_nc_ht=scontent.fsgn5-2.fna&oh=42f95a2ae4d763879eb1711f170b1ed2&oe=5F87B897";
                        break;
                    case 2:
                        img = "https://scontent.fsgn5-5.fna.fbcdn.net/v/t1.15752-9/119144695_2734798146837817_3217152471037283505_n.jpg?_nc_cat=100&_nc_sid=b96e70&_nc_ohc=ElbgKSZZUw8AX-xw7Rj&_nc_ht=scontent.fsgn5-5.fna&oh=c8a74c0a63efa973c225f4716d5774e3&oe=5F85C894";
                        break;
                    case 3:
                        img = "https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.15752-9/119576244_611058992866836_33327148864231109_n.jpg?_nc_cat=103&_nc_sid=b96e70&_nc_ohc=rCYc9J9uHE0AX-f1Zee&_nc_ht=scontent.fsgn5-7.fna&oh=288b597e2c2639a5fca7fc1ffb88397a&oe=5F86F102";
                        break;
                    case 4:
                        img = "https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.15752-9/119235307_315753942845399_1769069052757878237_n.jpg?_nc_cat=110&_nc_sid=b96e70&_nc_ohc=Q86k2LdHyNwAX9g4YIC&_nc_ht=scontent.fsgn5-3.fna&oh=f369d193d77b9f62ad1b30e82ed5099c&oe=5F88DFD4";
                        break;
                    case 5:
                        img = "https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119483185_1324268751260297_2007792813609689869_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=jjbsqFiYByIAX83cWk5&_nc_ht=scontent.fdad3-3.fna&oh=9a45d803692adbb2cef5ee4397d8d121&oe=5F85EA0B";
                        break;
                    case 6:
                        img = "https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119426085_645210006129460_6678631574644528617_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=-LoPKv-eMV0AX8wAOVI&_nc_ht=scontent.fdad3-3.fna&oh=0bc56240c9d19957f0a80c9d7467d1de&oe=5F88980E";
                        break;
                    case 7:
                        img = "https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119219284_356184622177962_5874665426398472444_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=cFMbXeYgyV4AX_SOexn&_nc_ht=scontent.fsgn5-2.fna&oh=60664c3397d926ea0c38db184d996862&oe=5F87653D";
                        break;
                    case 8:
                        img = "https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/119137631_796006967632971_5531985519109227954_n.jpg?_nc_cat=109&_nc_sid=b96e70&_nc_ohc=iacFA2_iix0AX_9235K&_nc_ht=scontent.fdad3-3.fna&oh=2d0c8870d94ea6bb800eb000ee5262fb&oe=5F896627";
                        break;
                    case 9:
                        img = "https://scontent.fsgn5-1.fna.fbcdn.net/v/t1.15752-9/119485568_1181188105704979_2079054393905716953_n.jpg?_nc_cat=107&_nc_sid=b96e70&_nc_ohc=4i_Wm5tg10YAX8c-GRl&_nc_ht=scontent.fsgn5-1.fna&oh=8692b9e8ad491d14339e686285114aa9&oe=5F85CCAC";
                        break;
                    default:
                        img = "https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.15752-9/119144247_350086329460855_7587612839311667552_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=i7oqf2hbhgYAX9Tadiy&_nc_ht=scontent.fsgn5-2.fna&oh=42f95a2ae4d763879eb1711f170b1ed2&oe=5F87B897";
                        break;
                }
                String status = "new";
                String role = "member";
                AccountDTO dto = new AccountDTO(fullEmail, fullName, role, status, img);
                dto.setPassword(encryptedPass);
                AccountDAO dao = new AccountDAO();
                boolean isOk = dao.registerAccount(dto);
                if (isOk) {
                    url = SUCCESS;
                    request.setAttribute("OK", "Register Successfully! Please check your email to verify your account!");
                    request.setAttribute("LIAME", fullEmail);
                } else {
                    request.setAttribute("ERROR", "Register failed!");
                }

            } else {
                url = INVALID;
                request.setAttribute("EMAIL", email);
                request.setAttribute("FN", fullName);
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                url = INVALID;
                request.setAttribute("EERR", "Existed Email!");
            } else {
                log("ERROR at RegisterController: " + e.getMessage());

            }

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
