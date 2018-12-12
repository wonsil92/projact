<%@page import="com.UTC.dao.MemberDao"%>
<%@page import="com.UTC.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>

<title>내 정보 수정</title>

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
  text-align:center;
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
</head>

<body>
<%
System.out.println("세션 정보 넘어오는지 확인");
//로그인 값 가져오기
MemberDto logindto = (MemberDto)session.getAttribute("dto");
System.out.println("세션이메일: "+ logindto.getMember_email());
System.out.println("회원번호: "+ logindto.getMember_id());
%>
   <div class="container">
   <div class="update-form">
      <form id="update-form" action="SemiProjectServlet.do?" method="post">
      <input type="hidden" name="command" value="updateuser">
         <div class="modal-header">
         <div class="main-div">
         <h2>회원정보수정</h2>
         </div>
         </div>
         <div class="modal-body">
               <div class="form-group">
                  아이디<input type="text" class="form-control" name="member_name" placeholder="${dto.member_name }">
               </div>
               <div class="form-group">
                  비밀번호<input type="password" class="form-control" name="member_pw" placeholder="변경할 비밀번호를 입력해주세요.">
               </div>
               <div class="form-group">
                  비밀번호확인<input type="password" class="form-control" name="pw_check" placeholder="비밀번호를 다시 입력해주세요.">
               
               </div>
               <div class="form-group">
                  이메일<input type="email" class="form-control" name="member_email" placeholder="${dto.member_email }">
               </div>
               </div>
               <div class="modal-footer">
               
                  <button type="submit" class="btn btn-success">수정</button>
                  <br><br>
                  <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
               </div>
         </form>
         

   </div>
   </div>

</body>
</html>