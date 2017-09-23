<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.*"%>  
<%@ page import="java.io.*"%>  
  
<!DOCTYPE>  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
<title>注册</title>  
</head>  
<body>  

    
<% 
    /*连接数据库*/
    int flag = 0;
    request.setCharacterEncoding("UTF-8");  
    String url = "jdbc:mysql://localhost:3306/test";  
    String use = "root";   
    String password = "root";  
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn= DriverManager.getConnection(url,use,password);
    Statement stmt = conn.createStatement();
    

    Connection conn1= DriverManager.getConnection(url,use,password);
    Statement stmt1 = conn1.createStatement();
    String sql1 = "select * from personweb";
    ResultSet rs = stmt1.executeQuery(sql1);
    rs.last();
    int id = rs.getInt("id") + 1;

    PreparedStatement sql =conn.prepareStatement("insert into personweb values (?,?,?,?,?,?,?,?,?)");  
    String registerUser = request.getParameter("Ruser").trim();
    String registerPwd = request.getParameter("Rpwd").trim();
    //String registerSaying = request.getParameter("registerSaying").trim();
    String registerLike = request.getParameter("like");
    String registerBirth = request.getParameter("registerBirth");
    String registerHead = request.getParameter("registerHead");
    String registerHeads = "images/"+registerHead;
    String sex="无";
    String email = "无";
    String saying = "无";
    sql.setInt(1,id);
    sql.setString(2,registerUser);
    sql.setString(3,sex);
    sql.setString(4,registerPwd);
     sql.setString(5,email);
    sql.setString(6,saying);
    sql.setString(7,registerLike);
    sql.setString(8,registerBirth);
    sql.setString(9,registerHeads);

     
     
    sql.executeUpdate(); 
    flag = 1;
    if(flag == 1){
        response.sendRedirect("index.jsp");
}
    sql.close();
    conn.close();
    
    %>  
</body>  
</html>  