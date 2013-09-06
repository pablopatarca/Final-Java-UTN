/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Extras;

import Classes.Cliente;
import Classes.Pedido;
import Classes.Producto;
import Datos.Pedido_Datos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bengui
 */
@WebServlet(name = "ArmarPedido", urlPatterns = {"/ArmarPedido"})
public class ArmarPedido extends HttpServlet {

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();

      // System.out.println(""+Calendar.YEAR+"/"+Calendar.MONTH+"/"+Calendar.DATE+"|"+Calendar.HOUR_OF_DAY+":"+Calendar.MINUTE+":"+Calendar.SECOND+":"+Calendar.MILLISECOND );
        
        Calendar cal1 = Calendar.getInstance();
        System.out.println(""+cal1.get(Calendar.DATE)+"/"+cal1.get(Calendar.MONTH)
        +"/"+cal1.get(Calendar.YEAR)+" "+cal1.get(Calendar.HOUR)
        +":"+cal1.get(Calendar.MINUTE)+":"+cal1.get(Calendar.SECOND)
        +":"+cal1.get(Calendar.MILLISECOND));      
        
        Pedido pedido = new Pedido();
        pedido.setListaProductos((ArrayList<Producto>)sesion.getAttribute("listaProductos"));
        Cliente cliente = (Cliente)sesion.getAttribute("cliente");
        pedido.setClienteId(cliente.getId());
        pedido.setFecha(cal1.get(Calendar.YEAR)+"-"+cal1.get(Calendar.MONTH)+"-"+cal1.get(Calendar.DATE));
        pedido.calcularTotal();
        
        try {
            Pedido_Datos.nuevoPedido(pedido);
            sesion.setAttribute("listaProductos", new ArrayList<Producto>());
            sesion.setAttribute("pedido", pedido);
           
        } catch (SQLException ex) {
            Logger.getLogger(ArmarPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect("pedido.jsp");

    }

}
