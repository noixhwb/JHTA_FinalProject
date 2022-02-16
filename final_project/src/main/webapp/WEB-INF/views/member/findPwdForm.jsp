<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

    body {display: flex;
  justify-content: center;
  align-items: center;
  min-height: 90vh; background: #4e73df;
  font-style: normal;}
.findid1 {background: white;
text-align: center;

  padding: 4rem;
  border-radius: 1rem;}
   a { text-decoration: none; text-shadow: 0 0 24px; color: #4e73df; font-size: 15px;}
   input:focus {outline:none;}
</style>


</head>
<body>
<script type="text/javascript">

</script>
<div class="findid1">
<h2 style="color: #4e73df ">회원비밀번호 찾기</h2><br>
 <form:form method="post" action="${pageContext.request.contextPath }/member/findPwd">
	<br>
	<input type="text" name="m_id"  placeholder="아이디 입력"   style="width: 200pt; height:25pt; border-left: none; border-right: none; border-top: none;  font-size: 17px; border-color: #4e73df "><br>
	<br>
	<input type="text" name="m_email" placeholder="이메일 입력"  style="width: 200pt; height:25pt; border-left: none; border-right: none; border-top: none;  font-size: 17px; border-color: #4e73df "><br>	
	<br><span style="color: red; font-size: 14px;"> ${resultMsg} </span><br><br>
	<input type="submit" value="비밀번호 찾기" style="width: 205pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;">
	<br><br><a style= "font-size: 16px; font-weight: bold ;" href="${cp}/home">홈으로</a>
</form:form>
</div>
 

















<%-- <form method="post" class="form-signin" action="${cp }/member/findpwd" name="findform">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
<div class="form-label-group">
			<input type="text" id="id" name="m_id" class="form-control"/>
			<label for="id">ID</label>
		</div>
		
		<div class="form-label-group">
			<input type="text" id="name" name="m_email" class="form-control"/>
			<label for="name">email</label>
		</div>
		
		

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase"
				type="submit" value="check">
		</div>

		<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.id.value = "";
				opener.document.findform.name.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 이메일이 확인될때 -->
		<c:if test="${check == 0 }">
		<div>
			<label>비밀번호를 변경해주세요.</label>
		</div>
		<div class="form-label-group">
		<input type="hidden" id="id" name="updateid" value="${updateid }">
		
			<input type="password" id="password" name="m_pwd" class="form-control"/>
			<label for="password">password</label>
		</div>
		
		<div class="form-label-group">
			<input type="password" id="confirmpassword" name="confirmpwd" class="form-control"/>
			<label for="confirmpassword">confirm password</label>
		</div>
		
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="update password" onclick="updatePassword()">
			</div>
		</c:if>

	</form>
	
	<script type="text/javascript">
		function updatePassword(){
			if(document.findform.m_pwd.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findform.m_pwd.focus();
			} else if(document.findform.m_pwd.value != document.findform.confirmpwd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findform.confirmpwd.focus();
			} else {
				document.findform.action="update_password";
				document.findform.submit();
			}
		}
	</script> --%>
</body>
</html>