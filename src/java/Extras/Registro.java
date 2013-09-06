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

/**
 *
 * @author Administrador
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {

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
		RequestDispatcher vista = request.getRequestDispatcher("register_success.jsp");
		Boolean resultado = null;
		String mensaje = null;
                String nombre = request.getParameter ("nombre");
                String apellido = request.getParameter ("apellido");
                String direccion = request.getParameter ("direccion");
                String telefono = request.getParameter ("telefono");
                String email = request.getParameter ("email");
                String usuario = request.getParameter ("usuario");
                String password = request.getParameter ("password");

                        Cliente cliente = new Cliente();
                        cliente.setNombre(nombre);
                        cliente.setApellido(apellido);
                        cliente.setDireccion(direccion);
                        cliente.setTelefono(telefono);
                        cliente.setEmail(email);
                        cliente.setUsuario(usuario);
                        cliente.setPassword(password);
                        
                        try
                        {       
                            if(Cliente_Datos.nuevoCliente(cliente)){
                                mensaje = "Cliente creado con exito!!!";
                                //response.sendRedirect("register_success.jsp");
                            }else{
                                mensaje = "Error al crear nuevo cliente !!!!" ;
                            }//"Error al crear nuevo cliente !!!!"
                            
                        }catch(Exception e)
                        {
                                
                               
                        }	
		request.setAttribute("mensaje", mensaje);
		request.setAttribute("resultado", resultado);
		vista.forward(request, response);
                
	}
    
}
