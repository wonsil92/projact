<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style type="text/css">
	body#LoginForm{ background-image:url("https://hdwallsource.com/img/2014/9/blur-26347-27038-hd-wallpapers.jpg"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;}
	.form-heading { color:#fff; font-size:23px;}
	.modal-header h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
	.modal-header p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
	.login-form .form-control {
 		background: #f7f7f7 none repeat scroll 0 0;
  		border: 1px solid #d4d4d4;
  		border-radius: 4px;
  		font-size: 14px;
  		height: 50px;
  		line-height: 50px;
	}
	.main-div {
  		background: #ffffff none repeat scroll 0 0;
  		border-radius: 2px;
		margin: 10px auto 30px;
  		max-width: 100%;
	}
	.login-form .form-group {
  		margin-bottom:10px;
	}
	.login-form{ text-align:center;}
	.forgot a {
  		color: #777777;
  		font-size: 14px;
  		text-decoration: underline;
	}
	.login-form  .btn.btn-primary {
  	background: #f0ad4e none repeat scroll 0 0;
  	border-color: #f0ad4e;
  	color: #ffffff;
  	font-size: 14px;
  	width: 100%;
 	 height: 50px;
 	 line-height: 50px;
 	 padding: 0;
	}

.login-form .btn.btn-default {
  font-size: 14px;
  width: 100%;
  height: 50px;
  line-height: 50px;
  padding: 0;
}

.botto-text {
  color: #ffffff;
  font-size: 14px;
  margin: auto;
}

.back { text-align: left; margin-top:10px;}
.back a {color: #444444; font-size: 13px;text-decoration: none;}

</style>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body id="LoginForm">

<div class="container">
<div class="login-form">
	
	<!-- 로그인! -->
    <form id="login-form" name="loginform" action="SemiProjectServlet.do" method="post">
    <input type="hidden" name="command" value="login"/>
    <div class="modal-header">
    <div class="main-div">
   <h2>Login</h2>
   <p>Please enter your ID and password</p>
   </div>
   </div>
    	<div class="modal-body">
        <div class="form-group">

            <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email Address">
        </div>

        <div class="form-group">
            <input type="password" name="pw" class="form-control" id="inputPassword" placeholder="Password">
        </div>
        
        
<!--          <div id="naver_id_login">네이버로그인</div> -->
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("9y7sddWeqoefIo1Uj6CF", "http://localhost:8787/semi/index.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8787/semi/loginform.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script> 
   		<div class="form-group">

   		</div>
    	 </div>
    	 
     <div class="modal-footer">
        <button type="submit" class="btn btn-primary">Login</button>
        <br> <br> 
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		
	</div>
	
    </form>
    </div>
 	
<p class="botto-text"> Designed by Sunil Rajput</p>
</div>

</body>
</html>
