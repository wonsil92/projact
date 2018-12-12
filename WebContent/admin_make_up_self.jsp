<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en-US">
<head>
<title>Make up Yourself</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/tether.min.css" />
<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="css/form_builder.css?ver=2" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js?ver=3"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js?ver=2"></script>
<script src="js/form_builder.js?ver=3"></script>



<script type="text/javascript">
//임시저장(쿠키) 함수
function storechk(){			
    if(confirm("임시로 저장하시겠습니까?")){
    	var area_html = $('.form_builder_area').html();
    	setCookie("first",area_html,15);
        return alert("저장되었습니다.");
    } else {
        return false;
    }
}
//불러오기(쿠키) 함수
function callchk(){			
    if(confirm("현재 내용이 지워질 수 있습니다. 불러오시겠습니까?")){
    	var area_html =getCookie('first');
    	$('.form_builder_area').html(area_html);
//     	location.href = location.href;
    	 $('.export_html').show();
         $('.download_html').show();
         getPreview();
//         return alert("불러오기 성공");
    } else {
        return false;
    }
}
    // 쿠키 생성
    function setCookie(cName, cValue, cDay){
        var expire = new Date();
        expire.setDate(expire.getDate() + cDay);
        cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
        if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
        document.cookie = cookies;
    }
    // 쿠키 가져오기
    function getCookie(cName) {
        cName = cName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cName);
        var cValue = '';
        if(start != -1){
            start += cName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cValue = cookieData.substring(start, end);
        }
        return unescape(cValue);
    }
</script>
</head>

<body style="background: white;">



<%@ include file="inc/admintopbar.jsp" %>
				
				<!-- storage버튼 -->
<!-- 드롭다운 -->
 <div class="dropdown" style="float: right; margin-top: 8px; display: inline; ">
    <button type="button" class="btn btn-danger" data-toggle="dropdown" style="cursor: pointer;" >
      STORAGE
    </button>
    <div class="dropdown-menu">
    	<a class="dropdown-item" href='javascript:void(0);' onclick='storechk(); return false'>임시 저장</a>
      	<div class="dropdown-divider"></div>
      	<a class="dropdown-item" href='javascript:void(0);' onclick='callchk(); return false'>불러 오기</a>
      
    </div>
  </div>
<!-- 드롭 end -->
				<!-- storage버튼 종료 -->
				<a class="navbar-brand" href="index.jsp" style="font-size: medium; color: white;"><b>UTC</b></a>
<!-- 				<a style="display: inline; font-size: medium;">UTC</b> -->
					<button style="cursor: pointer; display: none; margin-right: 7px;"
						class="btn btn-success download_html mt-2 pull-right">Download
						HTML</button>
							
					<button style="cursor: pointer; display: none; margin-right: 6px;"
						class="btn btn-info export_html mt-2 pull-right">Export
						HTML</button>					
					
		<br /><br />


		<div class="clearfix"></div>
		<div class="form_builder" >
			<div class="row">
				<!-- 메뉴바 s-->
				<div class="col-sm-2" style="overflow-x:hidden; height:850px; width : 200px; padding:0px; ">
					<nav class="nav-sidebar">
						<ul class="nav">
							<li><strong>HTML 태그</strong></li>	
							<li class="form_bal_map" style=" border-bottom : 1px solid black;" ><a><strong>Map API</strong><i
									class="fa fa-plus-circle pull-right"></i></a></li>							
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
					<div class="form_builder_area"></div>
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

      <div class="footer">
         <p>Copyright &copy; Your Website 2018</p>
      </div>	
<!-- <input type="button" value="쿠키 생성" onclick="setCookie('test', 'cookie test, 쿠키 테스트', 1)"> -->
<!-- <input type="button" value="쿠키 보기" onclick="alert(getCookie('test'))"> -->
<!-- <input type="button" value="쿠키 삭제" onclick="setCookie('test', '', -1)"> -->
</body>
</html>


