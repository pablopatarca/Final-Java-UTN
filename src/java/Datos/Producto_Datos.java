/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;
import Classes.Producto;
import Extras.Carrito;
import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pablo
 */
public class Producto_Datos {

    String id;
    public static void nuevoProducto(Producto p) throws SQLException
	{
		Connection con = (Connection) Extras.Connection_class.mysql_connect();
		try
		{
                    PreparedStatement pstm = (PreparedStatement) con.prepareStatement("INSERT INTO "
                            + "productos(nombre, descripcion, presentacion, en_oferta, precio) "
                            + "VALUES(?, ?, ?, ?, ?);");
                    pstm.setString(1, p.getNombre());
                    pstm.setString(2, p.getDescripcion());
                    pstm.setString(3, p.getPresentacion());
                    pstm.setInt(4, p.getEnOferta());
                    pstm.setString(5, p.getPrecio().toString());
                    pstm.executeUpdate();

                    pstm.close();

                    con.close();
                }
		catch(SQLException e)
		{
                    throw e;
		}
	}
    public static void editarProducto(Producto p) throws SQLException
	{
            Connection con = (Connection) Extras.Connection_class.mysql_connect();
            try
            {
                PreparedStatement pstm = (PreparedStatement) con.prepareStatement("UPDATE productos SET nombre = ?,descripcion =  ?,presentacion = ?,en_oferta = ?,precio = ? WHERE producto_id = ?;");
                pstm.setString(1, p.getNombre());
                pstm.setString(2, p.getDescripcion());
                pstm.setString(3, p.getPresentacion());
                pstm.setInt(4, p.getEnOferta());
                pstm.setString(5, p.getPrecio().toString());
                pstm.setString(6, String.valueOf(p.getId()));
                pstm.executeUpdate();

                pstm.close();

                con.close();
            }
            catch(SQLException e)
            {
                throw e;
            }
	}
    public static void eliminarProducto(String id) throws SQLException
	{
            Connection con = (Connection) Extras.Connection_class.mysql_connect();
            try
            {
                PreparedStatement pstm = (PreparedStatement) con.prepareStatement("Delete productos where productos.producto_id = ?");
                pstm.setString(1, id);
                pstm.executeUpdate();
                pstm.close();
                con.close();
            }
            catch(SQLException e)
            {
                    throw e;
            }
	}
    
   //Retrona un producto en base al id ingresado
   public static Producto getProducto(String id){
       Producto producto = null;
       PreparedStatement pstm;
       ResultSet res;
       try {

            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = Extras.Connection_class.mysql_connect();

            String query = "SELECT * FROM productos WHERE producto_id='"+id+"';";


            System.out.println(query);

            pstm = con.prepareStatement(query);
            res = pstm.executeQuery();

            //Si encuentra el producto, crea un nuevo objeto con sus datos
            if(res.next()){
                producto = new Producto();
                producto.setId(res.getInt("producto_id"));
                producto.setNombre(res.getString("nombre"));
                producto.setDescripcion(res.getString("descripcion"));
                producto.setPresentacion(res.getString("presentacion"));
                producto.setImagen(res.getString("imagen"));
                producto.setPrecio(res.getDouble("precio"));
                producto.setEnOferta(res.getInt("en_oferta"));

            }else{
                System.out.println("NO ENCONTRO EL PRODUCTO");
            }   
        } catch (Exception ex) {
            Logger.getLogger(Carrito.class.getName()).log(Level.SEVERE, null, ex);
        }
       return producto;
   }
       
   //Retorna un arreglo de productos, si soloOfertas es verdadero
   //retorna solo los productos en oferta.
   public static ArrayList<Producto> getListaProductos(int soloOfertas){

       ArrayList<Producto> listaProductos = new ArrayList<Producto>();
       Producto producto;
       PreparedStatement pstm;
       ResultSet res;
       try { 
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = Extras.Connection_class.mysql_connect();
            //Pasar a la capa de datos
            if(soloOfertas != 0){
                pstm = con.prepareStatement("SELECT * FROM productos"
                    + " WHERE productos.en_oferta = 1 "
                        );
            }else{
                pstm = con.prepareStatement("SELECT * FROM productos");
            }

            res = pstm.executeQuery();

            //Si encuentra el producto, crea un nuevo objeto con sus datos
            while(res.next()){
                //System.out.println("ENCONTRO EL PRODUCTO");
                producto = new Producto();
                producto.setId(res.getInt("producto_id"));
                producto.setNombre(res.getString("nombre"));
                producto.setDescripcion(res.getString("descripcion"));
                producto.setPresentacion(res.getString("presentacion"));
                producto.setPrecio(res.getDouble("precio"));
                producto.setImagen(res.getString("imagen"));

                listaProductos.add(producto);
            }  

        } catch (Exception ex) {

            Logger.getLogger(Carrito.class.getName()).log(Level.SEVERE, null, ex);
        }
       return listaProductos;
   }
   
      //Retorna un arreglo de productos que coinciden con valorCadena
   public static ArrayList<Producto> getListaProductos(String valorCadena){

       ArrayList<Producto> listaProductos = new ArrayList<Producto>();
       Producto producto;
       PreparedStatement pstm;
       ResultSet res;
       try { 
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = Extras.Connection_class.mysql_connect();
            //Pasa a la capa de datos
            if(valorCadena != null){
            pstm = con.prepareStatement("SELECT * FROM productos"+
                    " WHERE (productos.nombre like '%"+valorCadena+"%' OR productos.descripcion like '%"+valorCadena+"%')");
            }else{
                pstm = con.prepareStatement("SELECT * FROM productos");
            }
            res = pstm.executeQuery();
            //Si encuentra el producto, crea un nuevo objeto con sus datos
            while(res.next()){
                producto = new Producto();
                producto.setId(res.getInt("producto_id"));
                producto.setNombre(res.getString("nombre"));
                producto.setDescripcion(res.getString("descripcion"));
                producto.setPresentacion(res.getString("presentacion"));
                producto.setPrecio(res.getDouble("precio"));
                producto.setImagen(res.getString("imagen"));

                listaProductos.add(producto);
            }
        } catch (Exception ex) {
            Logger.getLogger(Carrito.class.getName()).log(Level.SEVERE, null, ex);
        }
       return listaProductos;
   }
}
