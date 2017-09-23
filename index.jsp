
<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Sign Up Login</title>
<link rel="stylesheet" href="css/lodin.css">
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>

<body>

<body>
<script type="text/javascript">

  

</script>

<div class="cotn_principal">
  <div class="cont_centrar">
    <div class="cont_login">
      <div class="cont_info_log_sign_up">
        <div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h2>LOGIN</h2>
            <p>记录生活点点滴滴</p>
         
           <div class="link mission-link">
            <a class="btn_login" id="homeP" onclick="cambiar_login()" >
            <span class="line line-top"></span>
            <span class="line line-right"></span>
            <span class="line line-bottom"></span>
            <span class="line line-left"></span>
            登录
            </a>
          </div>
          </div>
        </div>
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>SIGN UP</h2>
            <p>来这里发现自己的世界</p>
            <div class="link mission-link">
              <a class="btn_login" id="resert" onclick="cambiar_sign_up()" >
              <span class="line line-top resertD"></span>
              <span class="line line-right resertD"></span>
              <span class="line line-bottom resertD"></span>
              <span class="line line-left resertD"></span>
              注册
              </a>
            </div>
           <!--  <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button> -->
          </div>
        </div>
      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="images/222.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"> <img src="images/222.jpg" alt="" /> </div>
        <form id="lodD" action="requst.jsp" method="post"  class="cont_form_login">   <a href="#" onclick="ocultar_login_sign_up()" >
              <i class="material-icons">×</i>
            </a>
            <h2>LOGIN</h2>
            <input type="text" name="username" id="name" placeholder="用户名" />
            <input type="password" name="pwd" id="pwd" placeholder="Password" />
            <input type="submit" id="submit"  onclick="cambiar_login()" value="登录" />
        </form>
        <form class="cont_form_sign_up" action="register.jsp" method="post"> 
          <a href="#" onclick="ocultar_login_sign_up()">
            <i class="material-icons">×</i>
          </a>
          <h2>SIGN UP</h2>
          <ul class="reg_ul">
            <li>
              <span>用户名：</span>
              <input type="text" name="Ruser" id="registerUser" value="" placeholder="0-8位用户名" class="reg_user">
              <span class="user_hint"></span>
            </li>
            <li>
              <span>密码：</span>
              <input type="password" name="Rpwd" id="registerPwd" value="" placeholder="6-16位密码" class="reg_password">
              <span class="password_hint"></span>
            </li>
            <li>
              <span>确认密码：</span>
              <input type="password" name="conPwd" id="conPwd" value="" placeholder="确认密码" class="reg_confirm">
              <span class="confirm_hint"></span>
            </li>
             <li>
              <span>上传头像：</span>
              <input type="file" name="registerHead" id="registerHead" value="">
              
            </li>
            <li>
              <span>爱好：</span>
              <input type="text" name="like" value="" id="email" placeholder="爱好" class="reg_email">
              
            </li>
            <li>
              <span>生日：</span>
              <input type="date" name="registerBirth" id="registerBirth" >
             
            </li>
            <li>
              
              <input class="btn_sign_up" type="submit" id="registerSubmit" onclick="cambiar_sign_up()" value="注册" />
            </li>
          </ul>
         

        </form>
      </div>
    </div>
  </div>
</div>
<script src="js/lodin.js"></script>
</body>

</body>
</html>
