<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<form:form method="post" action="${pageContext.request.contextPath }/updateUser" name="uj" onsubmit="return check();">
	아이디 <br>
	<input type="text" name="m_id" id="m_id" maxlength="13" value="${vo.m_id }" readonly="readonly"><br>
	닉네임 <br>
	<input type="text" name="m_id" id="m_id" maxlength="13" value="${vo.m_nickname }" readonly="readonly"><br>
	주소 <br>
	<input type="text" name="m_id" id="m_id" maxlength="13" value="${vo.m_address }" readonly="readonly"><br>
	학과 <br>
	<input type="text" name="m_id" id="m_id" maxlength="13" value="${vo.m_dept }" readonly="readonly"><br>
	학번 <br>
	<input type="text" name="m_id" id="m_id" maxlength="13" value="${vo.m_univnum }" readonly="readonly"><br>
	
	
</form:form>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>