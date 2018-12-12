<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
	//세션 삭제 코드
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@page import="com.UTC.dto.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>UTC</title>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
<link href="css/one-page-wonder.min.css" rel="stylesheet">
<link href="plugins/ajax/ajax_helper.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">


<!-- <script src="plugins/ajax/ajax_helper.js"></script> -->
<!-- <script src="http://code.jquery.com/jquery.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</head>

<!---------------------------------------바디 바디 바디----------------------------------->
<body>

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">


		<!--  드롭다운-->
		<div class="container">
			<div class="dropdown">
				<button type="button" class="btn btn-link" data-toggle="dropdown">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="dropdown-menu">
					<a class="dropdown-item" href="make_up_self.jsp">나만의 페이지 만들기</a> <a
						class="dropdown-item" href="SemiProjectServlet.do?command=admin_rvlist">이용후기 관리</a> <a
						class="dropdown-item" href="SemiProjectServlet.do?command=admin_qalist">Q&A 게시판 관리</a>
						<a class="dropdown-item" href="SemiProjectServlet.do?command=admin_ntlist">공지사항</a>
						<a class="dropdown-item" href="SemiProjectServlet.do?command=selectAll">회원 정보 조회</a>
				</div>
			</div>
		</div>
		<!-- 드롭다운 종료 -->


		<!-- 버튼 -->
		<div class="container">
			<a class="navbar-brand" href="admin_main.jsp">UTC</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				<!-- 화면줄이면 나오는 버튼 -->
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" style="color: white;">${dto.member_name}</a></li>
					<li class="nav-item"><a class="nav-link" href="SemiProjectServlet.do?command=logout">Logout</a>
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
			// 모달창 내의 내용을 강제로 지움.
			$(this).removeData('bs.modal');
		});
	</script>




</body>
</html>