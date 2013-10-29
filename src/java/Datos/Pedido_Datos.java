package Datos;
import Classes.Pedido;
import Classes.Producto;
import Classes.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;




public class Pedido_Datos {
     public static void nuevoPedido(Pedido pedido) throws SQLException
	{
            try {
                    Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e1) {
                    e1.printStackTrace();
            } 
            Connection con = Extras.Connection_class.mysql_connect();
            int cliente_id = pedido.getCliente().getId();
            try
            {
                String query = "INSERT INTO pedidos(cliente_id, total, fecha_pedido) VALUES('"+
                        pedido.getCliente().getId() +"', '"+
                        pedido.getTotal()+"', '"+
                        pedido.getFechaSQL()+"' );";
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
       
      
    public static ArrayList<Pedido> getPedidos(Cliente cliente) throws SQLException
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
        if(cliente.getId()!=0){
            pstm = con.prepareStatement("SELECT * FROM pedidos"
                + " WHERE pedidos.cliente_id = '" + cliente.getId() + "'");
        }else{
            pstm = con.prepareStatement("SELECT * FROM pedidos");  
        }
        ResultSet res = pstm.executeQuery();
        while(res.next()){

            pedido = new Pedido();
            pedido.setCliente(cliente);
            pedido.setId(res.getInt("pedidos.pedido_id"));
            pedido.setTotal(res.getDouble("pedidos.total"));
            pedido.setFecha(res.getString("pedidos.fecha_pedido"));
            listaPedidos.add(pedido);
        }
        
        return listaPedidos;
    }
}
