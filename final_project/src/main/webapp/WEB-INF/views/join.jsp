<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
input:focus {
  color: #4e73df;}
 body {display: flex;
  justify-content: center;
  
  align-items: center;
  min-height: 95vh; background: #4e73df}
  .j1{text-align:center;}
	.j2{
        position : relative;
        left : 450px;
        top: 1px;
      }
      .gaip_div {
			text-align: center;
			margin: 10px;
			margin-top:80px;
		}
		input:focus {outline:none;}
		
		.login1 {background: white;
		
text-align: center;
display: grid;
width:550px;
height :900px;
  padding: 4rem;
  border-radius: 1rem;}
    a { text-decoration: none; text-shadow: 0 0 24px; color: #4e73df; font-size: 15px;}
 /*  .form {background: white;
  
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
    input:focus {outline:none;}  */
</style>

</head>

<body>
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){ var now = new Date(); var year = now.getFullYear(); var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); //년도 selectbox만들기 
for(var i = 1900 ; i <= year ; i++) { $('#year').append('<option value="' + i + '">' + i + '</option>'); } // 월별 selectbox 만들기 
for(var i=1; i <= 12; i++) { var mm = i > 9 ? i : "0"+i ; $('#month').append('<option value="' + mm + '">' + mm + '</option>'); } // 일별 selectbox 만들기 
for(var i=1; i <= 31; i++) { var dd = i > 9 ? i : "0"+i ; $('#day').append('<option value="' + dd + '">' + dd+ '</option>'); } $("#year > option[value="+year+"]").attr("selected", "true"); $("#month > option[value="+mon+"]").attr("selected", "true"); $("#day > option[value="+day+"]").attr("selected", "true"); })


</script>


<div class="login1">
<h2 style="color: #4e73df ">캠퍼스픽 회원가입</h2><br>
	<form onsubmit="return joinSubmit();" method="post" action="${pageContext.request.contextPath }/join">
	
		<br><input type="text" name="m_id" id="mid" placeholder="아이디입력" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df " >
		<input type="button" value="중복확인" id="btn1" onclick="idcheck()" style="width: 65pt; height:24pt; background-color: white;color: #4e73df; border: 1px solid #4e73df;
		border-radius: 4px; font-size: 14px; position: absolute;  cursor: pointer; font-weight: 900;">
		<span id="idu"></span> 
		
		<input type="hidden" id="idChkYn" value='N'><br>
		<small style="text-align: center; font-size: 3px; display: inline;" id="idcheck"></small><br>
			
		<input type="password" name="m_pwd" id="pw1" onchange="check_pw()" placeholder="비밀번호입력" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br><br>
		
		<input type="password" name="passcheck" id="pw2" onchange="check_pw()" placeholder="비밀번호확인" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "> <br>
		<span style="text-align: center; font-size: 3px;" id="check"></span><br>

		
			<input type="text" name="m_name" id="mname" placeholder="이름입력"
				style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br> <br> <input
				type="text" name="m_phone" id="mphone"  maxlength="11" placeholder="휴대폰번호입력"
				style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br> <br>
			<input class="mail_input" name="m_email"  id="memail" placeholder="이메일입력"
				style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df ">
			<input type="button" class="mail_check_button" id="mailbtn" value="인증번호 전송" style="width: 90pt; height:24pt; background-color: white;color: #4e73df; border: 1px solid #4e73df;
		border-radius: 4px; font-size: 14px; position: absolute;  cursor: pointer; font-weight: 900;">



		<!-- 	<div class="mail_check_input_box" id="mail_check_input_box_false"> -->
				<br><br>
				<input class="mail_check_input" id="mailnum" disabled="disabled"
					placeholder="인증번호입력" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "> <br>
					<span style="font-size: 10px; display: inline;" class="mailcheck" id="mailnumCheck"></span>
			<!-- </div> -->



			<br>
			<!-- <input type="text" name="m_address"  placeholder="주소 미완성" style="width: 200pt; height:20pt;"><br> -->
<div> 

			<input class="address_input_1" id= "add1" name="m_address" readonly="readonly" placeholder="주소찾기" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df ">
			<!-- <button class="address_button" onclick="execution_daum_address()">주소찾기</button> -->

			<input type="button" class="address_button"
				onclick="execution_daum_address()" value="주소찾기"  style="width: 65pt; height:24pt; background-color: white;color: #4e73df; border: 1px solid #4e73df;
		border-radius: 4px; font-size: 14px; position: absolute;  cursor: pointer; font-weight: 900;"> <br>
				<input class="address_input_2" name="m_address" readonly="readonly" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br>

			<input class="address_input_3" id= "add3" name="m_address" placeholder="주소상세정보" readonly="readonly" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br>
			<input type="hidden" name="m_address"> </div><br>
			<input type="text" name="m_nickname" id="mnick" placeholder="닉네임 입력"
				style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "> <input type="button"
				value="중복확인" onclick="nickcheck()" style="width: 65pt; height:24pt; background-color: white;color: #4e73df; border: 1px solid #4e73df;
		border-radius: 4px; font-size: 14px; position: absolute;  cursor: pointer; font-weight: 900;"> <br>
			<span id="nickcheck"   style="text-align: center; font-size: 3px; display: inline;"></span>	<input type="hidden" id="nickChkYn" value='N'> <br> 
		
			<!-- 	<input type="date" name="m_birth" placeholder="2020-01-01" style="width: 200pt; height:20pt;"><br> -->
			<!-- <select name="m_birth" id="year"></select>년  -->
			<input type="text" name="m_birth" id="year" placeholder="ex)2000"  style="width: 49pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df ">&nbsp년&nbsp<select name="m_birth"
				id="month" style="width: 65pt; height:24pt; background-color: white;color: #4e73df; border: 3px solid #4e73df;
		border-radius: 4px; font-size: 14px;  "></select>&nbsp월&nbsp<select name="m_birth" id="day" style="width: 65pt; height:24pt; background-color: white;color: #4e73df; border: 3px solid #4e73df;
		border-radius: 4px; font-size: 14px; "></select>&nbsp일&nbsp<br>
<br>
			<select name="m_univnum"  id="muni" style="width: 200pt; height:24pt; background-color: white;color: #4e73df; border: 3px solid #4e73df;
		border-radius: 4px; font-size: 14px; ">
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

			</select> <br> <br> <select name="m_dept" id="mdept"
				style="width: 200pt; height:24pt; background-color: white;color: #4e73df; border: 3px solid #4e73df;
		border-radius: 4px; font-size: 14px; ">

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
			</select> <br><br> <input type="submit" value="회원가입" style="width: 230pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;"> 
			 <br><br><a style= "font-size: 16px; font-weight: bold ;" href="${cp}/home">홈으로</a>
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
            document.getElementById('check').innerHTML='비밀번호가 일치합니다';
            document.getElementById('check').style.color='green';
            document.getElementById('check').addEventListener='keyup';
        } 
        else{
            document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다';
            document.getElementById('check').style.color='red';
            document.getElementById('check').addEventListener='keyup';
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
	alert('이메일 인증번호 전송완료! 이메일을 확인해주세요')
	 
	 $.ajax({
	        
	        type:"get",
	        url:"mailCheck?email=" + email,
	        success:function(data){
	        		/* 	console.log("data : "  + data); */
	        	cehckBox.attr("disabled",false);
	        	boxWrap.attr("id", "mail_check_input_box_true");
	        	code = data;
	        		}
		});  		
	        
	});
	 
	$(".mail_check_input").blur(function(){
	    
	    var inputCode = $(".mail_check_input").val();       // 입력코드    
	    var mailcheck = $(".mailcheck"); 
	        
	    
	    if(inputCode == code){                            // 일치할 경우
	    	mailcheck.html("인증번호가 일치합니다");
	    	$(".mailcheck").css("color","green");
	    	 mailcheck  =true;
	    	
	    } else {                                            // 일치하지 않을 경우
	    	mailcheck.html("인증번호를 다시 확인해주세요");
	    	$(".mailcheck").css("color","red");
	    	 mailcheck  =false;
	    }    
	});
	 
	function joinSubmit(){
		
		var regPwd = /^[A-Za-z0-9+]*$/;
		var regName = /[ㄱ-ㅎㅏ-ㅣ가-힣]/g;
		var phoneRule=/[0-9]{11}$/;
		var biRule=/[0-9]$/;
		
		if(document.getElementById('mid').value == null || document.getElementById('mid').value == '') {
			alert("아이디를 입력해주세요");
			document.getElementById("mid").focus();
			return false;
		}
		if(document.getElementById('idChkYn').value != 'Y'){
			alert("아이디 중복확인을 해주세요");
			document.getElementById("mid").focus();
			console.log(document.getElementById('idChkYn').value);
			return false;
		}
		if(document.getElementById('pw1').value == null || document.getElementById('pw1').value == ''){
			   document.getElementById("pw1").focus();
			alert("비밀번호를 입력해주세요.");
			return false;
		}else if((!regPwd.test(document.getElementById('pw1').value)) || (document.getElementById('pw1').value.length <=5)) {
		      document.getElementById("pw1").focus();
		      alert("비밀번호는 6자리이상 입력해주세요")
		      return false;
		}else if(document.getElementById('pw1').value != document.getElementById('pw2').value){
			document.getElementById("pw2").focus();
			return false;
		}else if(document.getElementById('pw2').value ==null || document.getElementById('pw2').value == ''){
			document.getElementById("pw2").focus();
			alert("비밀번호 확인을해주세요");
		

			return false;
		}
		if(document.getElementById('mname').value == null || document.getElementById('mname').value == ''){
			alert("이름를 입력해주세요");
			document.getElementById("mname").focus();
			return false;
		}else if(!regName.test(document.getElementById('mname').value)) {
			alert("이름은 한글로 입력해주세요");
			document.getElementById("mname").focus();
			return false;
		}
		if(document.getElementById('mphone').value == null || document.getElementById('mphone').value == ''){
			alert("휴대폰번호를 입력해주세요");
			document.getElementById("mphone").focus();
			return false;
		}else if(!phoneRule.test(document.getElementById('mphone').value)){
			alert("휴대폰번호는 - 빼고 11자리를 입력해주세요");
			document.getElementById("mphone").focus();
			return false;
		}
		
		if(document.getElementById('memail').value == null || document.getElementById('memail').value == ''){
			alert("이메일을 입력해주세요");
			document.getElementById("memail").focus();
			return false;
		
		}
		if(document.getElementById('mailnum').value == null || document.getElementById('mailnum').value == '' ){
			alert("이메일 인증번호전송를 눌러 인증번호를 입력해주세요");
			
			return false;
		
		
		}else if( $(".mail_check_input").val() != code){
			alert("이메일 인증번호를 정확히 입력해주세요");
			return false;
		}
		
		if(document.getElementById('add1').value == null || document.getElementById('add1').value == ''){
			alert("주소찾기를 해주세요");
			document.getElementById("add1").focus();
			return false;
		
		}
		if(document.getElementById('add3').value == null || document.getElementById('add3').value == ''){
			alert("나머지 주소입력해주세요");
			document.getElementById("add3").focus();
			return false;
		
		}
		
		if(document.getElementById('mnick').value == null || document.getElementById('mnick').value == ''){
			alert("닉네임을 입력해주세요");
			document.getElementById("mnick").focus();
			return false;
		
		}
		if(document.getElementById('nickChkYn').value != 'Y'){
			alert("닉네임 중복확인을 해주세요.");
			document.getElementById("mnick").focus();
			console.log(document.getElementById('nickChkYn').value);
			return false;
		}
		if(document.getElementById('year').value == null || document.getElementById('year').value == ''){
			alert("생년월일을 입력해주세요.");
			document.getElementById("year").focus();
			return false;
		
		}else if(!biRule.test(document.getElementById('year').value)){
			alert("생년은 숫자로만 입력해주세요");
			document.getElementById("year").focus();
			return false;
		}
		
		if(document.getElementById('muni').value == '학번선택' || document.getElementById('muni').value == ''){
			alert("학번을 선택해주세요.");
			document.getElementById("muni").focus();
			return false;
		
		}
		if(document.getElementById('mdept').value == '학과선택' || document.getElementById('mdept').value == ''){
			alert("학과를 선택해주세요.");
			document.getElementById("mdept").focus();
			return false;
		
		}
		alert("회원가입 완료!!");
		return true;
	}

	function execution_daum_address(){
	    
		  new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                 $(".address_input_1").val(data.zonecode);
		            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
		             $(".address_input_2").val(addr);
		            //$("[name=memberAddr2]").val(addr);            // 대체가능
	                // 커서를 상세주소 필드로 이동한다.
		             $(".address_input_3").attr("readonly",false);
		             $(".address_input_3").focus();
		 
		        }
		    }).open();    
		 
		}
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
					document.getElementById('nickChkYn').value = 'N'
					
				}else{
					span.innerHTML= " " + "사용가능한 닉네임 입니다.";
					span.style.color = "green";
					document.getElementById('nickChkYn').value = 'Y'
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
					document.getElementById('idChkYn').value = 'N'
					
				}else{
					span.innerHTML= " " + "사용가능한 아이디 입니다.";
					span.style.color = "green";
					document.getElementById('idChkYn').value = 'Y'
				}
			}
		}
		xhr.open('get','/finalproject/isMember?mid=' + mid,true);
		xhr.send();
	}

</script>

</html>
	