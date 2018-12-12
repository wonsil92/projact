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
<!-- C태그 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 비회원일때 = topbar.jsp / 회원일 때 usertopbar.jsp / 관리자일 떄 admintopbar.jsp-->
<c:if test="${dto eq null }">
	<%@include file="inc/topbar.jsp" %>
</c:if>

<c:if test="${dto.getMember_role() eq 'ADMIN' }">
	<%@ include file="inc/admintopbar.jsp" %>
	
</c:if>

<c:if test="${dto.getMember_role() eq 'USER' }">
	<%@ include file="inc/usertopbar.jsp" %>
</c:if>
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
				<fmt:formatDate value="${qaViewDto.qa_regdate }"
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
			<!-- 		<div> -->
			<%-- 			댓글(<jsp:getProperty property="qa_view_cnt" name="qaViewDto"/>) --%>
			<!-- 		</div> -->

			<%
				if (dto != null && dto.getMember_email().equals(qaViewDto.getMember_email())) {
			%>
			<div class="button_container">
				<div class="update_button">
					<a class="upde"
						href="SemiProjectServlet.do?command=qaupdateform&qa_id=${qaViewDto.qa_id }"><button
							type="submit" class="btn btn-primary" style="text-align: right;">수정</button></a>
				</div>
				<div class="delete_button">
					<a class="upde"
						href="SemiProjectServlet.do?command=qadelete&qa_id=${qaViewDto.qa_id }"><button
							type="submit" class="btn btn-danger" style="text-align: right;">삭제</button></a>
				</div>
			</div>
			<%
				} else {

				}
			%>




			<!-- <div class="button_container"> -->
			<!-- 	<div class="update_button"> -->
			<%-- 		<a class="upde" href="SemiProjectServlet.do?command=qaupdateform&qa_id=${qaViewDto.qa_id }"><button type="submit" class="btn btn-primary" style="text-align:right;">수정</button></a> --%>
			<!-- 	</div> -->
			<!-- 	<div class="delete_button"> -->
			<%-- 		<a class="upde" href="SemiProjectServlet.do?command=qadelete&qa_id=${qaViewDto.qa_id }"><button type="submit" class="btn btn-danger" style="text-align:right;">삭제</button></a> --%>
			<!-- 	</div> -->
			<!-- </div> -->
		</div>
		<hr>

		<div class="comment_form">
			<div class="comment_writer_form">
				<div class="comment_writer">박우주</div>
				<div class="date">2018-11-21</div>
				<div class="apply">
					<a href="#"> <img src="img/arrow.png">답글
					</a>
				</div>
			</div>

			<div class="comment_content">어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고어쩌고저쩌고</div>
			<hr>
		</div>

		<div class="comment_content">
			<textarea rows="3" cols="120"></textarea>
			<div class="insert_button">
				<button type="submit" class="btn btn-default">등록</button>
			</div>
			<hr>
		</div>
		<div style="text-align: right;">
			<button type="button" class="btn btn-primary"
				onclick="location.href='SemiProjectServlet.do?command=qalist'">목록으로</button>
		</div>
		<br>
		<br>

		<div class="prev_next">
			<div class="prev">이전글</div>
			<div class="next">다음글</div>
		</div>

	</div>

	<%@ include file="inc/footer.jsp"%>

</body>
</html>