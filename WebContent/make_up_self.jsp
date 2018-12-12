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
<link rel="stylesheet" href="css/form_builder.css?ver=3" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js?ver=2"></script>
<script src="js/tether.min.js"></script>
<script src="js/bootstrap.min.js?ver=1"></script>
<script src="js/form_builder.js?ver=2"></script>



<script type="text/javascript">


<%
    // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;
   int i=0;
    if(cookies != null){       
        for(i=1; i < cookies.length; i++){
            Cookie c = cookies[i];             
            // 저장된 쿠키 이름을 가져온다
            String cName = c.getName();     

            // 쿠키값을 가져온다
            String cValue = c.getValue() ;           
        }
    }
 
%>

window.onload = function() { 
   
   if(document.getElementsByName("contentValue")[1].value !=""){
   $("#storebtn").append("<a class=\"dropdown-item\" href='javascript:void(0);' onclick='callchk(\""+document.getElementsByName("contentValue")[1].value+"\"); return false'>"+document.getElementsByName("contentValue")[1].value+"</a>");
   }
   if(document.getElementsByName("contentValue")[2].value !=""){
      $("#storebtn").append("<a class=\"dropdown-item\" href='javascript:void(0);' onclick='callchk(\""+document.getElementsByName("contentValue")[2].value+"\"); return false'>"+document.getElementsByName("contentValue")[2].value+"</a>");
      }
   if(document.getElementsByName("contentValue")[3].value !=""){
      $("#storebtn").append("<a class=\"dropdown-item\" href='javascript:void(0);' onclick='callchk(\""+document.getElementsByName("contentValue")[3].value+"\"); return false'>"+document.getElementsByName("contentValue")[3].value+"</a>");
      }
   if(document.getElementsByName("contentValue")[4].value !=""){
      $("#storebtn").append("<a class=\"dropdown-item\" href='javascript:void(0);' onclick='callchk(\""+document.getElementsByName("contentValue")[4].value+"\"); return false'>"+document.getElementsByName("contentValue")[4].value+"</a>");
      }
   if(document.getElementsByName("contentValue")[5].value !=""){
      $("#storebtn").append("<a class=\"dropdown-item\" href='javascript:void(0);' onclick='callchk(\""+document.getElementsByName("contentValue")[5].value+"\"); return false'>"+document.getElementsByName("contentValue")[5].value+"</a>");
      }
}

//임시저장(쿠키) 함수
   function storechk(){
      var area_html = $('.form_builder_area').html();
      var cname=prompt('저장할 이름을 입력하세요','기본 값 문자열');
      setCookie(cname,area_html,15);
      if(!cname.equals(""))
      return alert("저장되었습니다.");
   }
//불러오기(쿠키) 함수
   function callchk(first){         
    if(confirm("현재 내용이 지워질 수 있습니다. 불러오시겠습니까?")){
       var area_html =getCookie(first);
       $('.form_builder_area').html(area_html);
//        location.href = location.href;
        $('.export_html').show();
         $('.download_html').show();
//          getPreview();
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
//쿠키 삭제하기
   function deleteCookie(){
    var expireDate = new Date();
    var cookieName=prompt('삭제할 쿠키를 입력하세요');
      
    //어제 날짜를 쿠키 소멸 날짜로 설정한다.
    expireDate.setDate( expireDate.getDate() - 1 );
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
    alert("삭제 완료");
    window.location.reload();
}

   //div 내용 DB에 저장하기
     function saveB(){
        if(confirm("현재 화면을 MakeUpMyself.txt로 저장합니다\n저장한 화면은 마이페이지에서 열람할 수 있습니다")){
            var title = prompt('마이페이지에서 확인할 이름을 입력하세요','특수문자를 제외하고 입력해 주세요');
            var content = document.getElementById("formBuilder").innerHTML;
            //alert(title);
            //alert(content);
            $("#title").attr("value", title);
            $("#content").attr("value", content);
            //alert("타이틀\n"+$("#title").val());
            //alert("내용\n"+$("#content").val());
            document.getElementById("frm").submit();
            //return alert("마이페이지에 저장되었습니다.");
         }else{
            return false;
         }
     }

</script>
</head>

<body style="background: white;">
   <input type="hidden" name="contentValue" value='<%=cookies.length%> '/>
   <input type="hidden" name="contentValue" value='<%=cookies.length >=2 ? cookies[1].getName() :"" %>'/>
   <input type="hidden" name="contentValue" value='<%=cookies.length >=3 ? cookies[2].getName() :"" %>'/>
   <input type="hidden" name="contentValue" value='<%=cookies.length >=4 ? cookies[3].getName() :"" %>'/>
   <input type="hidden" name="contentValue" value='<%=cookies.length >=5 ? cookies[4].getName() :"" %>'/>
   <input type="hidden" name="contentValue" value='<%=cookies.length >=6 ? cookies[5].getName() :"" %>'/>
   
   


   <div class="container" >
      <!-- 탑바 -->
      <nav class="navbar navbar-light  bg-faded fixed-top"
         style="text-align: center; background-color: rgba(0,0,0,.7); color: white; ">

         <div class="clearfix" >

            <div class="container">
            
                              <!--  드롭다운 ㅡㅡㅡ이거-->
<!--    <div class="container"> -->
       <div class="dropdown" style="display: inline; float: left; cursor: pointer;">
          <button type="button" class="btn btn-link" data-toggle="dropdown" style="cursor: pointer; color: white;">
               <span class="navbar-toggler-icon"></span>
            </button>
            
          <div class="dropdown-menu">
       <a class="dropdown-item" href="SemiProjectServlet.do?command=make_up_self"><strong style="color:dark;">Create My Page</strong></a>
        <a class="dropdown-item" href="SemiProjectServlet.do?command=list" class="is-current">User Reviews</a>
        <a class="dropdown-item" href="SemiProjectServlet.do?command=qalist">Q&nbsp;&&nbsp;A Board</a>
        <a class="dropdown-item" href="SemiProjectServlet.do?command=ntlist">Notice</a>
      <a class="dropdown-item" href="SemiProjectServlet.do?command=mypage"><strong style="color:dark;">My page</strong></a>
      
          
      </div>
        </div>
<!--    </div> -->
   <!-- 드롭다운 종료 -->
            
            <!-- storage버튼 -->
<!-- 드롭다운 -->
 <div class="dropdown" style="float: right; margin-top: 8px; display: inline; ">
    <button type="button" class="btn btn-danger" data-toggle="dropdown" style="cursor: pointer;" >
      STORAGE
    </button>
    <div class="dropdown-menu" id="storebtn">
       <a class="dropdown-item" href='javascript:void(0);' onclick='storechk(); return false'><b>임시 저장</b></a>
         <div class="dropdown-divider"></div>
         <a class="dropdown-item" href='javascript:void(0);'   onclick='deleteCookie(); return false'><b>쿠키 삭제</b></a>
      
    </div>
  </div>
<!-- 드롭 end -->
            <!-- storage버튼 종료 -->
            
<%
   if(session.getAttribute("dto")==null){
      %>
      <a class="navbar-brand" href="index.jsp" style="font-size: medium; color: white;"><b>UTC</b></a>
      <%
   }else{
      %>
      <a class="navbar-brand" href="user_main.jsp" style="font-size: medium; color: white;"><b>UTC</b></a>
      <%   
   }

%>            
               <button style="cursor: pointer; display: none; margin-right: 7px;"
                  class="btn btn-success download_html mt-2 pull-right" onclick="saveB(); return false">Download
                  HTML</button>
                     
               <button style="cursor: pointer; display: none; margin-right: 6px;"
                  class="btn btn-info export_html mt-2 pull-right">Export
                  HTML</button>               
               
            </div>
         </div>
      </nav>
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

     <div>
       <a><img onclick="window.scrollTo(0,0)"; style=" position: fixed; left:48%; width: 40px; height: 40px; cursor: pointer;" alt="123" src="img/uppoint.png"></a>
    </div>

</body>
</html>

