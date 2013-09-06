/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Extras;

import Classes.Cliente;
import Datos.Cliente_Datos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nicolas
 */
@WebServlet(name = "Editar", urlPatterns = {"/Editar"})
public class Editar extends HttpServlet {

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
            out.println("<title>Servlet Editar</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Editar at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
                
                System.out.println("EDICION CLIENTE");
		RequestDispatcher vista = request.getRequestDispatcher("editar.jsp");
		Boolean resultado = null;
		String mensaje = null;
                String nombre = request.getParameter ("nombre");
                String apellido = request.getParameter ("apellido");
                String direccion = request.getParameter ("direccion");
                String telefono = request.getParameter ("telefono");;
                String email = request.getParameter ("email");
                HttpSession sesion = request.getSession(false);
                
                
                Cliente cliente = (Cliente)sesion.getAttribute("cliente");
                cliente.setNombre(nombre);
                cliente.setApellido(apellido);
                cliente.setDireccion(direccion);
                cliente.setTelefono(telefono);
                cliente.setEmail(email);
                       
                try
                {
                    Cliente_Datos.actualizarCliente(cliente);
                    mensaje = "Cambios guardados";
                    System.out.println("CLIENTE ACTUALIZADO");
                    //response.sendRedirect("editar.jsp");

                }catch(Exception e)
                {
                    mensaje = "Error al guardar los cambios" ; //"Error al crear nuevo cliente !!!!"
                    System.out.println("ERROR : Actualizacion de cliente fallida");
                    System.out.println(e.toString());
                }	
                request.setAttribute("mensaje", mensaje);
                request.setAttribute("resultado", resultado);
                vista.forward(request, response);
		
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
