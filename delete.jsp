<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="java.io.*"%>  
  
<!DOCTYPE>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title></title>  
</head>  
<body>  

    
<% 
  /*连接数据库*/
  int flag = 0;
  PreparedStatement pst = null;
  Connection conn = null;
  try {
    String url = "jdbc:mysql://localhost:3306/test";  
    String use = "root";   
    String password = "root";  
    Class.forName("com.mysql.jdbc.Driver");  
    conn= DriverManager.getConnection(url,use,password);
    Statement stmt = conn.createStatement();
     String imgSrc=request.getParameter("imgSrc");
      String sql = "delete from images where img = '"+imgSrc +"'";
      pst =conn.prepareStatement(sql);  
     
      pst.executeUpdate(); 

      response.sendRedirect("main.jsp");
    }catch(Exception ex) {
      out.print("连接失败");
    }
    pst.close();
    conn.close();
    
    %>  
</body>  
</html>  