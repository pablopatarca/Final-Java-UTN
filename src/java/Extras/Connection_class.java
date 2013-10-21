package Extras;

import java.sql.*;

public class Connection_class{
    public static Connection mysql_connect() throws SQLException {
 
      Connection conn = null;
      String url = "jdbc:mysql://mysql-javautn.jelastic.servint.net/";
      String dbName = "jdelivery";
      String driver = "com.mysql.jdbc.Driver";
      String userName = "root"; 
      String password = "hv5XS8my4f";
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