/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Extras;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import Datos.Producto_Datos;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Nicolas
 */
@MultipartConfig
@WebServlet(name = "SubirImage", urlPatterns = {"/SubirImage"})
public class SubirImage extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            // get access to file that is uploaded from client
            Part p1 = request.getPart("file");
            InputStream is = p1.getInputStream();

            // read filename which is sent as a part
            Part id1  = request.getPart("id");
            Scanner s1 = new Scanner(id1.getInputStream());
            String id = s1.nextLine(); 
            
            Part p2  = request.getPart("photoname");
            Scanner s = new Scanner(p2.getInputStream());
            String filename = s.nextLine();    // read filename from stream

            // get filename to use on the server
            String outputfile = "D:/Documentos/NetBeansProjects/Final-Java-1/web/images/"+filename;  // get path on the server
            
             out.println("UBICACION: "+outputfile);
             FileOutputStream os = new FileOutputStream (outputfile);
             Connection con = (Connection) Extras.Connection_class.mysql_connect();
		try
		{
			PreparedStatement pstm = (PreparedStatement) con.prepareStatement("UPDATE productos SET imagen = ? WHERE id = ?;");
			pstm.setString(1,filename);
                        pstm.setString(2,id);
       			pstm.executeUpdate();		
			pstm.close();
			con.close();
		}
		catch(SQLException e)
		{
			throw e;
		}
            
            // write bytes taken from uploaded file to target file
            int ch = is.read();
            while (ch != -1) {
                 os.write(ch);
                 ch = is.read();
            }
            os.close();
            out.println("<h3>File uploaded successfully!</h3>");
        }
        catch(Exception ex) {
           out.println("Exception -->" + ex.getMessage());
        }
        finally { 
            out.close();
        }
    } // end of doPost()
 } // end of UploadServlet
