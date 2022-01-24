<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<form method="post" action="${pageContext.request.contextPath }/member/join">
	회원아이디<br>
	<input type="text" name="mid"><br>
	비밀번호<br>
	<input type="password" name="mpwd"><br>
	이름<br>
	<input type="text" name="mname"><br>
	연락처<br>
	<input type="text" name="mphone"><br>
	이메일<br>
	<input type="text" name="memail"><br>
	주소<br>
	<input type="text" name="maddress"><br>
	닉네임<br>
	<input type="text" name="mnickname"><br>
	생년월일<br>
	<input type="text" name="mbirth"><br>
	학과<br>
	<input type="text" name="mdept"><br>
	학번<br>
	<input type="text" name="munivnum"><br>
	<input type="submit" value="가입">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</body>
</html>