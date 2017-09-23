<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="java.io.*"%>  
  
<!DOCTYPE>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>说说上传</title>  
</head>  
<body>  

    
<% 
    /*连接数据库*/
    request.setCharacterEncoding("UTF-8");  
    int flag = 0;
    String url = "jdbc:mysql://localhost:3306/test";  
    String use = "root";   
    String password = "root";  
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn= DriverManager.getConnection(url,use,password);
    Statement stmt = conn.createStatement();
    

    Connection conn1= DriverManager.getConnection(url,use,password);
    Statement stmt1 = conn1.createStatement();
    String sql1 = "select * from record";
    ResultSet rs = stmt1.executeQuery(sql1);
    rs.last();
    int id = rs.getInt("id") + 1;

    PreparedStatement sql =conn.prepareStatement("insert into record values (?,?,?,?,?)");  
    
    String title=request.getParameter("title");
    String content=request.getParameter("writeContent");
    String submitTime="2017-09-15";
    //request.getParameter("submitTime");
    String users=(String)session.getAttribute("users");
    sql.setInt(1,id);
    sql.setString(2,users);
    sql.setString(3,title);
    sql.setString(4,content);
    sql.setString(5,submitTime);
     
     
    sql.executeUpdate(); 
    flag = 1;
    if(flag == 1){
        response.sendRedirect("main.jsp");
}
    sql.close();
    conn.close();
    
    %>  
</body>  
</html>  