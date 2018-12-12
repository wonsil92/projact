<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
 
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

body#joinForm{ background-image:url("https://hdwallsource.com/img/2014/9/blur-26347-27038-hd-wallpapers.jpg"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;}

.form-heading { color:#fff; font-size:23px;}
.modal-header h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
.modal-header p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
.join-form .form-control {
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

.join-form .form-group {
  margin-bottom:10px;
}

.join-form{ text-align:center;}
.forgot a {
  color: #777777;
  font-size: 14px;
  text-decoration: underline;
}
.join-form .btn.btn-primary {
  background: #f0ad4e none repeat scroll 0 0;
  border-color: #f0ad4e;
  color: #ffffff;
  font-size: 14px;
  width: 100%;
  height: 50px;
  line-height: 50px;
  padding: 0;
}

.join-form .btn.btn-default {
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

<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	//이메일 인증버튼을 누르면
	function emailcheck(){
		var x = document.getElementById("inputEmail").value;
		
		if(x == ""){
			alert("이메일을 입력해주세요.");
			return false;
		}
		window.open("SemiProjectServlet.do?command=emailcheck&member_email="+x);
	}
	

	//회원가입 빈값
	function signup(){
		
		//회원가입 입력조건
		var userPw = document.joinform.member_pw;
		var userPwRe = document.joinform.member_pw_re;
		var userName = document.joinform.member_name;
		var userEmail = document.joinform.member_email;
		var emailcheck = document.joinform.inputEmail.readOnly;
		
		if(userName.value == ""){
			alert("이름을 입력해주세요.");
			userName.focus();
			return false;
		}
		
		if(userEmail.value == ""){
			alert("이메일을 입력해주세요.");
			document.joinform.member_email.focus();
			userEmail.focus();
			return false;
		}
		
		if(userPw.value == ""){
			alert("비밀번호를 입력해주세요.");
			userPw.focus();
			return false;
		}
		if(userPwRe.value ==""){
			alert("비밀번호를 한번 더 입력해주세요.");
			userPwRe.focus();
			return false;
		}
		
		//비밀번호가 같은지 검사
		if(userPw.value != userPwRe.value){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
		//비밀번호 6자리 미만이면 알림
		if(userPw.value.length < 6){
			alert("비밀번호는 6자리 이상으로 만들어주세요.");
			return false;
		}
		
		//비밀번호 생성시 특수문자 섞어서 만들기
		if(!userPw.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)){
			alert("비밀번호는 특수문자(!@$%^&* 만 허용)를 섞어서 6자리 이상으로 만들어주세요.");
			return false;
		}
		
		if(emailcheck == false){
			alert("이메일 인증을 해주세요.");
			return false;
		}
		return true;
	}
</script>
</head>
<body>

<body id="joinForm">
<div class="container">
<div class="join-form">

    <form name="joinform" id="join-form" action="SemiProjectServlet.do" method="post" onSubmit="return signup(); ">
    <input type="hidden" name="command" value="insertuser">
       
    <div class="modal-header">
    <div class="main-div">
   <h2>Sign Up</h2>
   <p>Enjoy UTC</p>
   </div>
   </div>
    	<div class="modal-body">
    	
    	<div class="form-group">
           <input type="text" name="member_name" class="form-control" id="inputId" placeholder="name">
        </div>
        
        <div class="form-group">
           <input type="email" name="member_email" class="form-control" id="inputEmail" placeholder="Email Address">
           <input type="button" name="email_check" class="btn btn-primary" value="이메일 인증하기"
           onclick="emailcheck();"/>
        </div>

        <div class="form-group">
            <input type="password" name="member_pw" class="form-control" id="inputPassword" placeholder="Password">
        </div>
        <div class="form-group">
            <input type="password" name="member_pw_re" class="form-control" id="inputPassword_chk" placeholder="Password_check">
        </div>
        
    	 </div>
     <div class="modal-footer">
        <button type="submit" class="btn btn-primary" onclick="email_check(member_email)">Join</button>
        <br> <br> 
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		
	</div>
    </form>
    </div>

<p class="botto-text"> Designed by Sunil Rajput</p>
</div>

</body>

</body>
</html>