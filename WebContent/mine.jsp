<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mine</title>
<style type="text/css">
#qaNum, #qaReply, #qaDelete, #maNum, #maDelete, #rvNum, #rvDelete{width: 10%;}
#qaTitle, #qaDate, #maTitle, #maDate, #rvTitle, #rvDate{width: 30%;}
</style>

</head>
<body>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
				<h3>${dto.member_name }님 환영합니다</h3>
			</div>
			<div class="col-md-2">

				<button type="button"
					class="btn btn-outline-danger btn-sm btn-block"
					id="modal_UpdateInfo" class="nav-link" href="delete_Info.jsp"
					data-toggle="modal" data-target="#myModal3">회원 탈퇴</button>
			</div>
			<div class="col-md-2">

				<button type="button"
					class="btn btn-outline-secondary btn-sm btn-block"
					id="modal_UpdateInfo" class="nav-link" href="update_Info.jsp"
					data-toggle="modal" data-target="#myModal3">내 정보 수정</button>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<h3 class="text">내 정보</h3>
				<table class="table table-sm">

					<tbody>
						<tr>
							<th>이름</th>
							<td>${dto.member_name }</td>
						</tr>
						<tr>
							<th>email</th>
							<td>${dto.member_email }</td>
						</tr>
						<tr>
							<th>회원번호</th>
							<td>${dto.member_id }</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="col-md-6">
							<h3>최근 작업물</h3><!-- 쿠키저장한거 여기 들어가면 돼요 -->
							<table class="table table-sm table-hover">
								<thead>
									<tr>

										<th id="maNum">#</th>
										<th id="maTitle">제목</th>
										<th id="maDate">저장 시간</th>
										<th id="maDelete"></th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
						<c:when test="${empty MakelistUser }">
							<tr>
								<td colspan="4" align="center">=====저장된 내용이 없습니다=====</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${MakelistUser }" var="dtoM">
								<tr>

									<td>${dtoM.r }</td><!-- 이부분 체크 필요 -->
									<td><a href="SemiProjectServlet.do?command=makedetail&make_id=${dtoM.make_id }">${dtoM.make_title }</a></td>
									<td><fmt:formatDate value="${dtoM.make_regdate }" pattern="yyyy.MM.dd HH:mm" /></td>
									<td><button type="button"
								class="btn btn-outline-secondary btn-sm btn-block">삭제</button></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
								</tbody>
							</table>
						</div>
		</div>

		<div class="row">

			<div class="col-md-6">
							<h3 class="text">내 Q&amp;A</h3>
							<table class="table table-sm table-hover" id="qa">
								<thead>
									<tr>

										<th id="qaNum">#</th>
										<th id="qaTitle">제목</th>
										<th id="qaDate">작성일</th>
										<th id="qaReply">답변</th>
										<th id="qaDelete"></th>
									</tr>
								</thead>
								<!-- 로그인한 회원이 쓴 글 뿌리는 부분 -->
								<tbody>
								<c:choose>
						<c:when test="${empty QAlistUser }">
							<tr>
								<td colspan="4" align="center">=====작성된 글이 없습니다=====</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${QAlistUser }" var="dto">
								<tr>

									<td>${dto.r }</td><!-- 이부분 체크 필요 -->
									<td><a href="SemiProjectServlet.do?command=qadetail&qa_id=${dto.qa_id }">${dto.qa_title }</a></td>
									<td><fmt:formatDate value="${dto.qa_regdate }" pattern="yyyy.MM.dd HH:mm" /></td>
									<td>${dto.qa_reply_cnt}</td><!-- 갯수 뽑아내서 0이상이면 알파벳 O로 나오게할것인데 일단 갯ㅅ수라도 -->
									<td><button type="button"
								class="btn btn-outline-secondary btn-sm btn-block" onclick="location.href='SemiProjectServlet.do?command=myqadelete&qa_id=${dto.qa_id }'">삭제</button></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
								</tbody>
								<!-- 뿌리기 끗 -->
							</table>
						</div>


			<div class="col-md-6">
				<h3>내가 쓴 리뷰</h3>
				<table class="table table-sm table-hover">
					<thead>
						<tr>

							<th id="rvNum">#</th>
							<th id="rvTitle">제목</th>
							<th id="rvDate">작성 시간</th>
							<th id="rvDelete"></th>
						</tr>
					</thead>
					<tbody>
					<c:choose>
			<c:when test="${empty RVlistUser }">
				<tr>
					<td colspan="4" align="center">=====저장된 내용이 없습니다=====</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${RVlistUser }" var="dtoR">
					<tr>

						<td>${dtoR.r }</td><!-- 이부분 체크 필요 -->
						<td><a href="SemiProjectServlet.do?command=RVselectOne&rv_id=${dtoR.rv_id }">${dtoR.rv_title }</a></td>
						<td><fmt:formatDate value="${dtoR.rv_regdate }" pattern="yyyy.MM.dd HH:mm" /></td>
						<td><button type="button"
					class="btn btn-outline-secondary btn-sm btn-block" onclick="location.href='SemiProjectServlet.do?command=rvdeleteM&rv_id=${dtoR.rv_id }'">삭제</button></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
					</tbody>
				</table>
			</div>

		</div>

	</div>

</body>
</html>
