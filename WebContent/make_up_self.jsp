<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Make up Yourself</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/tether.min.css" />
<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="css/form_builder.css?ver=3" />

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js?ver=2"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js?ver=1"></script>
<script src="js/form_builder.js?ver=2"></script>



<script type="text/javascript">
	//div 내용 DB에 저장하기
	function saveB() {
		var title = prompt('특수문자를 제외하고 입력해 주세요');
		if (title == null) {
			return;
		}
		var content = document.getElementById("formBuilder").innerHTML;

		if (content == null) {
			alert("빈 내용을 저장 할 수 없습니다.");
			return false;
		} else {
			$("#title").attr("value", title);
			$("#content").attr("value", content);

			document.getElementById("frm").submit();
			//return alert("마이페이지에 저장되었습니다.");

		}
	}

	//div안에 null이면 안보이게
	$(document).ready(function() {
		var nullChk = document.getElementById("formBuilder").innerText;
		if (nullChk == "null") {
			$("#formBuilder").empty();
		} else {
			return false;
		}
	});
</script>
</head>

<body style="background: white;">

	<jsp:useBean id="makeViewDto" class="com.UTC.dto.MakeBoardDto"
		scope="request"></jsp:useBean>





	<div class="container">
		<!-- 탑바 -->
		<nav class="navbar navbar-light  bg-faded fixed-top"
			style="text-align: center; background-color: rgba(0, 0, 0, .7); color: white;">

			<div class="clearfix">

				<div class="container">
            
<!------------------------  드롭다운시작 ------------->
       <div class="dropdown" style="display: inline; float: left; cursor: pointer;">
          <button type="button" class="btn btn-link" data-toggle="dropdown" style="cursor: pointer; color: white;">
               <span class="navbar-toggler-icon"></span>
            </button>
            
            
<c:if test="${dto.getMember_role() eq null or dto.getMember_role() eq'USER'}">
       <div class="dropdown-menu">
             <a class="dropdown-item"href="SemiProjectServlet.do?command=make_up_self"><strong style="color:dark;">Create My Page</strong></a>
              <a class="dropdown-item"href="SemiProjectServlet.do?command=list"><strong style="color:dark;">User Reviews</strong></a>
              <a class="dropdown-item"href="SemiProjectServlet.do?command=qalist"><strong style="color:dark;">Q&nbsp;&&nbsp;A Board</strong></a>
              <a class="dropdown-item"href="SemiProjectServlet.do?command=ntlist"><strong style="color:dark;">Notice</strong></a>
            <a class="dropdown-item"href="SemiProjectServlet.do?command=mypage"><strong style="color:dark;">My page</strong></a>
       </div>
</c:if>

<c:if test="${dto.getMember_role() eq 'ADMIN' }">
       <div class="dropdown-menu">
            <a class="dropdown-item" href="make_up_self.jsp"><strong style="color:dark;">Create My Page</strong></a>
            <a class="dropdown-item" href="SemiProjectServlet.do?command=admin_rvlist"><strong style="color:dark;">User Reviews</strong></a>
            <a class="dropdown-item" href="SemiProjectServlet.do?command=admin_qalist"><strong style="color:dark;">Q&nbsp;&&nbsp;A Board</strong></a>
            <a class="dropdown-item" href="SemiProjectServlet.do?command=admin_ntlist"><strong style="color:dark;">Notice</strong></a>
            <a class="dropdown-item" href="SemiProjectServlet.do?command=selectAll"><strong style="color:dark;">Member Views</strong></a>
       </div>
</c:if>

        </div>
<!-- 드롭다운 종료 -->

					<!-- storage버튼 -->
					<!-- 드롭다운 -->
					<div class="dropdown"
						style="float: right; margin-top: 8px; display: inline;">
						<button type="button" class="btn btn-danger"
							data-toggle="dropdown" style="cursor: pointer;">
							STORAGE</button>
						<div class="dropdown-menu" id="storebtn">
							<a class="dropdown-item" href='javascript:void(0);'
								onclick='saveB(); return false'><b>저장 하기</b></a>
							<!--          <div class="dropdown-divider"></div> -->
							<!--          <a class="dropdown-item" href='javascript:void(0);'   onclick='deleteCookie(); return false'><b>쿠키 삭제</b></a> -->

						</div>
					</div>
					<!-- 드롭 end -->
					<!-- storage버튼 종료 -->

					<%
						if (session.getAttribute("dto") == null) {
					%>
					<a class="navbar-brand" href="index.jsp"
						style="font-size: medium; color: white;"><b>UTC</b></a>
					<%
						} else {
					%>
					<a class="navbar-brand" href="user_main.jsp"
						style="font-size: medium; color: white;"><b>UTC</b></a>
					<%
						}
					%>
					<button style="cursor: pointer; display: none; margin-right: 7px;"
						class="btn btn-success download_html mt-2 pull-right">Download
						HTML</button>

					<button style="cursor: pointer; display: none; margin-right: 6px;"
						class="btn btn-info export_html mt-2 pull-right">Export
						HTML</button>

				</div>
			</div>
		</nav>
		<br />
		<br />


		<div class="clearfix"></div>
		<div class="form_builder">
			<div class="row">
				<!-- 메뉴바 s-->
				<div class="col-sm-2"
					style="overflow-x: hidden; height: 850px; width: 200px; padding: 0px;">
					<nav class="nav-sidebar">
						<ul class="nav">
							<li><strong>HTML 태그</strong></li>
							<li class="form_bal_map" style="border-bottom: 1px solid black;"><a><strong>Map
										API</strong><i class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_a"><a>A <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_audio"><a>Audio <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_button"><a>Button <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_big"><a>Big <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_br"><a>Br <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_checkbox"><a>Checkbox <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_date"><a>Date <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_email"><a>Email <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_h1"><a>H1~6 <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_hr"><a>Hr <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_i"><a>I <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_img"><a>Img <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_number"><a>Number <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_password"><a>Password <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_progress"><a>Progress <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_radio"><a>Radio Button <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_select"><a>Select <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_strong"><a>Strong <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_table"><a>Table <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_textarea"><a>Text Area <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_textfield"><a>Text (Input) <i
									class="fa fa-plus-circle pull-right"></i></a></li>
							<li class="form_bal_symbol"><a>특수 기호 <i
									class="fa fa-plus-circle pull-right"></i></a></li>
						</ul>
					</nav>

					<!-- 메뉴바 f-->
				</div>

				<!-- 드래그한거 놓일 영역 -->
				<div class="col-md-5 bal_builder">
					<form id="frm" action="SemiProjectServlet.do" method="post">
						<input type="hidden" name="command" value="makewrite" /> <input
							type="hidden" name="title" id="title" /> <input type="hidden"
							name="content" id="content" />
						<div class="form_builder_area" id="formBuilder">

							<jsp:getProperty property="make_content" name="makeViewDto" />

						</div>
					</form>
				</div>

				<!-- 폼 영역 -->
				<div class="col-md-5">
					<div class="col-md-12">
						<form class="form-horizontal">
							<div class="preview"></div>
							<div style="display: none" class="form-group plain_html">
								<textarea rows="50" class="form-control"></textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div>
		<a><img onclick="window.scrollTo(0,0)"
			; style="position: fixed; left: 48%; width: 40px; height: 40px; cursor: pointer;"
			alt="123" src="img/uppoint.png"></a>
	</div>

</body>
</html>
