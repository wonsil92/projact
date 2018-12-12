<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.UTC.dao.MemberDao"%>
<%@page import="com.UTC.dto.MemberDto"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>

<style type="text/css">
.form-heading {
	color: #fff;
	font-size: 23px;
}

.modal-header h2 {
	color: #444444;
	font-size: 18px;
	margin: 0 0 8px 0;
}

.modal-header p {
	color: #777777;
	font-size: 14px;
	margin-bottom: 30px;
	line-height: 24px;
}

.main-div {
	background: #ffffff none repeat scroll 0 0;
	border-radius: 2px;
	margin: 10px auto 30px;
	max-width: 100%;
	text-align: center;
}

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

.back {
	text-align: left;
	margin-top: 10px;
}

.back a {
	color: #444444;
	font-size: 13px;
	text-decoration: none;
}
</style>



<script type="text/javascript">
	// 비밀번호 이메일 미입력 오입력시 경고창
	document.getElementById("delUser").onclick = function() {
		chkValue()
	};

	function chkValue() {//비밀번호 컨트롤러로 넘겨서 확인해야함 일단 이렇게해놨어요
		var cPw = document.getElementById("cPw").value;
		var cEmail = document.getElementById("cEmail").value;
		var pw = document.getElementById("pw").value;
		var email = document.getElementById("email").value;
		if (pw == "" || pw != cPw) {
			alert("비밀번호를 확인하세요");
			return false;
		} else if (email == "" || email != cEmail) {
			alert("이메일을 확인하세요");
			return false;
		} else {
			$("#deleteModal").modal("show");
		}
	}

	$("#close").click(function() {//쌍따옴표 홑따옴표 상관없음!!!!
		$("#deleteModal").modal("hide");
	});

</script>

</head>

<body>
	<%
		System.out.println("세션 정보 넘어오는지 확인");
		//로그인 값 가져오기
		MemberDto logindto = (MemberDto) session.getAttribute("dto");
		System.out.println("세션이메일: " + logindto.getMember_email());
		System.out.println("회원번호: " + logindto.getMember_id());
		System.out.println("비밀번호: " + logindto.getMember_pw());
	%>

	<div class="container">
		<div class="delete-form">
			<form name="delete_form" action="SemiProjectServlet.do?"
				method="post">
				<input type="hidden" name="command" value="deleteuser"> <input
					type="hidden" id="cPw" value="${dto.member_pw }"> <input
					type="hidden" id="cEmail" value="${dto.member_email }">
				<div class="modal-header">
					<div class="main-div">
						<h2>회원 탈퇴</h2>
					</div>
				</div>
				<div class="modal-body">
					<div class="form-group">
						이용 중인 아이디<input type="text" class="form-control"
							name="member_name" value="${dto.member_name }"
							readonly="readonly">
					</div>
					<div class="form-group">
						비밀번호<input type="password" class="form-control" name="member_pw"
							id="pw" placeholder="비밀번호를 입력하세요">
					</div>
					<div class="form-group">
						이메일<input type="email" class="form-control" name="member_email"
							id="email" placeholder="이메일 주소를 입력하세요">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="chkValue()"
						id="delUser">탈퇴</button>
					<br> <br>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</form>

			<!-- 탈퇴눌렀을 때 나올 경고창 -->

			<div class="modal fade" id="deleteModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title" align="center">유의사항</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							1. 개인정보는 탈퇴 시 바로 삭제되며 복구되지 않습니다.<br> 2. 작성한 문서 및 게시글은 삭제되지
							않습니다.
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-warning"
								onclick="location.href='SemiProjectServlet.do?command=deleteuser'">동의하고
								탈퇴하기</button>
							<button type="button" class="btn" data-number="2" id="close">취소</button>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>