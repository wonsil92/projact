<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check(){
		var form = document.authenform;
		var authNum = ${authNum};
		
		if(!form.authnum.value){
			alert("인증번호를 입력해주세요.");
			return false;
		}
		if(form.authnum.value!=authNum){
			alert("틀린 인증번호 입니다. 다시입력해주세요!");
			form.authnum.value="";
			return false;
		}
		
		//인증완료가 되면 이메일칸 수정불가(읽기전용)
		//이메일 인증완료 = 이메일 칸(읽기전용)
		if(form.authnum.value==authNum){
			alert("인증완료");
			self.close();
			opener.document.getElementById("inputEmail").readOnly=true;

		}
	}
</script>
</head>
<body>
	<h5>이메일로 전송된 인증번호 7자리를 적어주세요.</h5>

	<div class="container">
		<form method="post" name="authenform" onSubmit="return check();">
			<input type="text" name="authnum"><br/><br/>
			<input type="submit" class="btn btn-info" value="인증하기">
		</form>
	
	</div>

</body>
</html>