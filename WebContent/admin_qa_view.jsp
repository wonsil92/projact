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
			<div id="updatediv">
				<a class="upde"
					href="SemiProjectServlet.do?command=admin_qaupdateform&qa_id=${qaViewDto.qa_id }">수정&nbsp;</a>
				<a class="upde"
					href="SemiProjectServlet.do?command=admin_qadelete&qa_id=${qaViewDto.qa_id }">삭제</a>
			</div>
			<%
				} else {

				}
			%>
		</div>
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
	</div>

	<div align="center">
		<button type="button" class="btn btn-sm"
			onclick="location.href='SemiProjectServlet.do?command=admin_qalist'">목록으로</button>
		<button type="button" class="btn btn-sm"
			onclick="location.href='SemiProjectServlet.do?command=admin_qadelete&qa_id=${qaViewDto.qa_id }'">삭제</button>
	</div>

	<br>
	<br>
	<br>
	<hr>


	<div class="container">
		<div class="comment_form">
			<div class="comment_writer_form">
				<div class="comment_writer">박우주</div>
				<div class="date">2018-11-21</div>
				<div class="apply">
					<a href="#"><img src="img/arrow.png">답글</a>
				</div>
			</div>

			<div class="comment_content">널 차버릴 거야~</div>
			<hr>
		</div>

		<div class="comment_content">
			<textarea rows="3" cols="120">힘이 듭니다</textarea>
			<div class="insert_button">
				<button type="submit" class="btn btn-default">등록</button>
			</div>
			<hr>
		</div>

		<br>

		<div class="prev_next">
			<div class="prev">이전글</div>
			<div class="next">다음글</div>
		</div>
	</div>

	<%@ include file="inc/footer.jsp"%>

</body>
</html>