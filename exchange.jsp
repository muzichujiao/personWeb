<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
String users=(String)session.getAttribute("users");

 request.setCharacterEncoding("utf-8");
String chBirth=request.getParameter("chBirth");
String chSex=request.getParameter("chSex");
String chEmail=request.getParameter("chEmail");
String chLike=request.getParameter("chLike");
String chSaying=request.getParameter("chSaying");
Connection con=null;
try
{ 
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
Statement sql; 
sql=con.createStatement(); 
String sql2="update personweb set sex='"+chSex+"',email='"+chEmail+"',saying='"+chSaying+"',habby='"+chLike+"',birth='"+chBirth+"' where user='"+users+"'";
int s=sql.executeUpdate(sql2);

response.sendRedirect("main.jsp");
}
catch(Exception e){
out.print("s");
}
%>
