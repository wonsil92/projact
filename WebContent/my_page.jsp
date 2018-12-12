<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>mypage</title>

	<%@ include file="inc/usertopbar.jsp" %>

	<link href="css/index_menu.css" rel="stylesheet">
	<link rel="stylesheet" href="dist/jquery.flipster.min.css">
	<link rel="stylesheet" href="plugins/ajax/ajax_helper.css" />

	<script src="dist/jquery.min.js"></script>
	<script src="dist/jquery.flipster.min.js"></script>
	<script src="plugins/handlebars-v4.0.5.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

	<script type="text/javascript">

/* 사이드메뉴클릭시 div에 내용 표시 */
$(document).ready(function() {
/* 	mypage 처음 로딩 시 mine.jsp를 불러온다 */
	$("#target").load("SemiProjectServlet.do?command=listOfuser").trigger("click");

/* 마이페이지 클릭했을 때 */
	$("#load_mine").on("click",function(){
		$("#target").load("SemiProjectServlet.do?command=listOfuser");
	});

/* 내가만든페이지 클릭했을 때 */
/* 	$("#load_locker").on("click",function(){
		$("#target").load("SemiProjectServlet.do?command=iMadeUser");
	}); */

});

</script>


<style>
@import
	url('http://fonts.googleapis.com/css?family=Open+Sans:300,400,700');

@import
	url('http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css')
	;

body {
	color: #5D5F63;
	background: white;
	font-family: 'Open Sans', sans-serif;
	padding: 0;
	margin: 0;
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased;
}

.sidebar {
	width: 15%;
/*  	height:70%;  */
	background: white;
	position: fixed;
	display: inherit;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
	z-index: 100;
}

.sidebar #leftside-navigation ul, .sidebar #leftside-navigation ul ul {
	margin: -2px 0 0;
	padding: 0;
}

.sidebar #leftside-navigation ul li {
	list-style-type: none;
	border-bottom: 1px solid rgba(255, 255, 255, 0.05);
}

.sidebar #leftside-navigation ul li.active ul {
	display: block;
}

.sidebar #leftside-navigation ul li a {
	color: black;
	text-decoration: none;
	display: block;
	padding: 18px 0 18px 25px;
	font-size: 12px;
	outline: 0;
	-webkit-transition: all 200ms ease-in;
	-moz-transition: all 200ms ease-in;
	-o-transition: all 200ms ease-in;
	-ms-transition: all 200ms ease-in;
	transition: all 200ms ease-in;
}

.sidebar #leftside-navigation ul li a:hover {
	color: silver;
}

.sidebar #leftside-navigation ul li a span {
	display: inline-block;
}

.sidebar #leftside-navigation ul li a i {
	width: 20px;
}

section {
	height: 400px;
}

#left {
	float: left;
}

#right {
	width: 85%;
	height: 100%;
	float: right;
	margin-bottom: 150px;
}
</style>



</head>

<body>
<%
System.out.println("세션 정보 확인");
//로그인 값 가져오기
MemberDto logindto = (MemberDto)session.getAttribute("dto");
System.out.println("세션이메일: "+ logindto.getMember_email());
System.out.println("회원번호: "+ logindto.getMember_id());
%>

	<br>
	<br>
	<br>
	<br>
	<aside class="sidebar" id="left">
		<div id="leftside-navigation" class="nano">
			<ul class="nano-content">

				<li class="nano-content"><a href="#" id="load_mine"><i
						class="fa fa-table"></i><span>마이페이지</span><i
						class="arrow fa fa-angle-right pull-right"></i></a></li>

				<!-- <li class="nano-content"><a href="#" id="load_locker"><i
						class="fa fa-table"></i><span>내가 만든 페이지</span><i
						class="arrow fa fa-angle-right pull-right"></i></a></li> -->
			</ul>
		</div>
	</aside>

	<article class="html5" id="right">
	<div id="target">

	</div>
	</article>
<%@ include file="inc/footer_my_page.jsp" %>
</body>
</html>
