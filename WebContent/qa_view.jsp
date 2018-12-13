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

<!-- fontawsome 사용 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<script src="plugins/ajax-form/jquery.form.min.js"></script>

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
	
<div class="comment_container">
	<form id="comment_form" method="post" action="CommentInsert.do" onsubmit="return comment_ajax(this);">
		<input type="hidden" name="command" value="insertQAComment"/>
		<input type="hidden" name="qa_id" value="${qaViewDto.qa_id }" />
		<div class="comment_form" >

 		<div id="comment_list" > 			

 		</div>
 		<hr>
		</div>
		<div class="comment_content">
			<textarea rows="3" cols="120" name="qacomment_content"></textarea>
			<div class="insert_button">
				<button type="submit" class="btn btn-default">등록</button>
			</div>
		</div>
	</form>
</div>

	<div style="text-align: right;">
		<button type="button" class="btn btn-primary" onclick="location.href='SemiProjectServlet.do?command=qalist'">목록으로</button>
	</div>
	<br>
	<br>
	
	<div class="prev_next">
		<div class="prev">
			<b>이전글</b>
			<c:choose>
				<c:when test="${prevDocument != null }">
					<c:url var="prevUrl" value="SemiProjectServlet.do?command=qadetail">
						<c:param name="qa_id" value="${prevDocument.qa_id }" />
					</c:url>
					<a href="${prevUrl }">${prevDocument.qa_title }</a>
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
					<c:url var="nextUrl" value="SemiProjectServlet.do?command=qadetail">
						<c:param name="qa_id" value="${nextDocument.qa_id }" />
					</c:url>
					<a href="${nextUrl }">${nextDocument.qa_title }</a>
				</c:when>
				<c:otherwise>
					다음글이 없습니다.
				</c:otherwise>
			</c:choose>
		</div>
	</div>
				
</div>

<%@ include file="inc/footer.jsp" %>

<!-- 덧글 항목에 대한 템플릿 참조 -->
<script id="tmpl_comment_item" type="text/x-handlebars-template">

	<li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px;' id="{{qacomment_id}}">
		<div class="media-body" style='display: block;'>
			<h4 class="media-heading clearfix">
				<!--작성자, 작성일시 -->
				<div class='pull-left'>
					{{member_name}}
					<small style='margin-left: 30px;'>
						{{qaregdate}}
					</small>
				</div>

				<!-- 삭제 버튼 -->
				<div class='pull-right'>
					<a onclick="comment_delete('{{qacomment_id}}');" data-toggle="modal"
					class='btn btn-danger btn-xs'>
						<i class="far fa-trash-alt"></i>
					</a>
				</div>

				<!--수정 버튼 -->
				<div class='pull-right'>
					<a onclick="comment_edit('{{qacomment_id}}');" data-toggle="modal" 
					class='btn btn-warning btn-xs'>
						<i class="far fa-edit"></i>
					</a>
				</div>

			</h4>
			<!--내용 -->
			<p>{{{qacomment_content}}}</p>
		</div>
	</li>
</script>


<!-- 댓글 수정 시 사용될 Modal -->
<div class="modal fade" id="comment_edit_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="comment_edit_modal" method="post" name="qacomment_id" action="CommentEditOk.do">

	<input type="hidden" name="command" value="updateQAComment"/>
	<input type="hidden" name="qacomment_id" value="" />
	<input type="hidden" name="member_id" value="${dto.member_id }"/>
	<div class="modal-header">
		
		<h5 class="modal-title">덧글 수정</h5>
		<button type="button" class="close" data-dismiss="modal" 
			aria-label="Close"><span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body">
		
		<div class="form-group">
			<textarea class="form-control" name="qacomment_content" rows="2" cols="55"></textarea>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-basic" data-dismiss="modal">취소</button>
		<button type="submit" class="btn btn-danger">수정</button>
	</div>
</form>
		</div>
	</div>
</div>

<!-- 삭제 시 사용될 모달 -->
<div class="modal fade" id="comment_delete_modal">
<div class="modal-dialog">
<div class="modal-content">
<form id="comment_delete_form" method="post" action="CommentDeleteOk.do">
	<input type="hidden" name="qacomment_id" value="${qacommentId}" />
	<input type="hidden" name="member_id" value="${dto.member_id }"/>
	<div class="modal-header">
		<h5 class="modal-title-2">덧글 삭제</h5>
		<button type="button" class="close" data-dismiss="modal" 
			aria-label="Close"><span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body">
		<p>정말 이 덧글을 삭제하시겠습니까?</p>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-basic" data-dismiss="modal">취소</button>
		<button type="submit" class="btn btn-danger" >삭제</button>
	</div>
</form>
</div>
</div>
</div>


<script type="text/javascript">
	comment_list('${qaViewDto.qa_id }');
	function comment_ajax(f){
		
		var param = $(f).serialize();		//폼의 데이터를 urlencdoing 방식으로 변환해준다.
		
		$.ajax({
		    url: "CommentInsert.do", 	// 클라이언트가 요청을 보낼 서버의 URL 주소
		    data: param,                // HTTP 요청과 함께 서버로 보낼 데이터
		    type: "POST",                             // HTTP 요청 방식(GET, POST)
		    dataType: "json",                         // 서버에서 보내줄 데이터의 타입
		    success: function(data){
		    	$("textarea[name=qacomment_content]").val("");
		    	comment_list(data.item.qa_id);
		    }
		});
		return false;
	};
	
	function comment_list(qa_id) {
		// qa_id 가 없을 경우 에러로 봐서 List를 가져오지 않는다.
		if(qa_id == 0){
			alert("qa_id가 존재하지 않습니다.");
			return false;
		}
		
		$.ajax({
		    url: "CommentList.do?command=selectAllQAComment&qa_id="+qa_id, 					// 클라이언트가 요청을 보낼 서버의 URL 주소
		    type: "GET",                             // HTTP 요청 방식(GET, POST)
		    dataType: "json",                         // 서버에서 보내줄 데이터의 타입
		    success: function(json){
// 		    	if (json.rt != "OK") {
// 					alert(json.rt);
// 					return false;
// 				}

  		    	var data = json.item;
  		    	var template = Handlebars.compile($("#tmpl_comment_item").html());
  		    	$("#comment_list").empty();
  		    	
 		    	for(var i =0; i<data.length; i++){
 		    		var html = template(data[i]);
 		    		$("#comment_list").append(html);
 		    	}
		    }
		})
	}
	
	$(document).on('submit', "#comment_edit_modal", function (e) {
		console.log("test21");
		
		var param = $(this).serialize();
			
		$.ajax({
		    url: "CommentEditOk.do", 	// 클라이언트가 요청을 보낼 서버의 URL 주소
		    data: param,                // HTTP 요청과 함께 서버로 보낼 데이터
		    type: "POST",                             // HTTP 요청 방식(GET, POST)
		    dataType: "json",                         // 서버에서 보내줄 데이터의 타입
		    success: function(json){
	 			var template = Handlebars.compile($("#tmpl_comment_item").html());
				
	 			console.log(json);
	 			var html = template(json.item);
	 			$("#" + json.item.id).replaceWith(html);
							
	 			$("#comment_edit_modal").modal('hide');
	 			$('#comment_edit_modal').on('hide.bs.modal');
	 			console.log("test4");
	 			comment_list(json.item.qa_id);
		    }
		});
		return false;	
	});
	
	
	//모달창 띄우기
	function comment_edit(id) {
		$("#comment_edit_modal").modal();
		//console.log(id);
		var text = $("#"+id).find(".media-body p").text();
		//console.log(text);
		$("#comment_edit_modal input[name=qacomment_id]").val(id);
		$("#comment_edit_modal textarea").val(text);
	
		console.log("test1");
		
	};

	
	function comment_delete(id) {
		$("#comment_delete_modal").modal();
		$("#comment_delete_modal input[name=qacomment_id]").val(id);
	};
	
	$(document).on('submit',"#comment_delete_form", function(e){
		var items = $(this).serialize();
        $.ajax({
            url: "CommentDeleteOk.do",
            type: "POST",
            data: items,
            dataType: "json",
			success: function(data) {
				comment_list('${qaViewDto.qa_id }');
				$(".modal").modal('hide');
			}
        });
        return false;
    });
	
			
</script>

</body>
</html>
	
	