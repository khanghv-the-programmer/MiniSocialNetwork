/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khanghv.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class SendMailController extends HttpServlet {
    
    
    
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
        String url = "verify.jsp";
        try {
            HttpSession session = request.getSession();

            String receiver = request.getParameter("5141912");
            if (receiver == null) {
                receiver = request.getParameter("txtEmail") + request.getParameter("txtExtend");
            }

            String sender = "amongsocial234@gmail.com";

            Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.starttls.enable", "true");
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.port", 587);

            Session s = Session.getInstance(p,
                    new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("amongsocial1234@gmail.com", "AmongSocial123");
                }
            });

            String currentCode = (String) session.getAttribute("CODE");
            if (currentCode == null) {
                Random r = new Random();
                int verifyNumber = r.nextInt(100000);
                currentCode = String.format("%05d", verifyNumber);
                session.setAttribute("CODE", currentCode);
            }

            Message msg = new MimeMessage(s);
            msg.setFrom(new InternetAddress(sender));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
            msg.setSubject("Verify your Account");
            //gửi mail = link
//            String uriString = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
//            System.out.println("URI STRING: " + uriString);
//
//            String resource = uriString + "/MainController?action=Verify&5141912=" + receiver;
            msg.setText("Thank you for joining Among Social, Please Verify your email by input this verify code (5-digit):\n" + currentCode + "/nThis code will be expired after 30 minutes!");

            Transport.send(msg);
            request.setAttribute("LIAME", receiver);
        } catch (Exception e) {
            e.printStackTrace();
            log("ERROR at SendMailController: " + e.getMessage());
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
