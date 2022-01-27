<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<h1>회원가입</h1>
<div class="form">
<form onsubmit="return joinSubmit();" method="post" action="${pageContext.request.contextPath }/join">
	
	회원아이디<br>
	
	<input type="text" name="m_id" id="mid">
	<input type="button" value="중복확인" onclick="idcheck()"><span id="idcheck"></span>
	<br>
	비밀번호<br>
	<input type="password" name="m_pwd" id="passchk1"><br>
<!-- 	<small id= "pw_text_first" style="color: blue; display: inline;"></small> -->
	비밀번호확인<br>
	<input type="password" name="passcheck" id="passchk2"><br>
	<font id="checkPw" size="2"></font>
	<!-- <small id= "pw_text_check" style="color: blue; display: inline;"></small> -->
	이름<br>
	<input type="text" name="m_name"><br>
	연락처<br>
	<input type="text" name="m_phone"><br>
	이메일<br>
	<input type="text" name="m_email"><br>
	주소<br>
	<input type="text" name="m_address"><br>
	닉네임<br>
	<input type="text" name="m_nickname" id="mnick">
	<input type="button" value="중복확인" onclick="nickcheck()"><span id="nickcheck"></span>
	<br>
	생년월일<br>
	<input type="text" name="m_birth" placeholder="2020-01-01"><br>
	
	학번<br>
	<input type="text" name="m_univnum"><br>
	학과<br>
	<input type="text" name="m_dept"><br>
	<input type="submit" value="가입">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>

	
</body>
<script type="text/javascript">
$('.m_pwd').focusout(function(){
	let pass1 = $("#passchk1").val();
    let pass2 = $("#pass2").val();
    
    if (pass1 != "" || pass2 != ""){
    	if (pass1 == pass2){
        	$("#checkPw").html('일치');
        	$("#checkPw").attr('color','green');
        } else {
        	$("#checkPw").html('불일치');
            $("#checkPw").attr('color','red');
        }
    }

})


	function nickcheck(){
		let mnick=document.getElementById("mnick").value;
		if(mnick=='') return;
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let json=JSON.parse(data);
				let span=document.getElementById("nickcheck");
				if(json.using==true){
					span.innerHTML= " " + "사용중인 닉네임입니다.";
					span.style.color = "red";
				}else{
					span.innerHTML= " " + "사용가능한 닉네임 입니다.";
					span.style.color = "green";
				}
			}
		}
		xhr.open('get','/finalproject/isNick?mnick=' + mnick,true);
		xhr.send();
	}

	function idcheck(){
		let mid=document.getElementById("mid").value;
		if(mid=='') return;
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let json=JSON.parse(data);
				let span=document.getElementById("idcheck");
				if(json.using==true){
					span.innerHTML= " " + "사용중인 아이디입니다.";
					span.style.color = "red";
				}else{
					span.innerHTML= " " + "사용가능한 아이디 입니다.";
					span.style.color = "green";
				}
			}
		}
		xhr.open('get','/finalproject/isMember?mid=' + mid,true);
		xhr.send();
	}

</script>

</html>
	