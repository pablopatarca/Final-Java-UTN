package Extras;

import java.sql.*;

public class Connection_class{
  public static Connection mysql_connect() {
      Connection conn = null;
      String url = "jdbc:mysql://localhost:3306/";
      String dbName = "vertecrecer_db";
      String driver = "com.mysql.jdbc.Driver";
      String userName = "root"; 
      String password = "421129";
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