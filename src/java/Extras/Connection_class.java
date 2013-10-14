package Extras;

import java.sql.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Connection_class{
    public static Connection mysql_connect() throws SQLException {
        /*
        Connection conn = null;
        try {
        InitialContext ctx = new InitialContext();
        DataSource ds = (DataSource)ctx.lookup("jdbc/testcp");
        conn = ds.getConnection();
        return conn;
        }catch(Exception e){
             e.printStackTrace();
             return conn;
    }
*/      
      Connection conn = null;
      String url = "jdbc:mysql://localhost:3306/";
      //String url = "jdbc:mysql://mysql-proyecto-java.jelastic.servint.net/";
      String dbName = "jdelivery";
      String driver = "com.mysql.jdbc.Driver";
      String userName = "jdelivery"; 
      String password = "2013";
      //String userName = "root"; 
      //String password = "hv5XS8my4f";
      try {
          Class.forName(driver).newInstance();
          conn = DriverManager.getConnection(url+dbName,userName,password);
          return conn;  
      } catch (Exception e) {
         e.printStackTrace();
          
          return conn;
    }
  }
}