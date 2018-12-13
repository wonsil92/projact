<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="inc/admintopbar.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- ReviewWrite css 참조 -->
<link href="css/ReviewView.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/index_menu.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
<link href="css/one-page-wonder.min.css" rel="stylesheet">
</head>
<body>
	<!-- qaViewDto를 사용할 수 있게 세팅해줌 -->
	<jsp:useBean id="qaViewDto" class="com.UTC.dto.QABoardDto"
		scope="request">
	</jsp:useBean>

	<div class="container">
		<div class="Review_header">
			<h4>Q&A게시판</h4>
			<p>홈페이지에 대해 궁금한 점을 남겨주세요.</p>
			<%
				if (dto != null && dto.getMember_email().equals(qaViewDto.getMember_email())) {
			%>
			<div class="button_container" style="float: right;">
				<div class="delete_button">
					<a class="upde"
						href="SemiProjectServlet.do?command=admin_qadelete&qa_id=${qaViewDto.qa_id }"><button
							type="submit" class="btn btn-danger" style="text-align: right;">삭제</button></a>
				</div>
				<div class="update_button">
					<a class="upde"
						href="SemiProjectServlet.do?command=admin_qaupdateform&qa_id=${qaViewDto.qa_id }"><button
							type="submit" class="btn btn-success" style="text-align: right;">수정</button></a>
				</div>

			</div>
			<%
				} else {

				}
			%>
		</div>
		<br>
		<hr>
		<div class="subject_form">
			<div class="subject">제목</div>
			<div class="form-group">
				<jsp:getProperty property="qa_title" name="qaViewDto" />
			</div>
		</div>

		<div class="writer_form">
			<div class="write">글쓴이</div>
			<div class="writer">
				<jsp:getProperty property="member_name" name="qaViewDto" />
			</div>
			<div class="hit">
				조회수 : &nbsp;&nbsp;<jsp:getProperty property="qa_view_cnt"
					name="qaViewDto" />
			</div>
			<div class="date_form">
				작성일 :&nbsp;&nbsp;
				<fmt:formatDate value="${RVviewDto.rv_regdate }"
					pattern="yyyy.MM.dd" />
			</div>
		</div>

		<br>
		<br>
		<!-- 글 내용이 들어가는 부분 -->
		<div class="content_form">
			<div class="content">
				<!-- 게시글 내용 -->
				<jsp:getProperty property="qa_content" name="qaViewDto" />
			</div>
		</div>
		<div style="text-align: right;">
			<button type="button" class="btn btn-primary"
				onclick="location.href='SemiProjectServlet.do?command=admin_qalist'">목록으로</button>
		</div>
		<br> <br>
	</div>

	<%@ include file="inc/footer.jsp"%>

</body>
</html>