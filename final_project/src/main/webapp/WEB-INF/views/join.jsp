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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<h1>회원가입</h1>
<div class="form">
<form method="post" action="${pageContext.request.contextPath }/join">
	
	회원아이디<br>
	<div class="id_input">
		<input type="text" name="m_id"><br>
	</div>
	<span class="id_input1">사용가능한 아이디입니다</span>
	<span class="id_input2">존재하는 아이디입니다</span>
	비밀번호<br>
	<input type="password" name="m_pwd"><br>
	이름<br>
	<input type="text" name="m_name"><br>
	연락처<br>
	<input type="text" name="m_phone"><br>
	이메일<br>
	<input type="text" name="m_email"><br>
	주소<br>
	<input type="text" name="m_address"><br>
	닉네임<br>
	<input type="text" name="m_nickname"><br>
	생년월일<br>
	<input type="text" name="m_birth" placeholder="1000-01-01"><br>
	
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
</html>
	