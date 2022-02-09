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
  
  width:600px;
  height:700px;
text-align ;
 margin:;
  border-radius: 1rem;}
.login-form { 
  position: absolute; 
  padding: 30px; 
  width: 400px; 
  background-color: white; 
  border-radius: 5px; 
  top: 50%; 
  left: 50%; 
  transform: translate(-50%, -50%); 
} 


   a { text-decoration: none; text-shadow: 0 0 24px; color: #4e73df; font-size: 15px;}
    input:focus {outline:none;}
</style>

</head>

<body>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ var now = new Date(); var year = now.getFullYear(); var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); //년도 selectbox만들기 
for(var i = 1900 ; i <= year ; i++) { $('#year').append('<option value="' + i + '">' + i + '</option>'); } // 월별 selectbox 만들기 
for(var i=1; i <= 12; i++) { var mm = i > 9 ? i : "0"+i ; $('#month').append('<option value="' + mm + '">' + mm + '</option>'); } // 일별 selectbox 만들기 
for(var i=1; i <= 31; i++) { var dd = i > 9 ? i : "0"+i ; $('#day').append('<option value="' + dd + '">' + dd+ '</option>'); } $("#year > option[value="+year+"]").attr("selected", "true"); $("#month > option[value="+mon+"]").attr("selected", "true"); $("#day > option[value="+day+"]").attr("selected", "true"); })


</script>


<div class="login-form">
<h2 style=" justify-content: center;

  align-items: center;">  &nbsp &nbsp &nbsp캠퍼스픽  &nbsp &nbsp &nbsp회원가입  &nbsp</h2>
<form onsubmit="return joinSubmit();" method="post" action="${pageContext.request.contextPath }/join">
	
	
	
	<label>아이디</label><br><input type="text" name="m_id" id="mid" placeholder="아이디입력" style="width: 200pt; height:20pt;">
	<input type="button" value="중복확인" id="btn1"onclick="idcheck()" style=" cursor: pointer; "><span id="idu"></span>
	<br><small style="font-size: 16px; display: inline;" id="idcheck" ></small>
	
	<br>
	<input type="password" name="m_pwd" id="pw1" onchange="check_pw()" placeholder="비밀번호입력" style="width: 200pt; height:20pt; "><br><br>
<!-- 	<small id= "pw_text_first" style="color: blue; display: inline;"></small> -->
	
	<input type="password" name="passcheck" id="pw2" onchange="check_pw()" placeholder="비밀번호확인" style="width: 200pt; height:20pt;">
	<br><span style="text-align: center;" id="check"></span><br>

	<!-- <small id= "pw_text_check" style="clor: blue; display: inline;"></small> -->
	
	<input type="text" name="m_name" id="name1" placeholder="이름입력" style="width: 200pt; height:20pt;"><br>
	<br>
	<input type="text" name="m_phone" id="phone1" placeholder="휴대폰번호입력" style="width: 200pt; height:20pt;"><br>
	
				o
				
				<br><input class="mail_input" name="m_email"  placeholder="이메일입력" style="width: 200pt; height:20pt;"><br>
				<!--  <input type="button" class="mail_check_button" value="인증번호 전송">
				
			
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<br><input class="mail_check_input" disabled="disabled"  placeholder="인증번호입력">
						<span class="mailcheckbtn"></span>
					</div> -->
				
						
					
	<br>
	<input type="text" name="m_address"  placeholder="주소 미완성" style="width: 200pt; height:20pt;"><br>
	<br>
	<input type="text" name="m_nickname" id="mnick"  placeholder="닉네임 입력" style="width: 200pt; height:20pt;">
	<input type="button" value="중복확인" onclick="nickcheck()"> <br><span id="nickcheck"></span>
	<br>
	생년월일<br>
	<input type="date" name="m_birth" placeholder="2020-01-01" style="width: 200pt; height:20pt;"><br>
	<!-- <select name="yy" id="year"></select>년 
	<select name="mm" id="month"></select>월 
	<select name="dd" id="day"></select>일
 	<input type="hidden" name="m_birth" id = "m_birth"> -->



	<br>
	
	<select name="m_univnum" style="width: 200pt; height:20pt;">
			  <option>학번선택</option>
              <option>12학번</option>
              <option>13학번</option>
              <option>14학번</option>
              <option>15학번</option>
              <option>16학번</option>
              <option>17학번</option>
              <option>18학번</option>
              <option>19학번</option>
              <option>20학번</option>
              <option>21학번</option>
              <option>22학번</option>
              
            </select>            <br>
	<br>
	
	<select name="m_dept" style="width: 200pt; height:20pt;">

              <option>학과선택</option>
              <option>건축학과</option>
              <option>기계공학과</option>
              <option>전기공학과</option>
              <option>생명공학과</option>
              <option>컴퓨터공학과</option>
              <option>외교학과</option>
              <option>국어국문학과</option>
              <option>영어영문학과</option>
              <option>연극영화과</option>
              <option>작곡과</option>
              <option>교육학과</option>
            </select>        <br>
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
            document.getElementById('check').innerHTML='&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp비밀번호가 일치합니다.'
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
		if(mnick=='') {
			return;
		}
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
					span.innerHTML= " " + "사용중인 아이디입니다." ;
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
	