package Datos;

import Classes.Cliente;
import java.sql.*;
import java.util.ArrayList;

public abstract class Cliente_Datos 
{
    public static Cliente ValidarCliente(String usuario, String pass) throws SQLException
    {    
        Cliente cli = null;
        try
        {
            Connection con = Extras.Connection_class.mysql_connect();
            PreparedStatement pstm = con.prepareStatement(
                    "SELECT * FROM clientes WHERE"
                    + " usuario='" + usuario+"'"
                    + " AND password='" + pass + "'");

            ResultSet res= pstm.executeQuery();

            if(res.next())
            {
                cli = new Cliente();
                cli.setId(Integer.parseInt(res.getString("cliente_id").toString()));
                cli.setNombre(res.getString("nombre"));
                cli.setApellido(res.getString("apellido"));
                cli.setTelefono(res.getString("telefono"));
                cli.setDireccion(res.getString("direccion"));
                cli.setUsuario(res.getString("usuario"));
                cli.setEmail(res.getString("email"));
            }
            pstm.close();
            res.close();
            con.close();
        }
        catch(SQLException e)
        {
                throw e;
        }

        return cli;
    }
    public static Cliente buscarCliente(String usuario) throws SQLException
    {
    Cliente cli = null;
            try
            {
                    Connection con = Extras.Connection_class.mysql_connect();
                    PreparedStatement pstm= con.prepareStatement("SELECT * FROM clientes WHERE usuario='"+usuario+"'");
                    ResultSet res= pstm.executeQuery();
                    if(res.next())
                    {
                            cli = new Cliente();
                            cli.setNombre(res.getString("nombre"));
                            cli.setApellido(res.getString("apellido"));
                            cli.setTelefono(res.getString("telefono"));
                            cli.setUsuario(res.getString("usuario"));
                            cli.setEmail(res.getString("email"));
                    }
                    pstm.close();
                    res.close();
                    con.close();
            }
            catch(SQLException e)
            {
                    throw e;
            }

            return cli;
    }
    public static boolean nuevoCliente(Cliente cli) throws SQLException
    {
            try{
                Connection con = Extras.Connection_class.mysql_connect();
                    String query = "INSERT INTO clientes"
                            + "(usuario, password, apellido, nombre, direccion, telefono, email)"
                            + " VALUES"
                            + "('"+cli.getUsuario()+"',"
                            + "'"+cli.getPassword()+"',"
                            + "'"+cli.getApellido()+"',"
                            + "'"+cli.getNombre()+"',"
                            + "'"+cli.getDireccion()+"',"
                            + "'"+cli.getTelefono()+"',"
                            + "'"+cli.getEmail()+"')";

                    System.out.println(query);

                    Statement statement = con.createStatement();
                    statement.executeUpdate(query);

                    con.close();
                    return true;
            }
            catch(SQLException e)
            {       
                    return false;
                    //throw e;
            }
    }
    public static void actualizarCliente(Cliente cli) throws SQLException
    {
            try{
                Connection con = Extras.Connection_class.mysql_connect();            
                PreparedStatement pstm = con.prepareStatement("UPDATE clientes set nombre=?, apellido=?, email=?, direccion=?, telefono=? where usuario=?");
                pstm.setString(1, cli.getNombre());
                pstm.setString(2, cli.getApellido());
                pstm.setString(3, cli.getEmail());
                pstm.setString(4, cli.getDireccion());
                pstm.setString(5, cli.getTelefono());
                pstm.setString(6, cli.getUsuario());
                pstm.executeUpdate();		
                pstm.close();
                con.close();

            }
            catch(SQLException e)
            {
                    throw e;
            }
    }


    public static ArrayList<Cliente> getClientes() throws SQLException
    {
        ArrayList<Cliente> listaClientes = new ArrayList<Cliente>();
        Cliente cli = null;
            try
            {
                    Connection con = Extras.Connection_class.mysql_connect();
                    PreparedStatement pstm= con.prepareStatement("SELECT * FROM clientes WHERE usuario not like 'administrador'");
                    ResultSet res= pstm.executeQuery();
                    while(res.next())
                    {
                            cli = new Cliente();
                            cli.setId(res.getInt("cliente_id"));
                            cli.setNombre(res.getString("nombre"));
                            cli.setApellido(res.getString("apellido"));
                            cli.setTelefono(res.getString("telefono"));
                            cli.setUsuario(res.getString("usuario"));
                            cli.setEmail(res.getString("email"));
                            cli.setDireccion(res.getString("direccion"));
                            listaClientes.add(cli);
                    }
                    pstm.close();
                    res.close();
                    con.close();
            }
            catch(SQLException e)
            {
                    throw e;
            }

            return listaClientes;
    }
    
    public static void eliminarCliente(int cliente_id) throws SQLException
    {
        try
        {
            Connection con = Extras.Connection_class.mysql_connect();
            PreparedStatement pstm= con.prepareStatement("DELETE FROM clientes WHERE cliente_id='"+cliente_id+"'");
            System.out.println("DELETE FROM clientes WHERE cliente_id='"+cliente_id+"'");
            pstm.executeUpdate();

            pstm.close();
            con.close();
        }
        catch(SQLException e)
        {
            throw e;
        }

    }
                
}
