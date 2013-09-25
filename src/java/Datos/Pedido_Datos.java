package Datos;
import Classes.Pedido;
import Classes.Producto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;




public class Pedido_Datos {
     public static void nuevoPedido(Pedido pedido) throws SQLException
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} 
		Connection con = Extras.Connection_class.mysql_connect();
		//int IDP = pedido.getId();
                //String Fecha = String.valueOf(pedido.getFecha());
                //String f = pedido.getFecha();
               
                //String Fecha = "date(" + f +")";
                int cliente_id = pedido.getClienteId();
		try
		{ 
    
                    //PreparedStatement pstm = (PreparedStatement) con.prepareStatement("INSERT INTO pedidos(cliente_id) VALUES(?);");
                    String query = "INSERT INTO pedidos(cliente_id, fecha, total) VALUES('"+
                            pedido.getClienteId() +"', '"+
                            pedido.getFechaSQL()+"', '"+
                            pedido.getTotal()+"' );";
                    PreparedStatement pstm = con.prepareStatement(query);

                    Statement statement = con.createStatement();
                    String [] columnas = { "pedido_id" };
                    statement.executeUpdate(query, columnas);
                    ResultSet rs = statement.getGeneratedKeys();
                    if(rs.next()){

                        //System.out.println("NUMERO DE PEDIDO: "+rs.getInt(1));
                        pedido.setId(rs.getInt(1));
                    }



                    ArrayList<Producto> listaProductos = pedido.getListaProductos();

                    for (Producto producto : listaProductos){
                        query = "INSERT INTO detalle_pedido(pedido_id, producto_id, cantidad)"
                                + "VALUES ("
                                + "'" + pedido.getId() +"',"
                                + "'" + producto.getId() +"',"
                                + "'" + producto.getCanidad() +"'"
                                + ")";

                        statement.executeUpdate(query);

                    }

                    con.close();
                        
		}
		catch(SQLException e)
		{
			throw e;     
		}
	}
       
      
    public static ArrayList<Pedido> getPedidos(int cliente_id) throws SQLException
    {
        Pedido pedido;
        ArrayList<Pedido> listaPedidos = new ArrayList<Pedido>();
        try {
                Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e1) {

                e1.printStackTrace();
        } 

        //Connection con = DriverManager.getConnection(ConexionDB.GetUrlConexion());
        Connection con = (Connection) Extras.Connection_class.mysql_connect();
        java.sql.PreparedStatement pstm;
        if(cliente_id!=0){
            pstm = con.prepareStatement("SELECT * FROM pedidos"
                + " WHERE pedidos.cliente_id = '" + cliente_id + "'");
        }else{
            pstm = con.prepareStatement("SELECT * FROM pedidos");  
        }
        ResultSet res = pstm.executeQuery();
        while(res.next()){

            pedido = new Pedido();
            pedido.setClienteId(cliente_id);
            pedido.setId(res.getInt("pedidos.pedido_id"));
            pedido.setTotal(res.getDouble("pedidos.total"));
            pedido.setFecha(res.getString("pedidos.fecha"));
            listaPedidos.add(pedido);
        }
        
        return listaPedidos;
    }
}
