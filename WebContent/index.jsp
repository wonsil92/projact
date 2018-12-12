<%@page import="com.UTC.dao.RVdocumentDao"%>
<%@page import="com.UTC.dto.RVdocumentDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
		<title>index</title>
		
		
	<!-- 강일 슬라이더 넣은 부분 -->	
	<style type="text/css">
  	  	textarea, iframe{
        display: block;
        margin: 10px 0;
    	}
	</style>

<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->

<%
RVdocumentDao dao= new RVdocumentDao();
List<RVdocumentDto> list = dao.selectTen();
%>	

<%-- 	<%@ include file="inc/admintopbar.jsp" %> --%>
<%-- 	<%@ include file="inc/usertopbar.jsp" %>	 --%>
	<%@ include file="inc/topbar.jsp" %>	<!-- 고치지말것! index에서 위치수정시 오류남 -->

	<link href="css/index_menu.css" rel="stylesheet">
	<link href="dist/jquery.flipster.min.css" rel="stylesheet">
	<link href="plugins/ajax/ajax_helper.css" rel="stylesheet"/>
	
	<script src="js/index.js"></script>		
			
	<script src="dist/jquery.min.js"></script>
	<script src="dist/jquery.flipster.min.js"></script>   
	<script src="plugins/handlebars-v4.0.5.js"></script>
</head>
	
<!---------------------------------------바디 바디 바디----------------------------------->
<body>
<form action="index.jsp" method="post">
	<input type="hidden" name="contentValue" value='<%=list.get(0).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(1).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(2).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(3).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(4).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(5).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(6).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(7).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(8).getFile_id()%> '/>
	<input type="hidden" name="contentValue" value='<%=list.get(9).getFile_id()%> '/>
</form>

	<div class="index">
	
		<header class="masthead text-center text-white">		<!--  헤더      -->
			<div class="masthead-content">
				<div class="container">
					<h1 class="masthead-heading mb-0">UTC</h1>
					<h2 class="masthead-subheading mb-0">UI TO CODE</h2>
					<a href="aboutUs.jsp" class="btn btn-primary btn-xl rounded-pill mt-5">Learn More</a>
				</div>
			</div>
			
			<div class="bg-circle-1 bg-circle"></div>			<!--  그림 원   -->
			<div class="bg-circle-2 bg-circle"></div>
			<div class="bg-circle-3 bg-circle"></div>
			<div class="bg-circle-4 bg-circle"></div>
		</header>,

	<nav class="nav2" style="width: 100%;">						<!-- 메뉴바 -->
		<a href="SemiProjectServlet.do?command=make_up_self"><strong style="color:dark;">Create My Page</strong></a>
  		<a href="SemiProjectServlet.do?command=list" class="is-current">User Reviews</a>
  		<a href="SemiProjectServlet.do?command=qalist">Q&nbsp;&&nbsp;A Board</a>
  		<a href="SemiProjectServlet.do?command=ntlist">Notice</a>
		<a href="SemiProjectServlet.do?command=mypage"><strong style="color:dark;">My page</strong></a>
		
		<div class="nav-underline"></div>
	</nav>


	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 order-lg-2">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="img/01.gif" alt="">
					</div>
				</div>
				<div class="col-lg-6 order-lg-1">
					<div class="p-5">
						<h2 class="display-4">Select the most anticipated site for 2018</h2>
						<p>교육노동부가 선정한 2018년 가장 기대되는 사이트 선정 1위</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="img/02.gif" alt="">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="p-5">
						<h2 class="display-4">직관적 사용</h2>
						<p>Drag & Drop 을 통해 화면이 코드로 나타납니다. 이미지를 활용하여 화면을 구성하고,
						 각 이미지가 나타내는 기능 및 총합된 결과물을 html 코드 형태로 변환해 제공합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 order-lg-2">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="img/03.jpg" alt="">
					</div>
				</div>
				<div class="col-lg-6 order-lg-1">
					<div class="p-5">
						<h2 class="display-4">간편한 관리</h2>
						<p>작업물을 임시 저장, 수정, html파일로 저장하여 보관할 수 있습니다. 
						다른 사람들과 작업 내용을 공유해 보세요.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

<br>


<article id="demo-default" class="demo">					<!-- 슬라이더 -->
	<br><h2 style="text-align: center;">User Reviews</h2><br><br><br><br>
    <div id="coverflow">
        <ul class="flip-items">
            <li data-flip-title="Red">
                <iframe class="myFrame0" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
            <li data-flip-title="Razzmatazz" data-flip-category="Purples">
                <iframe class="myFrame1" style="height: 500px; width: 500px;" src=""></iframe>
             </li>
            <li data-flip-title="Deep Lilac" data-flip-category="Purples">
                <iframe class="myFrame2" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
            <li data-flip-title="Daisy Bush" data-flip-category="Purples">
                <iframe class="myFrame3" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
            <li data-flip-title="Cerulean Blue" data-flip-category="Blues">
                <iframe class="myFrame4" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
            <li data-flip-title="Dodger Blue" data-flip-category="Blues">
                <iframe class="myFrame5" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
            <li data-flip-title="Cyan" data-flip-category="Blues">
                <iframe class="myFrame6" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
            <li data-flip-title="Robin's Egg" data-flip-category="Blues">
                <iframe class="myFrame7" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
            <li data-flip-title="Deep Sea" data-flip-category="Greens">
                <iframe class="myFrame8" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
            <li data-flip-title="Apple" data-flip-category="Greens">
                <iframe class="myFrame9" style="height: 500px; width: 500px;" src=""></iframe>
            </li>
        </ul>
    </div>
		<script type="text/javascript">
    		var coverflow = $("#coverflow").flipster();
		</script>
</article>

</div>



</body>
<%@ include file="inc/footer.jsp" %>
</html>


