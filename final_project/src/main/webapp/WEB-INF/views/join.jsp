<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
body {display: flex;
  justify-content: center;
  align-items: center;
  min-height: 95vh; background: #4e73df}
  
  .form {background: white;

display: grid;
  padding: 4rem;
  border-radius: 1rem;}
   a { text-decoration: none; text-shadow: 0 0 24px; color: #4e73df; font-size: 15px;}
    input:focus {outline:none;}
</style>

</head>

<body>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ var now = new Date(); var year = now.getFullYear(); var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); //년도 selectbox만들기 
for(var i = 1900 ; i <= year ; i++) { $('#year').append('<option value="' + i + '">' + i + '년</option>'); } // 월별 selectbox 만들기 
for(var i=1; i <= 12; i++) { var mm = i > 9 ? i : "0"+i ; $('#month').append('<option value="' + mm + '">' + mm + '월</option>'); } // 일별 selectbox 만들기 
for(var i=1; i <= 31; i++) { var dd = i > 9 ? i : "0"+i ; $('#day').append('<option value="' + dd + '">' + dd+ '일</option>'); } $("#year > option[value="+year+"]").attr("selected", "true"); $("#month > option[value="+mon+"]").attr("selected", "true"); $("#day > option[value="+day+"]").attr("selected", "true"); })


</script>


<div class="form">
<h1 style="text-align: center;">회원가입</h1>
<form onsubmit="return joinSubmit();" method="post" action="${pageContext.request.contextPath }/join">
	
	
	
	<input type="text" name="m_id" id="mid" placeholder="아이디입력"><span id="idu"></span>
	<input type="button" value="중복확인" onclick="idcheck()"><span id="idcheck"></span>
	<br>
	<br>
	<input type="password" name="m_pwd" id="pw1" onchange="check_pw()" placeholder="비밀번호입력"><br>
<!-- 	<small id= "pw_text_first" style="color: blue; display: inline;"></small> -->
	<br>
	<input type="password" name="passcheck" id="pw2" onchange="check_pw()" placeholder="비밀번호확인"><span id="check"></span><br>

	<!-- <small id= "pw_text_check" style="color: blue; display: inline;"></small> -->
	<br>
	<input type="text" name="m_name" id="name1" placeholder="이름입력"><br>
	<br>
	<input type="text" name="m_phone" id="phone1" placeholder="휴대폰번호입력"><br>
	
				
				
				<br><input class="mail_input" name="m_email"  placeholder="이메일입력"><br>
				<!--  <input type="button" class="mail_check_button" value="인증번호 전송">
				
			
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<br><input class="mail_check_input" disabled="disabled"  placeholder="인증번호입력">
						<span class="mailcheckbtn"></span>
					</div> -->
				
						
					
	<br>
	<input type="text" name="m_address"  placeholder="주소 미완성"><br>
	<br>
	<input type="text" name="m_nickname" id="mnick"  placeholder="닉네임 입력">
	<input type="button" value="중복확인" onclick="nickcheck()"> &nbsp;<span id="nickcheck"></span>
	<br>
	생년월일<br>
	<input type="text" name="m_birth" placeholder="2020-01-01"><br>
	<!-- <select name="yy" id="year"></select>년 
	<select name="mm" id="month"></select>월 
	<select name="dd" id="day"></select>일
 -->



	<br>
	<input type="text" name="m_univnum" placeholder="학번"><br>
	<br>
	<input type="text" name="m_dept" placeholder="학과"><br>
	<input type="submit" value="가입">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</div>



	
</body>
<script type="text/javascript">
function check_pw(){
    var pw1 = document.getElementById('pw1').value;
    var pw2 = document.getElementById('pw2').value;
    var regPwd = /^[A-Za-z0-9+]*$/;
    
   
    if(pw1.length<6 || !regPwd.test(pw1)){
    	
    	alert('비밀번호 6자리이상 입력 또는 공백을 사용하지말아주세요!');
    	document.getElementById("pw1").focus();
    	return false;
    }
    
    if( pw1 !='' && pw2!=''){
        if(pw1==pw2){
            document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
            document.getElementById('check').style.color='green';
        }
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('check').style.color='red';
        }
    }
}


</script>
<script type="text/javascript">
	var code="";
$(".mail_check_button").click(function(){
	
	var email = $(".mail_input").val();  
	var cehckBox = $(".mail_check_input");  
	var boxWrap = $(".mail_check_input_box");

	 
	 $.ajax({
	        
	        type:"get",
	        url:"mailCheck?email=" + email
	        		
	        
	});
	 
	 cehckBox.attr("disabled",false);
	 boxWrap.attr("id", "mail_check_input_box_true");
		code=data;
		
		
});
</script>



<script type="text/javascript">


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
	