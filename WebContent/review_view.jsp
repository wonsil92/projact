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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


<!--   fontawsome 사용 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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
			<div id="updatediv">
				<a class="upde"
					href="SemiProjectServlet.do?command=rvupdateform&rv_id=${RVviewDto.rv_id }">수정&nbsp;</a>
				<a class="upde"
					href="SemiProjectServlet.do?command=rvdelete&rv_id=${RVviewDto.rv_id }">삭제</a>
			</div>
			<%
				} else {

				}
			%>

		</div>
		<hr>
		<hr>

		<div class="subject_form">
			<div class="subject">제목</div>
			<div class="form-group">
				<jsp:getProperty property="rv_title" name="RVviewDto" />
			</div>
			<a href="Recommend.do?rv_id=${RVviewDto.rv_id }&result=Y">	
				<i class="far fa-thumbs-up"><b>
			추천</b></i></a>
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
					작성일 :&nbsp;&nbsp;<fmt:formatDate value="${RVviewDto.rv_regdate }" pattern="yyyy.MM.dd" />
				</div>
			</div>

			<br>
			<br>
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
			<div class="comment_container">
				<form id="comment_form" method="post" action="RVCommentInsert.do" onsubmit="return comment_ajax(this);">
				<input type="hidden" name="command" value="insertRVComment"/>
				<input type="hidden" name="rv_id" value="${RVviewDto.rv_id }" />
				<div class="comment_form" >
<!-- 			<div class="comment_writer_form"> -->
<!-- 				<div class="comment_writer"> -->
<%-- 					${member_name } --%>
<!-- 				</div> -->
<!-- 				<div class="date"> -->
<%-- 					${qaregdate } --%>
<!-- 				</div> -->

<!-- 			</div> -->
		
 			<div id="comment_list" > 			

 			</div>
 				<hr>
			</div>
				<div class="comment_content">
					<textarea rows="3" cols="120" name="rvcomment_content"></textarea>
					<div class="insert_button">
						<button type="submit" class="btn btn-default" onclick="loginCheck();">등록</button>
					</div>
				</div>
			</form>
		</div>
			
			<div style="text-align: right;">
				<button type="button" class="btn btn-primary" onclick="location.href='SemiProjectServlet.do?command=list'">목록으로</button>
			</div>
			<br>
			<br>

			<div class="prev_next">
		<div class="prev">
			<b>이전글</b>
			<c:choose>
				<c:when test="${prevDocument != null }">
					<c:url var="prevUrl" value="SemiProjectServlet.do?command=RVselectOne">
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
					<c:url var="nextUrl" value="SemiProjectServlet.do?command=RVselectOne">
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
</div>
</div>
<%@ include file="inc/footer.jsp"%>


<!-- 덧글 항목에 대한 템플릿 참조 -->
<script id="tmpl_comment_item" type="text/x-handlebars-template">
	<li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px;' id="{{rvcomment_id}}">
		<div class="media-body" style='display: block;'>
			<h4 class="media-heading clearfix">
				<!--작성자, 작성일시 -->
				<div class='pull-left'>
					{{member_name}}
					<small style='margin-left: 30px;'>
						 {{rvregdate}}
					</small>
				</div>

				<!-- 삭제 버튼 -->
				<div class='pull-right'>
					<a onclick="comment_delete('{{rvcomment_id}}');" data-toggle="modal"
					class='btn btn-danger btn-xs'>
						<i class="far fa-trash-alt"></i>
					</a>
				</div>

				<!--수정 버튼 -->
				<div class='pull-right'>
					<a onclick="comment_edit('{{rvcomment_id}}');" data-toggle="modal" 
					class='btn btn-warning btn-xs'>
						<i class="far fa-edit"></i>
					</a>
				</div>

			</h4>
			<!--내용 -->
			<p>{{{rvcomment_content}}}</p>
		</div>
	</li>
</script>

<!-- 댓글 수정 시 사용될 Modal -->
<div class="modal fade" id="comment_edit_modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<form id="comment_edit_modal" method="post" name="rvcomment_id" action="RVCommentEditOk.do">

	<input type="hidden" name="command" value="updateRVComment"/>
	<input type="hidden" name="rvcomment_id" value="" />
	<input type="hidden" name="member_id" value="${dto.member_id }"/>
	<div class="modal-header">
		
		<h5 class="modal-title">덧글 수정</h5>
		<button type="button" class="close" data-dismiss="modal" 
			aria-label="Close"><span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body">
		
		<div class="form-group">
			<textarea class="form-control" name="rvcomment_content" rows="2" cols="55"></textarea>
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
<form id="comment_delete_form" method="post" action="RVCommentDeleteOk.do">
	<input type="hidden" name="rvcomment_id" value="${rvcommentId}" />
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
	comment_list('${RVviewDto.rv_id }');
	function comment_ajax(f){
		
		var param = $(f).serialize();		//폼의 데이터를 urlencdoing 방식으로 변환해준다.
		
		$.ajax({
		    url: "RVCommentInsert.do", 	// 클라이언트가 요청을 보낼 서버의 URL 주소 
		    data: param,                // HTTP 요청과 함께 서버로 보낼 데이터
		    type: "POST",                             // HTTP 요청 방식(GET, POST)
		    dataType: "json",                         // 서버에서 보내줄 데이터의 타입
		    success: function(data){
		    	$("textarea[name=rvcomment_content]").val("");
		    	comment_list(data.item.rv_id);
		    }
		});
		return false;
	};
	
	function comment_list(rv_id) {
		// rv_id 가 없을 경우 에러로 봐서 List를 가져오지 않는다.
		if(rv_id == 0){
			alert("rv_id가 존재하지 않습니다.");
			return false;
		}
		
		$.ajax({
		    url: "RVCommentList.do?command=selectAllRVComment&rv_id="+rv_id, 	// 클라이언트가 요청을 보낼 서버의 URL 주소
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
		var param = $(this).serialize();
			
		$.ajax({
		    url: "RVCommentEditOk.do", 	// 클라이언트가 요청을 보낼 서버의 URL 주소
		    data: param,                // HTTP 요청과 함께 서버로 보낼 데이터
		    type: "POST",                             // HTTP 요청 방식(GET, POST)
		    dataType: "json",                         // 서버에서 보내줄 데이터의 타입
		    success: function(json){
	 			var template = Handlebars.compile($("#tmpl_comment_item").html());
				
	 			console.log(json);
	 			var html = template(json.item);
	 			$("#" + json.item.id).replaceWith(html);
							
	 			$("#comment_edit_modal").modal('hide');
// 	 			$('#comment_edit_modal').on('hide.bs.modal');
	 			console.log("test4");
	 			comment_list(json.item.rv_id);
		    }
		});
		return false;	
	});
	
	
	//모달창 띄우기
	function comment_edit(id) {
		$("#comment_edit_modal").modal();
		var text = $("#"+id).find(".media-body p").text();
		$("#comment_edit_modal input[name=rvcomment_id]").val(id);
		$("#comment_edit_modal textarea").val(text);
	
	};

	
	function comment_delete(id) {
		$("#comment_delete_modal").modal();
		$("#comment_delete_modal input[name=rvcomment_id]").val(id);
	};
	
	$(document).on('submit',"#comment_delete_form", function(e){
		var items = $(this).serialize();
        $.ajax({
            url: "RVCommentDeleteOk.do",
            type: "POST",
            data: items,
            dataType: "json",
			success: function(data) {
				comment_list('${RVviewDto.rv_id }');
				$(".modal").modal('hide');
			}
        });
        return false;
    });
	
	
	
	
	
	//로그인을 하지 않은 상태라면 댓글을 달 수 없음
	function loginCheck() {
		var member_id = "<%=(String)session.getAttribute("member_id")%>"
      if(member_id == null) {
         alert("로그인 후 사용해주세요.");
      }
	}
			
	
</script>

</body>
</html>