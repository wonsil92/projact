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
	<!-- RVviewDto를 사용할 수 있게 세팅해줌 -->
	<jsp:useBean id="RVviewDto" class="com.UTC.dto.RVdocumentDto"
		scope="request">
	</jsp:useBean>

	<div class="container">
		<div class="Review_header">
			<h4>이용후기</h4>
			<p>여러분들의 소중한 후기를 남겨주세요.</p>
			<%
				if (dto != null && dto.getMember_email().equals(RVviewDto.getMember_email())) {
			%>
			<div class="button_container" style="float: right;">
				<div class="delete_button">
					<a class="upde"
						href="SemiProjectServlet.do?command=admin_rvdelete&rv_id=${RVviewDto.rv_id }"><button
							type="submit" class="btn btn-danger" style="text-align: right;">삭제</button></a>
				</div>
				<div class="update_button">
					<a class="upde"
						href="SemiProjectServlet.do?command=admin_rvupdateform&rv_id=${RVviewDto.rv_id }"><button
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
				<jsp:getProperty property="rv_title" name="RVviewDto" />
			</div>
		</div>
		<div class="writer_form">
			<div class="write">글쓴이</div>
			<div class="writer">
				<jsp:getProperty property="member_name" name="RVviewDto" />
			</div>
			<div class="hit">
				조회수 : &nbsp;&nbsp;<jsp:getProperty property="rv_view_cnt"
					name="RVviewDto" />
			</div>
			<div class="hit">
				추천수 : &nbsp;&nbsp;<jsp:getProperty property="rv_reco_cnt"
					name="RVviewDto" />
			</div>
			<div class="date_form">
				작성일 :&nbsp;&nbsp;
				<fmt:formatDate value="${RVviewDto.rv_regdate }"
					pattern="yyyy.MM.dd" />
			</div>
		</div>

		<br> <br>
		<!-- 파일이 들어가는 부분 -->
		<div class="content_form">
			<div class="content">
				<jsp:getProperty property="file_id" name="RVviewDto" />
			</div>
		</div>

		<!-- 글 내용이 들어가는 부분 -->
		<div class="content_form">
			<div class="content">
				<jsp:getProperty property="rv_content" name="RVviewDto" />
			</div>

		</div>
		<div style="text-align: right;">
			<button type="button" class="btn btn-primary"
				onclick="location.href='SemiProjectServlet.do?command=admin_rvlist'">목록으로</button>
		</div>
		<br> <br>


		<!-- --------------------이전글,다음글----------------- -->
		<%--  <div class="prev_next">
      <div class="prev">
         <b>이전글</b>
         <c:choose>
            <c:when test="${prevDocument != null }">
               <c:url var="prevUrl" value="SemiProjectServlet.do?command=rvdetail">
                  <c:param name="rv_id" value="${prevDocument.rv_id }" />
               </c:url>
               <a href="${prevUrl }">${prevDocument.rv_title }</a>
            </c:when>
            <c:otherwise>
               이전글이 없습니다.
            </c:otherwise>
         </c:choose>
      </div>
      <div class="next">
         <b>다음글</b>
         <c:choose>
            <c:when test="${nextDocument != null }">
               <c:url var="nextUrl" value="SemiProjectServlet.do?command=rvdetail">
                  <c:param name="rv_id" value="${nextDocument.rv_id }" />
               </c:url>
               <a href="${nextUrl }">${nextDocument.rv_title }</a>
            </c:when>
            <c:otherwise>
               다음글이 없습니다.
            </c:otherwise>
         </c:choose>
      </div>
   </div>
             --%>
	</div>

	<%@ include file="inc/footer.jsp"%>

</body>
</html>