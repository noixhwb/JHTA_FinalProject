<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 .div1 {
  height: 800px;
  
 text-align: center;"
  
} 
.a1 {text-decoration: none; text-shadow: 0 0 24px; color: #4e73df; font-size: 15px;}
</style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<body>
<div></div>
<br><br><br><br>
<div class="div1">
	<form method="post" action="${cp }/member/pwdupdate" >
	<h2>비밀번호 변경</h2><br>
	<input type="hidden" name="m_id" value="${vo.m_id }">
<input type="password" name="m_pwd" id="pw1" onchange="check_pw()"  placeholder="비밀번호입력" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br><br>
		
		<input type="password" name="passcheck" id="pw2" onchange="check_pw()" placeholder="비밀번호확인" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "> <br>
		<span style="text-align: center; font-size: 3px;" id="check"></span><br>
<input type="submit" value="비밀번호 변경" style="width: 200pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;"> 
			 <br><br><a style= "font-size: 16px; font-weight: bold ;" href="${cp}/member/mymember">뒤로가기</a>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			</form>
			
			</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>

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
</html>