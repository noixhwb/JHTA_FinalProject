<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<head>
<style type="text/css">
body {display: flex;
  justify-content: center;
  align-items: center;
  min-height: 95vh; background: #4e73df;
  font-style: normal;}
.login1 {background: white;
text-align: center;
display: grid;
  padding: 4rem;
  height:460px;
  width:300px;
  border-radius: 1rem;}
   a { text-decoration: none; text-shadow: 0 0 24px; color: #4e73df; font-size: 15px;}
  /*  input:focus {outline:1px solid #4e73df;} */
   input:focus {outline:none;}


</style>
  
</head>

<body>
  <div class="login1">
  <h2 style="color: #4e73df ">캠퍼스픽 로그인</h2><br>
    <form method="post" action="${cp}/login">
      <input type="text" name="m_id" placeholder="아이디입력" required="required" style="width: 200pt; height:25pt; border-left: none; border-right: none; border-top: none;  font-size: 17px; border-color: #4e73df "/><br><br>
        <input type="password" name="m_pwd" placeholder="비밀번호입력" required="required" style="width: 200pt; height:25pt;border-left: none; border-right: none; border-top: none; font-size: 17px; border-color: #4e73df" /><br><br>
         <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
       <span style="font-size: 4px; color: red; font-weight: bold;"> ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span>
        <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
  </c:if><br>
        <button type="submit"  style="width: 205pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;">로그인</button><br>
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"><br>
        <a style="font-size: 14px;" href="${cp }/member/findIdView">아이디찾기</a> &nbsp
        <a style="font-size: 14px;" href="${cp }/member/findPwd">비밀번호찾기</a> &nbsp <br><br>
        <a style= "font-size: 16px; font-weight: bold ;" href="${cp}/join">캠퍼스픽 회원이 아니신가요?  회원가입</a>
        
    </form>
   
</div>
</body>

</html>