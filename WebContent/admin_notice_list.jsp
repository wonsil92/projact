<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@page import="com.UTC.dto.MemberDto"%>

<!-- c태그 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
 	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
	<title>UTC</title>
   	 	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="css/Reviewlist.css" rel="stylesheet">
		
</head>
<body>

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

<br><br><br><br>

			<h3>공지사항</h3>


<!-- 테이블시작 -->
<div class="boardcss_list_table">
	<table class="list_table">
		<caption>~~</caption>
		<colgroup>
			<col width="10%" />
			<col width="45%" />
			<col width="20%" />
			<col width="15%" />
			<col width="10%" />
			
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
      <c:choose>
         <c:when test="${empty ntlist }">
            <tr>
               <td colspan="4">========작성된 글이 없습니다.========</td>
            </tr>
         </c:when>
         <c:otherwise>
            <c:forEach items="${ntlist }" var="dto">
               <tr>
                  <td>${dto.nt_id }</td>
                  <td>
<%--                   <c:forEach begin="1" end="${dto.titletab }">
                              &nbsp;
                        </c:forEach> --%>
                        <a href="SemiProjectServlet.do?command=admim_NTupdateViewCount&nt_id=${dto.nt_id }">${dto.nt_title }</a>
                  </td>
                  <td>${dto.member_name }</td>
                 <td><fmt:formatDate value="${dto.nt_regdate }" pattern="yyyy.MM.dd" /></td>
                 <td>${dto.nt_view_cnt }</td>
               </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
		
	</table>
</div>
<!-- 테이블 종료 -->

<%
   if(session.getAttribute("dto") != null) {
%>

   <!-- 등록버튼 시작 -->
   <br>
   <input type="button" value="글쓰기" onclick="location.href='SemiProjectServlet.do?command=admin_noticeinsertform'"  class="btn btn-primary" id="b1" style="float: right;">
   <br>
<!-- 등록버튼 종료 -->
<%
   } else {
      
   }
%>

 <hr>
<!--     <script src="js/jquery.min.js"></script> -->
<!--     <script src="js/bootstrap.min.js"></script> -->
<!--     <script src="js/scripts.js"></script> -->
    <br>

</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
    <%@ include file="inc/footer.jsp" %>
</html>