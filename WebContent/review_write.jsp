<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%
       String ctx = request.getContextPath();    //콘텍스트명 얻어오기.
      MemberDto dto = (MemberDto)session.getAttribute("dto");
   %>
<title>Insert title here</title>

<%@ include file="inc/usertopbar.jsp" %>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="<%=ctx %>/SE2/js/HuskyEZCreator.js" charset="utf-8"></script>

<!-- ReviewWrite css 참조 -->
<link href="css/ReviewWrite.css" rel="stylesheet">
<link rel="stylesheet" href="dist/jquery.flipster.min.css">
<script src="dist/jquery.min.js"></script>
<script src="dist/jquery.flipster.min.js"></script>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/index_menu.css" rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
   rel="stylesheet">
<link href="css/one-page-wonder.min.css" rel="stylesheet">

<!-- 파일 업로드 -->
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
        
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "content", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : false,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["content"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});

</script>
        
</head>
<body>

   <div class="container">
      <form id="frm" action="SemiProjectServlet.do" method="post">
      <input type="hidden" name="command" value="reviewinsert">
         <div class="Review_header">
            
            <h4>이용후기</h4>
            <p>여러분들의 소중한 후기를 남겨주세요.</p>
         </div>
         <hr>

         
         <div class="subject_form">
         
            <div class="subject" style="margin-right: 0px;">
            <span class="input-group-text" id="inputGroupFileAddon01" >제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</span>
            </div>
            <div class="form-group">
                  <input type="text" class="form-control" id="inputSubject" name="title">
              </div>
           </div>
           

           
           <div class="content_form">
              <div class="content">


<!-- 1 -->
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroupFileAddon01">업로드</span>
  </div>
  <div class="custom-file">
    <input type="file" class="custom-file-input"accept='text/plain' onchange='openFile(event)' id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
    <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
  </div>
</div>
<!-- 2 -->



              

<!--   <input type='file' accept='text/plain' onchange='openFile(event)'><br> -->
  <input type="hidden" name="contentfile" id="contentid" value="">
<br>
<script>
  var openFile = function(event) {
    var input = event.target;
    var reader = new FileReader();
    reader.onload = function(){
      var text = reader.result;
      console.log(reader.result.substring(0, 200));
      document.getElementById("contentid").value=text;
    };
    reader.readAsText(input.files[0]);
  };
</script>
             <!-- 글 내용이 들어가는 부분 -->
           <div class="content_form">
              <div class="content">
                 <br>
                 <textarea rows="15" cols="120" id="content" name="content"></textarea>
              </div>
           </div>
         
              </div>
           </div>

      
      
      <div class="buttons">
         <button type="submit" id="save" class="btn btn-primary">작성하기</button>
         <button type="button" class="btn btn-default" onclick="location.href='SemiProjectServlet.do?command=list'">목록으로</button>
      </div> 
      </form>
   </div>





</body>
<%@ include file="inc/footer.jsp" %>
</html>