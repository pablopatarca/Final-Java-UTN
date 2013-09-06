/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Extras;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.mail.Authenticator;  
import javax.mail.Session;  
import javax.mail.Message;  
import javax.mail.internet.*;  
import javax.mail.Transport;  



/**
 *
 * @author Nicolas
 */
@WebServlet(name = "Mail", urlPatterns = {"/Mail"})
public class Mail extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Mail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Mail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
       } 
    

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Properties p = new Properties();  
           p.put("mail.host", "smtp.msitec.com.br");  
           Session session = Session.getInstance(p, null);  
           Message msg = new MimeMessage(session);  
           String asunto = request.getParameter ("asunto");
           String mensaje = request.getParameter ("mensaje");
           String destinatario = request.getParameter ("destinatario");
           try{  
              msg.setFrom(new InternetAddress("narc88@gmail.com"));  
              msg.setRecipient(Message.RecipientType.TO,new InternetAddress(destinatario));      
                   
              msg.setSentDate(new java.util.Date());      
              msg.setSubject(asunto);      
              msg.setText(mensaje);   
              Transport.send(msg);  
              System.out.println("email enviado");  
              }catch (AddressException e) {    
              System.out.println("Error en la direccion"+e);    
              }catch (Exception e) {      
              System.out.println("No enviado"+e);
              }  
           response.sendRedirect("/contacto.jsp");
     }  


    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
