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
  
} 

</style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ include file="/WEB-INF/views/top.jsp" %>
<body>
<div></div>
<br><br><br><br>
<div class="div1">
<form onsubmit="return joinSubmit();" method="post" action="${pageContext.request.contextPath }/member/deptchange">
<h2>학과 변경</h2><br>
<input type="hidden" name="m_num" value="${vo.m_num}">
<select  name="m_dept" id="mdept" 
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
			</select> <br><br> <input type="submit" value="학과변경" style="width: 200pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;"> 
			 <br><br><a style= "font-size: 16px; font-weight: bold ;" href="${cp}/member/mymember">뒤로가기</a>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			</form>
			</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>