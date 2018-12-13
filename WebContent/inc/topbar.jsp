
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %> 
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>UTC</title>
	
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<link href="css/one-page-wonder.min.css" rel="stylesheet">
<link href="plugins/ajax/ajax_helper.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="plugins/handlebars/handlebars-v4.0.5.js"></script>

<!-- 입력값 유효성 검사 스크립트 -->
<script type="text/javascript">

//회원가입 폼 비밀번호 유효성 검사
function pw_check(){
	
	//패스워드 유효성 체크(문자,숫자,특수문자의 조합으로 6~16자리로)
	var userPw = document.joinform.member_pw;
	var userPwRe = document.joinform.member_pw_re;
	
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
	return true;
}

//회원가입 폼 이메일 유효성 검사하기(이메일 형식 검사)
function email_check(){
	var email = document.getElementById("inputEmail").value;
	var chk_list = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if(chk_list.test(email)==false){
			alert("이메일 형식이 올바르지 않습니다.");
			document.joinform.email.focus();
			return false;
		}
}


</script>
</head>
<!---------------------------------------바디 바디 바디----------------------------------->
<body>

	<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">


	<!--  드롭다운-->
	<div class="container">
 		<div class="dropdown">
    		<button type="button" class="btn btn-link" data-toggle="dropdown">
      			<span class="navbar-toggler-icon"></span>
   			</button>
   			
    		<div class="dropdown-menu">     		
    			<a class="dropdown-item"href="SemiProjectServlet.do?command=make_up_self"><strong style="color:dark;">Create My Page</strong></a>
  				<a class="dropdown-item"href="SemiProjectServlet.do?command=list"><strong style="color:dark;">User Reviews</strong></a>
  				<a class="dropdown-item"href="SemiProjectServlet.do?command=qalist"><strong style="color:dark;">Q&nbsp;&&nbsp;A Board</strong></a>
  				<a class="dropdown-item"href="SemiProjectServlet.do?command=ntlist"><strong style="color:dark;">Notice</strong></a>
				<a class="dropdown-item"href="SemiProjectServlet.do?command=mypage"><strong style="color:dark;">My page</strong></a>
    		</div>
  		</div>
	</div>
	<!-- 드롭다운 종료 -->


	<!-- 버튼 -->
	<div class="container">
		<a class="navbar-brand" href="index.jsp">UTC</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            	<span class="navbar-toggler-icon"></span>		<!-- 화면줄이면 나오는 버튼 -->
         	</button>
         	
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a id="modalButton" class="nav-link" href="loginform.jsp" data-toggle="modal" data-target="#myModal">Login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="signup.jsp" data-toggle="modal" data-target="#myModal2">SignUp</a>
					</li>
					<li>
						
					</li>
				</ul>
			</div>
	</div>
</nav>

	<!-- Modal 1 -->
	<div class="modal fade" id="myModal3">
		<div class="modal-dialog modal-md">
			<div class="modal-content"></div>
		</div>
	</div>

	<!-- Modal 2 -->
	<div class="modal fade" id="myModal">
 	<div class="modal-dialog modal-md">		
			<div class="modal-content">
				<!-- loginform.jsp가 연결된다. -->
			</div>
		</div>
	</div>
	
	<!-- Modal 3 -->
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<!-- signup.jsp 연결(회원정보수정) -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
		/** 모달 창이 닫히는 경우의 이벤트 */
		// ".modal"로 지정할 경우 : 모든 모달창에 적용됨
		// "#아이디"로 지정할 경우 : 특정 모달 창에 적용
		$('.modal').on('hidden.bs.modal', function(e) {
			//모달창 내의 내용을 강제로 지움.
			//밑에꺼 안되서 바꿈
			$(this).find('form')[0].reset()
			//$(this).removeData('bs.modal');
			
		});
	</script>
</body>
</html>