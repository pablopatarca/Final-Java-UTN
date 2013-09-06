/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Extras;

import Classes.Producto;
import Datos.Producto_Datos;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Agrega un producto al carrito.
 * @author bengui
 */
@WebServlet(name = "Carrito", urlPatterns = {"/Carrito"})
public class Carrito extends HttpServlet {

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
        String producto_id = request.getParameter ("producto_id");
        int cantidad = Integer.parseInt(request.getParameter ("cantidad"));
        ResultSet res = null;
        ArrayList<Producto> listaProductos;
        Producto producto;

	if(sesion.getAttribute("cliente")!=null){
            
            //Obtengo el producto
            producto = Producto_Datos.getProducto(producto_id);
            if(producto!=null){
                //Establezco la cantidad que quiere el cliente
                producto.setCantidad(cantidad);
                //busco si esta creada una lista de productos en la sesion
                if(sesion.getAttribute("listaProductos") != null ){
                    //Apunto a la lista de la session
                    listaProductos = (ArrayList<Producto>) sesion.getAttribute("listaProductos");
                }else{
                    //Genero la lista de productos
                    listaProductos = new ArrayList<Producto>();
                }
                //Guardo el producto en la lista, y la lista en la session
                listaProductos.add(producto);
                sesion.setAttribute("listaProductos", listaProductos);

                response.sendRedirect("carrito.jsp");
            }else{
                response.sendRedirect("index.jsp");
            }
        }else{
            response.sendRedirect("index.jsp");
        }
    }

}
