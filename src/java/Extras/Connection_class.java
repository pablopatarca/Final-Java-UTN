package Extras;

import java.sql.*;

public class Connection_class{
  public static Connection mysql_connect() {
      Connection conn = null;
      String url = "jdbc:mysql://localhost:3306/";
      //String url = "jdbc:mysql://https://mysql-proyectojavautn.jelastic.servint.net";
      String dbName = "jdelivery_db";
      String driver = "com.mysql.jdbc.Driver";
      String userName = "jdelivery"; 
      String password = "2013";
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