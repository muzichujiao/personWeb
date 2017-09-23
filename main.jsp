<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>我的主页</title>
	<link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/demo_styles.css">
    <link rel="stylesheet" href="css/demo4.css">
    <link rel="stylesheet" type="text/css" href="css/default.css">
    <!-- 留言 -->
     <link rel="stylesheet" type="text/css" href="css/index.css">
     <!-- 留言板 -->
     <link rel="stylesheet" type="text/css" href="css/left.css">
     
    <!-- 照片墙 -->
     <link rel="stylesheet" type="text/css" href="css/style1.css" />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css' />

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<!--[if IE]>
		<script src="http://libs.baidu.com/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body class="dm-demo4">
<!-- 连接数据库 -->
<%
  Connection con = null;
  Connection con1 = null;
  Connection con2 = null;
  Connection con3 = null;
  Statement stmt1 = null; 
  Statement stmt = null;
  Statement stmt2 = null;
  Statement stmt3 = null;
  ResultSet rs = null; 
  ResultSet rs1 = null; 
  ResultSet rs2 = null;
  ResultSet rs3 = null;
  //当前登录的user值
  String users=(String)session.getAttribute("users");
  try {
    Class.forName("com.mysql.jdbc.Driver");
    String dburl = "jdbc:mysql://localhost:3306/test";
    String dbuser = "root";
    String dbpass = "root";
    con = DriverManager.getConnection(dburl, dbuser, dbpass);
    con1 = DriverManager.getConnection(dburl, dbuser, dbpass);
    con2 = DriverManager.getConnection(dburl, dbuser, dbpass);
    con3 = DriverManager.getConnection(dburl, dbuser, dbpass);
    stmt = con.createStatement();
    stmt1 = con1.createStatement();
    stmt2 = con2.createStatement();
    stmt3 = con3.createStatement();
    String sql = "SELECT * FROM personweb where user ='"+users+"'" ;
    String sq = "SELECT * FROM images where user ='"+users+"'";
    String sql2 = "select * from record where user = '" + users + "'";
    String sql3 = "SELECT * FROM record_copy where user ='"+users+"'";
   
    rs = stmt.executeQuery(sql); 
    rs1 = stmt1.executeQuery(sq);
    
    rs2 = stmt2.executeQuery(sql2);
    rs3 = stmt3.executeQuery(sql3);
  } catch(Exception ex) {
    out.print("连接失败");
  }
  
%>
<% while(rs.next()){ %>
<!-- 模版定义 -->

<div class="hide">
    <div id="tpl_scrubber_year">
        <a href="javascript:;" onclick="showYear({year},this)" class="s_year" id="scrubber_year_{year}">{year}
            {list}
        </a>
    </div>

    <div id="tpl_scrubber_month" >
           <a href="javascript:;" class="s_month {year}_month" onclick="showMonth({year},{month},this)" id="scrubber_month_{year}{month}" >{month}月</a>
    </div>

    <div id="tpl_content_year">

        <div class="c_year" id="content_year_{year}">{year}</div>
        {list}

    </div>

    <div id="tpl_content_month">

        <div class="c_item c_item_{leftOrRight} content_date_{year}{month} {isFirst}">

            <div class="c_i_icon_arrow"></div>
            <div class="c_i_icon_dot"><div class="c_i_icon_dot_child"></div></div>

            <div class="c_i_head">

                <div class="c_i_head_title">
                    {title}
                </div>
                <div class="c_i_head_intro">
                    <i class="ui_ico quote_before"></i>
                    <pre>{intro}</pre>
                    <i class="ui_ico quote_after"></i>
                    <p>{date}</p>
                </div>
            </div>
          
            <div class="c_i_footer">
                <!-- <div class="c_i_footer_info"> -->

                    <form id="deleteR" action="deleteRecord.jsp" method="post">
                        <input type="submit" value="删除"/>
                        <input id="resertId" type="text" name="resertId" value="{id}"/>
                         <input id="Echange" value="修改" type="button" />
                    </form>
                    
                        
                       
               <!--  </div> -->
            </div>

        </div>

    </div>
</div>



	<div class="htmleaf-container">
		<header></header>
		<!-- Demo Navigation -->
    <div class="main">
        <div class="navHeader">
            <img src="<% out.print(rs.getString("headP")); %>">
            <p><% out.print(rs.getString("user")); %></p>
            
          </div>
        <nav class="nav clearfix">         
            <button class="nav-el" id="el-topleft" data-id="ov-topleft"><span class="icon-lock"></span><span id="mainP">我的资料</span></button>
            <button class="nav-el" id="el-topright" data-id="ov-topright"><span class="icon-params"></span><span id="source">我的留言</span></button>
            <button class="nav-el" id="el-btmleft" data-id="ov-btmleft"><span class="icon-stack"></span><span id="photoes">相册</span></button>
            <button class="nav-el" id="el-btmright" data-id="ov-btmright"><span class="icon-fire"></span><span id="sayings">说说</span></button>
          
        </nav>
      </div>

        <!-- Overlay (hidden by default)-->
        <section class="overlay" id="ov-topright">
            <div class="wrap">
                <h1>留言</h1>

                <div id="msgBox">
                  <form id="insertLeft" action="insertLeft.jsp"  method="post">
                    <h2>来 , 说说你在做什么 , 想什么</h2>
                    <div>
                      <input id="userName" name="leftName" class="f-text" value="" />
                      <p id="face">
                        <img src="images/p1.png" class="current" />
                      <img src="images/p2.png" />
                      <img src="images/p3.png" />
                      <img src="images/p4.png" />
                      <img src="images/p5.png" />
                      <img src="images/p6.png" />
                      <img src="images/p7.png" />
                      <img src="images/p8.png" />
                      <input type="text" name="leftImg" id="leftImg" value="" />
                      </p>
                    </div>
                    <div><textarea id="conBox" name="leftMain" class="f-text"></textarea></div>
                    <div class="tr">
                      <p>
                        <input type="text" id="leftTime" name="leftTime" value="" />
                        <span class="countTxt">还能输入</span><strong class="maxNum">140</strong><span>个字</span>

                        <input class="btn btn-4 btn-4a icon-arrow-right" id="sendBtn" type="submit" value="提交"  />
                      </p>
                    </div>
                  </form>
                  <div class="list">
                    <h3><span>大家在说</span></h3>
                    <ul>
                    <% while(rs3.next()){ %>
                      <li>
                        <div class="userPic">
                          
                          <img src="<% out.print(rs3.getString("img")); %>" />
                        </div>

                        <div class="content2">
                          <div class="leftcont">
                            <div class="userName">
                              <% out.print(rs3.getString("name")); %>
                            </div>
                            <div class="msgInfo">
                              <% out.print(rs3.getString("cont")); %>
                            </div>
                          </div>
                          <div class="times">
                            <span><% out.print(rs3.getString("time")); %></span>
                            <a class="del" href="javascript:;">删除</a>
                          </div>
                        </div>
                      </li>
                      <% } %> 
                     
                    </ul>
                  </div>  
                </div> 
            </div>

            <button class="close"><span class="mfg-cancel"></span></button>
        </section>
        <!-- 个人资料 -->
        <section class="overlay" id="ov-topleft">
            <div class="wrap">
               <div class="introLeft">
                   <img src = "<% out.print(rs.getString("headP")); %>"/> <p>
                    <%
                        out.print(rs.getString("user"));
                    %>  
               </div>
               <div class="introRight">
                   <h1>个人资料</h1>
                   <div class="inforCont">
                       <p>姓名：
                        <span><%out.print(rs.getString("user"));%>  
                        </span>
                       </p>
                       <p>生日：
                        <span id="birth"><%out.print(rs.getString("birth"));%> 
                        </span>
                       </p>
                       <p>性别：
                        <span id="sex"><%out.print(rs.getString("sex"));%>  
                        </span>
                       </p>
                       <p>邮箱：
                        <span id="email"><%out.print(rs.getString("email"));%>  
                        </span>
                       </p>
                       <p>爱好：
                        <span id="like"><%out.print(rs.getString("habby"));%>  
                        </span>
                       </p>
                       <p>名言：
                        <span id="saying"><%out.print(rs.getString("saying"));%>  
                        </span>
                       </p>
                       
                   </div>
               </div>
               <form class="inforCheck" method="post" action="exchange.jsp">
                    <h1>个人资料修改</h1>
                   <div class="inforCont">
                       <p><span id="exchangeName">姓名：</span>
                        <span id="exchangeNameM"><%out.print(rs.getString("user"));%>  
                        </span>
                       </p>
                       <p>生日：
                        <input id="chBirth" type="date" name="chBirth" />
                       </p>
                       <p>性别：
                        <input id="chSex" type="text" name="chSex" />
                       </p>
                        <p>邮箱：
                        <input id="chEmail" type="text" name="chEmail" />
                       </p>
                       <p>爱好：
                        <input type="text" name="chLike" id="chLike" />
                       </p>
                       <p>名言：
                        <input type="text" name="chSaying" id="chSaying" />
                       </p>
                       
                   </div>
               <input type="submit" id="chSubmit" value="提交" />
               </form>
               
               
            </div>
            <div class="changeInfor">
                   <button id="changeIn" onclick="checkinfor()">修改</button>

                    <button id="backIn" onclick="backinfor()">返回</button>
               </div>
            <button class="close"><span class="mfg-cancel"></span></button>
        </section>
        <!-- 相册 -->
        <section class="overlay" id="ov-btmleft">
          <div class="wrap">
          <div class="content1">
            <header>
              <h1>我的相册</h1>  
            </header>

            <div class="iw_wrapper">
              <ul class="iw_thumbs" id="iw_thumbs">
              <% while(rs1.next()){ %>
                <li>
                <img src = "<% out.print(rs1.getString("img")); %>"  data-img="<% out.print(rs1.getString("img")); %>" />
           
                <div>
                  <h2><% out.print(rs1.getString("dir")); %></h2>
                  <p>
                  </p>
                  <form id="photoDelete"  method="post" action="delete.jsp">
                      <input type="text" name="imgSrc" id="fuck" value=""/>
                    <input type="submit" id="deletePhoto" value="删除"/>
                  </form>
               
                </div>
                </li>               
              <% }%>                
              </ul>
            </div>
            <div id="iw_ribbon" class="iw_ribbon">
              <span class="iw_close"></span>

       
            </div>
          </div>
          <form method="post" id="insertPCont" action="insertPhoto.jsp">
            <div>
              <h2>上传照片</h2>
              <input type="file" name="image" id="fileImg" /> 
              <input type="text" name="imgdir" id="imgdir" value="添加照片描述" />  
              <input type="submit" id="submitImg" />
              <input type="button" id="photoBack" value="退出" onclick="backinfor()" />
            </div>
  
          </form>
          <div class="insertP">
          <button onclick="insertPh()">上传照片</button>
          </div>  
          </div>

            <button class="close"><span class="mfg-cancel"></span></button>
        </section>
        <!-- 说说 -->
        <section class="overlay" id="ov-btmright">
            <div class="wrap">
                <h1>我的说说</h1>
                <div class="titleRecord">
                  <button id="write" >写说说</button>
                </div>
                <div class="container">
                  <div class="scrubber" id="scrubber"> <!-- 时序列表 -->
                  </div>
                  <div class="content" id="content"> <!-- 内容 -->
                  </div>
                 
                </div>       
                
                <!-- 写日志 -->
                  <form id="writeRecord" action="insertRecord.jsp" method="post">
                    <div class="writeContTitle">
                
                    </div>
                    <div class="writeRecordCont">
                      <input type="text" id="recordTitle" name="title" value="请在这里输入标题" />
                
                      <textarea name="writeContent" id="writeContent">
                      </textarea> 
                      <input type="text" name="submitTime" id="submitTime" value="2017-09-15" />
                      <div class="writeButton">
                        <input type="submit" id="recordSubmit" value="发表" />
                        <input type="button" id="recordResert" value="取消" />
                      </div> 
                    </div>      
                  </form>
            </div>

            <button class="close"><span class="mfg-cancel"></span></button>
        </section>

        <div class="browser_msg">
            <p>对不起，你的浏览器不支持CSS3特性！</a></p>
        </div>
		
	</div>
<% } %>	
   
    <script src="js/plugins.js"></script>
    <script src="js/demo.js"></script>
    <!-- 留言 -->
    <script type="text/javascript">
        var data = [];
        <% while(rs2.next()){ 
        %>
            data.push({
                'date'  : '<% out.print(rs2.getString("time"));  %>',
                'title' :'<% out.print(rs2.getString("title"));%>',
                'intro' : '<% out.print(rs2.getString("cont"));  %>',
                'id' :'<% out.print(rs2.getInt("id")); %>'       
            })
        <% } %>
        $("#write").click(function(){
            $("#writeRecord").fadeIn(2000);
            $(this).fadeOut(2000);
            $(".container").fadeOut(2000);

        });
        $("#recordResert").click(function(){
            $("#writeRecord").fadeOut(2000);
            $("#write").fadeIn(2000);
            $(".container").fadeIn(2000);
        });
        $("#Echange").click(function(){
          $("#writeRecord").fadeIn(2000);
            $(this).fadeOut(2000);
            $(".container").fadeOut(2000);
        });
        window.onload=function(){
           if($("#sex").text() ==null)
              $("#sex").text("无");
            alert($("#sex").text());
}
    </script>
    
    <script type="text/javascript" src="js/fx.js"></script>
    <script type="text/javascript" src="js/GetLunarDay.js"></script>
    <script type="text/javascript" src="js/data.js"></script>
    <script type="text/javascript" src="js/record.js"></script>
    <!-- 留言板 -->
    <script type="text/javascript" src="js/left.js"></script>
   
    <!-- 照片墙 -->
      <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.masonry.min.js"></script>
    <script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="js/photo.js">
     
    </script>

</body>
</html>