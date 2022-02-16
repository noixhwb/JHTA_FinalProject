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
 position: relative; left: 380px; top: 65px;"
  
} 
.a1 {text-decoration: none; text-shadow: 0 0 24px; color: #4e73df; font-size: 15px;}
</style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<body>
	<form method="post" action="${cp }/member/pwdupdate" >
	<input type="hidden" name="m_id" value="${vo.m_id }">
<input type="password" name="m_pwd" id="pw1" onchange="check_pw()"  placeholder="비밀번호입력" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br><br>
		
		<input type="password" name="passcheck" id="pw2" onchange="check_pw()" placeholder="비밀번호확인" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "> <br>
		<span style="text-align: center; font-size: 3px;" id="check"></span><br>
<input type="submit" value="비밀번호 변경" style="width: 230pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;"> 
			 <br><br><a style= "font-size: 16px; font-weight: bold ;" href="${cp}/home">홈으로</a>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			</form>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>