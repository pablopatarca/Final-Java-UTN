/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
 package Extras;
import Classes.Producto;
import Datos.Producto_Datos;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Pablo
 */
 @WebServlet(name = "NuevoProducto", urlPatterns = {"/NuevoProducto"})
public class NuevoProducto extends HttpServlet {

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
            RequestDispatcher vista = request.getRequestDispatcher("nuevoProducto.jsp");
            Boolean resultado = null;
            String mensaje = null;
            String name = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String presentacion = request.getParameter("presentacion");
            int en_oferta = Integer.parseInt(request.getParameter("en_oferta"));
            Double precio;
            try{
                precio = Double.parseDouble(request.getParameter("precio"));
            }catch(Exception e){
                precio = 0.0;
            }

            Producto producto = new Producto();
            producto.setNombre(name);
            producto.setDescripcion(descripcion);
            producto.setPresentacion(presentacion);
            producto.setEnOferta(en_oferta);
            producto.setPrecio(precio);

            try
            {
                Producto_Datos.nuevoProducto(producto);
                System.out.println(producto);
                mensaje = "Producto creado con exito ";
            }catch(Exception e)
            {
                mensaje = "Error al crear nuevo producto: "+ e ;
            }	
            request.setAttribute("mensaje", mensaje);
            vista.forward(request, response);
	}

}
