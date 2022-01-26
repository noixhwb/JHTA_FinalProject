<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<h1>로그인</h1>
<form method="post" action="${cp}/login">
	회원아이디<br>
	<input type="text" name="m_id"><br>
	회원비밀번호<br>
	<input type="password" name="m_pwd"><br>
	<input type="submit" value="로그인">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>