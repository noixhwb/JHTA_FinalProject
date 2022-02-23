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
</style>
<style type="text/css">

 
</style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<body>
<div></div>
<br><br><br><br>
<div class="div1">
<form onsubmit="return joinSubmit();" method="post" action="${pageContext.request.contextPath }/member/nickchange">
<h2>닉네임변경</h2><br>
<input type="hidden" name="m_num" value="${vo.m_num}">

<input type="text" name="m_nickname" id="mnick"value="${vo.m_nickname}"  
				style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "> <input type="button"
				value="중복확인" onclick="nickcheck()" style="width: 65pt; height:24pt; background-color: white;color: #4e73df; border: 1px solid #4e73df;
		border-radius: 4px; font-size: 14px; position: absolute;  cursor: pointer; font-weight: 900;"> <br>
			<span id="nickcheck"   style="text-align: center; font-size: 3px; display: inline;"></span>	<input type="hidden" id="nickChkYn" value='N'> <br> 
		<input type="submit" value="닉네임변경" style="width: 210pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;"> 
			 <br><br><a style= "font-size: 16px; font-weight: bold ;" href="${cp}/member/mymember">뒤로가기</a>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</div>


</body>
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
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>