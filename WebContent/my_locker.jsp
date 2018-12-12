<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.UTC.dao.MemberDao"%>
<%@page import="com.UTC.dto.MemberDto"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>UTC</title>

<style>
@import
	url('http://fonts.googleapis.com/css?family=Open+Sans:300,400,700');

@import
	url('http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css')
	;

#gallery {
	width: 250px;
	height: 250px;
}
 /* 페이징 */
.center {
    text-align: center;
    margin-top: 100px;
    margin-bottom: 80px;
}

.pagination {
    display: inline-block;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

h4 {
	margin-top: 20px;
}

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

/* $(document).ready(function() {
	var tt = document.getElementsByClassName("card-text")[1].nextSibling.innerText;
	//document.getElementByClassName("card-text").innerHTML = tt[0].innerHTML

	alert(tt[0]);

} */


</script>
</head>

<body>
	<%
		System.out.println("내만페");
		//로그인 값 가져오기
		MemberDto logindto = (MemberDto) session.getAttribute("dto");
		System.out.println("세션이메일: " + logindto.getMember_email());
		System.out.println("회원번호: " + logindto.getMember_id());
		System.out.println("비밀번호: " + logindto.getMember_pw());
	%>

		<h4>내가 만든 페이지</h4>
		<hr>
		<div class="container-fluid">
		<div class="row">
		<!-- 로그인한 회원이 쓴 글 뿌리는 부분 -->
					<c:choose>
			<c:when test="${empty MakelistUser }">

					<p align="center">=====작성된 글이 없습니다=====</p>

			</c:when>
			<c:otherwise>
				<c:forEach items="${MakelistUser }" var="dtoM">

				  <div class="col-md-3">
  <div class="card mb-4 shadow-sm" style="width:250px">
   <img alt="${dtoM.make_id }번 글의 첫번째 이미지" src=img/03.jpg id="gallery">
   <div class="card-body">
						<h4 class="card-title"><a href="SemiProjectServlet.do?command=makedetail&make_id=${dtoM.make_id }">${dtoM.make_title }</a></h4>
						<p class="card-text"></p>
							<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
								<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='SemiProjectServlet.do?command=makedetail&make_id=${dtoM.make_id }'">보기</button>
								<button type="button" class="btn btn-sm btn-outline-danger" onclick="location.href='SemiProjectServlet.do?command=makedelete&make_id=${dtoM.make_id }'">삭제</button>
							</div>
							<small class="text-muted"><fmt:formatDate value="${dtoM.make_regdate }" pattern="yyyy.MM.dd HH:mm" /></small>
						</div>
   </div>
   </div>
   </div>
   </c:forEach>
   </c:otherwise>
   </c:choose>

					<!-- 뿌리기 끗 -->
					</div>




   <div class="center">
<div class="pagination">
  <a href="#">&laquo;</a>
  <a href="#" class="active">1</a>
  <a href="#">2</a>
  <a href="#">3</a>
  <a href="#">4</a>
  <a href="#">5</a>
  <a href="#">6</a>
  <a href="#">&raquo;</a>
</div>
</div>
         </div>

</body>
</html>
