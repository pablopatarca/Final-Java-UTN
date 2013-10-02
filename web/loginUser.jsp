<%-- 
    Document   : loginUser
    Created on : 16/05/2013, 19:19:34
    Author     : Pablo
--%>

<%@ page language="java" import="java.sql.*" errorPage="" %>
<%

    Connection conn = null;
    conn = Extras.Connection_class.mysql_connect();
    
    ResultSet rsdoLogin = null;
    PreparedStatement psdoLogin = null;
    
    String sUserID=request.getParameter("username");
    String sPassword=request.getParameter("pass");
    String message="Se ha autenticado correctamente ";
    
    try{
        String sqlOption="SELECT * FROM usermaster where"
                        +" sUserID=? and sPassword=password(?) and sStatus='A'";

        psdoLogin=conn.prepareStatement(sqlOption);
        psdoLogin.setString(1,sUserID);
        psdoLogin.setString(2,sPassword);
        rsdoLogin=psdoLogin.executeQuery();
        //Armo el string de consulta para ver si existe el user.
        if(rsdoLogin.next())
        {
          String sUserName=rsdoLogin.getString("name")+" "+rsdoLogin.getString("lname");
          session.setAttribute("sUserID",rsdoLogin.getString("sUserID"));
          session.setAttribute("sUserName",sUserName);
          response.sendRedirect("index.jsp?error="+message);
        }
        else
        {
          message="Usuario o contraseña incorrectos" ;
          response.sendRedirect("login.jsp?error="+message);
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    /// close object and connection
    try{
         if(psdoLogin!=null){
             psdoLogin.close();
         }
         if(rsdoLogin!=null){
             rsdoLogin.close();
         }
         
         if(conn!=null){
          conn.close();
         }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>