<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

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
		
		
				<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
				
<style type="text/css">
h4 {
}

#topmenu {
margin-top: 100px;
text-align: left;
}

.topimg{
width: 100px;
height: 100px;
}

</style>				
				
<script type="text/javascript">
	
	function allChk(bool){
		var chks = document.getElementsByName("chk");
		for(var i = 0; i < chks.length; i++){
			chks[i].checked = bool;
		}
	}
		
	$(function(){
		$("#muldel").submit(function(){
			if($("#muldel input:checked").length == 0){
				alert("하나 이상 체크해 주세요!");
				return false;
			}
		});
	});
	
	function searchTitle(){
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++){
			td = tr[i].getElementsByTagName("td")[2];
			if(td) {
				txtValue = td.textContent || td.innerText;
				if(txtValue.toUpperCase().indexOf(filter) > -1){
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none"
				}
			}
		}
	}
	
</script>
		
</head>
<body>
<!-- 비회원일때 = topbar.jsp / 회원일 때 usertopbar.jsp -->

<%@ include file="inc/admintopbar.jsp" %>


<div class="container">
	<div class="row content" id="topmenu" style="width:100%">
		<div class="col-md-12">
			<img src="img/admin_board.png" alt="게시판관리" class="topimg">
			<h4>이용후기 게시판</h4>
			<p>이용 후기를 남겨주세요<p>
		</div>			
	</div>
</div>


<div class="container">
	<br/>
	<input type="text" class="form-control" placeholder="글 제목으로 검색" name="search" id="myInput" onkeyup="searchTitle();"/>
</div>
<br/><br/>
<!-- 테이블시작 -->
<div class="container">
	<form action="SemiProjectServlet.do" method="post" id="muldel_qa">
		<input type="hidden" name="command" value="admin_multi_rvdelete"/>

<div class="table">
		<table class="list_table" id="myTable">
		<caption>~~</caption>
		<colgroup>
			<col width="10%" />
			<col width="10%" />
			<col width="30%" />
			<col width="20%" />
			<col width="20%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr>
				<th><input type="checkbox" name="all" onclick="allChk(this.checked)"/></th>
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
					<td><input type="checkbox" name="chk" value="${dto.rv_id }"/></td>
                  	<td>${dto.rv_id }</td>
                  	<td>
                        <a href="SemiProjectServlet.do?command=ADupdateViewCount&rv_id=${dto.rv_id }">${dto.rv_title }</a>
                  </td>
                  <td>${dto.member_name }</td>
                 <td><fmt:formatDate value="${dto.rv_regdate }" pattern="yyyy.MM.dd" /></td>
                 <td>${dto.rv_view_cnt }</td>
               </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
		</tbody>
	</table>
	</div>

	<span>
	<br/>
		<button type="submit" class="btn btn-sm">선택 삭제</button>
		<input type="button" value="글쓰기" onclick="location.href='SemiProjectServlet.do?command=admin_rvwriteform'" class="btn btn-sm" style="float:right;">
		</span>
	</form>
	<hr>
	<br>
</div>	
<!-- 테이블 종료 -->
    <%@ include file="inc/footer.jsp" %>
</body>
</html>