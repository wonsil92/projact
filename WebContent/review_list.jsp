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
		<link href="css/Reviewlist.css?v=2" rel="stylesheet">
		
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
			<img src="img/admin_board.png" alt="게시판관리" class="topimg">
			<h3>이용후기 게시판</h3>
			<p>여러분의 소중한 후기를 남겨주세요.<p>

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
         <c:when test="${empty list }">
            <tr>
               <td colspan="4">========작성된 글이 없습니다.========</td>
            </tr>
         </c:when>
         <c:otherwise>
            <c:forEach items="${list }" var="dto">
               <tr>
                  <td>${dto.rv_id }</td>
                  <td>
<%--                   <c:forEach begin="1" end="${dto.titletab }">
                              &nbsp;
                        </c:forEach> --%>
                        <a href="SemiProjectServlet.do?command=RVupdateViewCount&rv_id=${dto.rv_id }">${dto.rv_title }</a>
                  </td>
                  <td>${dto.member_name }</td>
                 <td><fmt:formatDate value="${dto.rv_regdate }" pattern="yyyy.MM.dd" /></td>
                 <td>${dto.rv_view_cnt }</td>
               </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
		
	</table>
<br>
	<!-- 게시판 페이징 버튼 -->
	<div class="paginate" style="text-align: center;">
	<!-- 페이지 마지막 번호 -->
    	 
    	 <!-- 게시글 개수의 나머지가 있을 떄 페이지 한개 추가
    	 	33 30 3
    	  -->
    	 <!-- 게시글을 10으로 나눈 나머지가 0보다 크면 
    	 	ex) 게시글이 22개 있을 때 22%10=2.2>0 이므로
    	 	총 페이지 개수는 3개가 나옴
    	 -->
    	<c:if test="${rvcountdto.count % 10 > 0}">
    		<!-- 페이지 개수를 출력  -->
    	 	<c:set value="${ (rvcountdto.count / 10)+1 }" var="totalPage"/>		
    	</c:if>
    	
    	<c:if test="${rvcountdto.count%10 == 0 }">
    		<c:set value="${(rvcountdto.count / 10) }" var="totalPage"></c:set>
    	</c:if>
    	<fmt:parseNumber value="${totalPage }" var="totalPage" integerOnly="true"/>
	<ul>
    <li><a href="SemiProjectServlet.do?command=list&r=1" class="paging"><<</a></li>
	<c:choose>
		<c:when test="${r != 1}">
			<li><a href="SemiProjectServlet.do?command=list&r=${r-1 }"  class="paging"><︎</a></li>
		</c:when>
		<c:otherwise>
<%
		System.out.println("첫페이지에서는 이전버튼 안보임");
%>
		</c:otherwise>
	</c:choose>   
	</ul>
	 
	 
	 <span>
		<!-- 반복문  -->
        <c:forEach var="i" begin="1" end="${totalPage }" step="1">
            <ul>
            <c:choose>
                <c:when test="${i eq r}">
                	<li><a href="SemiProjectServlet.do?command=list&r=${i }" class="paging" style="color: orange;">${i}</a></li>
                </c:when>
                <c:otherwise>
                	<li><a href="SemiProjectServlet.do?command=list&r=${i }" class="paging">${i}</a></li>
                </c:otherwise>
            </c:choose>
            </ul>
        </c:forEach>
    </span>
    
    <ul>
    <c:choose>
    	<c:when test="${r >= totalPage }">
    		
    	</c:when>
    	<c:otherwise>
    		<li><a href="SemiProjectServlet.do?command=list&r=${r+1 }" class="paging">></a></li>
    	</c:otherwise>
    </c:choose>
    <!-- 마지막 페이지로 이동 -->
    <li><a href="SemiProjectServlet.do?command=list&r=${totalPage }" class="paging">>></a></li> 
	</ul>
</div>	
</div>
<!-- 테이블 종료 -->

<%
   if(session.getAttribute("dto") != null) {
%>

   <!-- 등록버튼 시작 -->
   <br>
   <input type="button" value="글쓰기" onclick="location.href='review_write.jsp'"  class="btn btn-primary" id="b1" style="float: right;">
   <br>
<!-- 등록버튼 종료 -->
<%
   } else {
      
   }
%>
 	<br><br><br>
<!--     <script src="js/jquery.min.js"></script> -->
<!--     <script src="js/bootstrap.min.js"></script> -->
<!--     <script src="js/scripts.js"></script> -->
    <br>
<%@ include file="inc/footer.jsp" %>
</body>
   
</html>