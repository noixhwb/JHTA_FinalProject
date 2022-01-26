<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Home</h1>
<!-- 로그아웃기능까지 완성해 보세요. -->
<ul>
	<li><a href="${cp }/join">회원가입</a></li>
	<sec:authorize access="isAnonymous()">
		<li><a href="${cp }/login">로그인</a></li>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<li>
		<sec:authentication property="principal.username"/>님 반갑습니다.
		<a href="${cp }/logout">로그아웃</a>
		</li>
	</sec:authorize>
	
	<li><a href="${cp }/member/main">main(member)</a></li>
	<li><a href="${cp }/admin/main">main(admin)</a></li>
</ul>
</body>
</html>