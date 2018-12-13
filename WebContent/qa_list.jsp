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
			<img src="img/admin_qna.png" alt="질문답변관리" class="topimg" id="QnA-tab">
			<h3>Q&amp;A 게시판</h3>
         <p>건의사항 및 질문 하는 공간<p>
         
<!-- 테이블 시작 -->
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
		<tbody>
		<c:choose> 
			<c:when test="${empty QAList }"> 
				<tr>
					<td colspan="4">=============작성된 글이 없습니다==============</td>
				</tr>
			</c:when>
			<c:otherwise>
			<!-- QAList를 dto란 이름으로 사용 -->
				<c:forEach items="${QAList }" var="dto"> 
					<tr>
						<td>${dto.qa_id }</td>
						<td>
							<a href="SemiProjectServlet.do?command=QAupdateViewCount&qa_id=${dto.qa_id }">${dto.qa_title }</a> 
						</td>
						<td>${dto.member_name }</td>
						<td><fmt:formatDate value="${dto.qa_regdate }" pattern="yyyy.MM.dd" /></td>
						<td>${dto.qa_view_cnt }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
		</tbody>
	</table>
</div>

<!-- 게시판 페이징 버튼 -->
	<div class="paginate">
	<!-- 페이지 마지막 번호 -->
    	 
    	 <!-- 게시글 개수의 나머지가 있을 떄 페이지 한개 추가
    	 	33 30 3
    	  -->
    	 <!-- 게시글을 10으로 나눈 나머지가 0보다 크면 
    	 	ex) 게시글이 22개 있을 때 22%10=2.2>0 이므로
    	 	총 페이지 개수는 3개가 나옴
    	 	
    	 	countdto.count = 총 게시글 개수
    	 	totalPage = 총 페이지 개수
    	 -->
    	<c:if test="${countdto.count % 10 > 0}">
    	 	<c:set value="${(countdto.count / 10)+1 }" var="totalPage"/>		
    	</c:if>
    	
    	<c:if test="${countdto.count%10 == 0 }">
    		<c:set value="${(countdto.count / 10) }" var="totalPage"></c:set>
    	</c:if>
    	
    	<!-- totalPage 형변환 -->
    	<fmt:parseNumber value="${totalPage }" var="totalPage" integerOnly="true"/>
	<ul>
	<!-- 처음 페이지번호로 ㄱㄱ -->
	<li><a href="SemiProjectServlet.do?command=qalist&r=1" class="paging"> << </a></li>
	
	<c:choose>
		<c:when test="${r != 1}">
			<li><a href="SemiProjectServlet.do?command=qalist&r=${r-1 }"  class="paging"><︎</a></li>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>
	</ul>
    <span>
		<!-- 반복문 r=1을 받아옴 첫페이지부터 마지막페이지까지 총 페이지 개수 밑에 페이징 버튼
			선택된 페이징 넘버만 오렌지색으로
			r = 현재페이지
		 -->
        <c:forEach var="i" begin="1" end="${totalPage }">
            <ul>
            <c:choose>
                <c:when test="${i eq r}">
                	<li><a href="SemiProjectServlet.do?command=qalist&r=${i }" style="color: orange;" class="paging">${i}</a></li>
                </c:when>
                <c:otherwise>
                	<li><a href="SemiProjectServlet.do?command=qalist&r=${i }" class="paging">${i}</a></li>
                </c:otherwise>
            </c:choose>
            </ul>
        </c:forEach>
        
    </span>
    
    <!-- 현재 페이지 수가 전체페이지 수와 같으면 다음버튼 안보임
    	 현재 페이지 수가 전체페이지 수보다 작을때만 다음 버튼이 보이게 함
     -->
     <ul>
    <c:choose>
    	<c:when test="${r >= totalPage }">
    	</c:when>
    	<c:otherwise>
    		<li><a href="SemiProjectServlet.do?command=qalist&r=${r+1 }" class="paging">>︎</a></li>
    	</c:otherwise>
    </c:choose>
    <!-- 마지막 페이지로 이동 -->
   		<li> <a href="SemiProjectServlet.do?command=qalist&r=${totalPage }" class="paging">>></a></li>  
    </ul>
    
    
    <%
   if(session.getAttribute("dto") != null) {
%>

   <!-- 등록버튼 시작 -->
   <input type="button" value="글쓰기" onclick="location.href='qa_write.jsp'"  class="btn btn-primary" id="b1" style="float: right;">
<!-- 등록버튼 종료 -->
<br><br><br><br>
<%
   } else {
      
   }
%>
    
    
    
    
</div>



   <br>
</body>
<%@ include file="inc/footer.jsp" %>
</html>