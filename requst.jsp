
<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'check.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

 </head>
  <body>
<%
   request.setCharacterEncoding("utf-8");
   String users=request.getParameter("username").trim();
   String pass=request.getParameter("pwd").trim();
   boolean flag=false;
   PreparedStatement sql=null;  
   ResultSet rs=null;
   Connection conn=null;
    String driver = "com.mysql.jdbc.Driver";  
    String url = "jdbc:mysql://localhost:3306/test";  
    String use = "root";   
    String password = "root";  
    Class.forName(driver);  
    conn= DriverManager.getConnection(url,use,password);  
    sql =conn.prepareStatement("select * from personweb where user=? and pwd=?");
    sql.setString(1,users);
    sql.setString(2,pass);
    rs=sql.executeQuery();
   
    while(rs.next()) {  
    	flag=true;
     }
   rs.close();
   sql.close();
   conn.close();
  %>
<!-- 判断是否是正确的登录用户 -->
<% if (flag==true){ 
	session.setAttribute("users", users);
	response.sendRedirect("main.jsp");
%>


<%} 
else
if (flag==false){
	response.sendRedirect("index.jsp");
	
%>

<%} %>
</body>
</html>

