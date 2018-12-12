<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="com.UTC.dto.MemberDto" %>
<%@page import="com.UTC.dao.MemberDao" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">
<title>Administrator's Page!</title> 

<%@ include file="inc/admintopbar.jsp"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	
	// 다중 체크
	function allChk(bool){
		var chks = document.getElementsByName("chk");
		for(var i = 0; i < chks.length; i++){
			chks[i].checked = bool;
		}
	}
		
	
	// 다중 체크가 되지 않았을 경우 실행되는 함수
	$(function(){
		$("#muldel").submit(function(){
			if($("#muldel input:checked").length == 0){
				alert("하나 이상 체크해 주세요!");
				return false;
			}
		});
	});
	
	
	// 게시판 필터 함수 (사용자 이름으로 검색)
	function searchName(){
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

<style type="text/css">
h4 {
	text-align: center;
}

#topmenu {
margin-top: 100px;
text-align: left;
margin-left: auto;
margin-right: auto;
}

.topimg{
width: 100px;
height: 100px;
margin: auto;
}

</style>
</head>

<div class="container">
	<div class="row content" id="topmenu" style="width:100%">
		<div class="col-md-12">
				<img src="img/admin_user.png" alt="사용자관리" class="topimg" id="userList-tab"/>
				<h3>회원정보조회</h3>
		</div>
		
	</div>
</div>
<div class="container">
	
  <div class="row" style="margin-top:50px">
    <div class="col-md-12">
    	<div class="container">
			<div class="input">
				
				<input type="text" class="form-control" placeholder="사용자 이름으로 검색" name="search" id="myInput" onkeyup="searchName();"/>
				<br>
			</div>
		</div>
		<div class="container">
			<br>
			<form action="SemiProjectServlet.do" method="post" id="muldel">
			<input type="hidden" name="command" value="admin_multi_deleteuser"/>
				<table class="table table-hover" id="myTable">
					<thead>
						<tr>
							<th><input type="checkbox" name="all" onclick="allChk(this.checked)"/></th>
							<th>Email</th>
							<th>Name</th>
							<th>Role</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var = "tmp" items="${list }">
						<tr>
							<td><input type="checkbox" name="chk" value="${tmp.member_id }"/></td>
							<td>
								<div class="dropdown">
  									<a data-toggle="dropdown" style="cursor:default">${tmp.member_email }</a>
  										<ul class="dropdown-menu">
  											<li><a class="text-muted" style="cursor:default" data-toggle="modal" data-target="#x${tmp.member_id }">회원 탈퇴시키기</a></li>
  										</ul>
  								</div>
							</td>
							<td>${tmp.member_name }</td>
							<td>${tmp.member_role }</td>
						</tr>
								
								<div id="x${tmp.member_id }" class="modal fade" role="dialog">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-body" align="center">
												<p>${tmp.member_name }을(를)탈퇴시킵니까?</p>
												<button type="button" class="btn btn-sm" onclick="location.href='semiprojectservlet.do?command=admin_deleteuser&member_id=${tmp.member_id}'">예</button>
												<button type="button" class="btn btn-sm" data-dismiss="modal">아니오</button>
											</div>
										</div>
									</div>
								</div>
								
								
							</c:forEach>
								
							</tbody>
							<tr>
								<td colspan = "4">
									<br/>
									<button type="submit" class="btn btn-sm">선택 탈퇴</button>
								</td>
							</tr>
						</table>
					</form>
					</div>
				</div>	
			</div>
		</div>
	<nav class="nav2" style="width: 100%;"></nav>
	<%@ include file="inc/footer.jsp"%>
</body>
</html>