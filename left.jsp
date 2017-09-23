<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	 <link rel="stylesheet" type="text/css" href="css/left.css">
</head>
<body>
<!-- 连接数据库 -->
<%
 
  Connection con2 = null;
  
  Statement stmt2 = null;
 
  ResultSet rs2 = null;
 
  //当前登录的user值
  String users="1";
  try {
    Class.forName("com.mysql.jdbc.Driver");
    String dburl = "jdbc:mysql://localhost:3306/test";
    String dbuser = "root";
    String dbpass = "root";
    con2 = DriverManager.getConnection(dburl, dbuser, dbpass);
  
  stmt2 = con2.createStatement();
    
   String sql2 = "select * from record_copy where user = '" + users + "'";
    
    out.print(sql2);
  
     rs2 = stmt2.executeQuery(sql2);
  } catch(Exception ex) {
    out.print("连接失败");
  }
  
%>


<div id="msgBox">
                <form>
                    <h2>来 , 说说你在做什么 , 想什么</h2>
                    <div>
                      <input id="userName" class="f-text" value="" />
                      <p id="face"><img src="images/p1.png" class="current" />
                      <img src="images/p2.png" />
                      <img src="images/p3.png" />
                      <img src="images/p4.png" />
                      <img src="images/p5.png" />
                      <img src="images/p6.png" />
                      <img src="images/p7.png" />
                      <img src="images/p8.png" /></p>
                    </div>
                    <div><textarea id="conBox" class="f-text"></textarea></div>
                    <div class="tr">
                      <p>
                        <span class="countTxt">还能输入</span><strong class="maxNum">140</strong><span>个字</span>

                        <input id="sendBtn" type="button" value="提交" title="快捷键 Ctrl+Enter" />
                      </p>
                    </div>
                </form>
                <div class="list">
                    <h3><span>大家在说</span></h3>
                    <ul>
                  
                     
                    </ul>
                </div>  
</div> 
 <script type="text/javascript" src="js/left.js"></script>
</body>
</html>