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
<div class="div1">
<div class="container">
     <!--  <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 "> -->
       <br>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
    <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">${vo.m_id }님의 프로필 정보</h3>
            </div>
            <div class="panel-body">
              <div class="row">
              <div class="col-md-3 col-lg-3 " > 
              <img alt="User Picture" src="${cp}/resources/images/circle/${vo.m_profile}" 
              class="img-circle img-responsive" style="width: 150px;"> 
              </div>
 
                <div class=" col-md-9 col-lg-9 "> 
                <input type="hidden" id="mnum" name="m_num" value="${vo.m_num}">
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>닉네임:</td>
                        <td>${vo.m_nickname}</td>
                      </tr>  
                      <tr>
                        <td>휴대폰번호:</td>
                        <td>${vo.m_phone}</td>
                      </tr>                    
                      <tr>
                        <td>학번:</td>
                        <td>${vo.m_univnum }</td>
                      </tr>
                   
                         <tr>
                             <tr>
                      </tr>
                        <tr>
                        <td>학과:</td>
                        <td>${vo.m_dept}</td>
                      </tr>
                      <tr>
                        <td>주소:</td>
                        <td>${vo.m_address}</td>
                           
                      </tr>
                      <tr>
                        <td>이메일:</td>
                        <td><a href="mailto:info@support.com">${vo.m_email}</a></td>
                      </tr>
                      
                     
                    </tbody>
                  </table>
                  <br><br><br>
                  <a class="a1" href="${cp }/member/mymembernick"> 닉네임 변경</a> &nbsp&nbsp
                   <a class="a1" href="${cp }/member/mymemberdept"> 학과 변경</a> &nbsp&nbsp
                   <a class="a1" href="${cp }/member/updateaddress"> 주소 변경</a> &nbsp&nbsp
                   <a class="a1" href="${cp }/member/mymemberpwd"> 비밀번호 변경</a> &nbsp&nbsp
                    <a class="a1" href="${cp }/member/mymemberprofile"> 프로필 사진 변경</a> 
                  
                </div>
              </div>
            </div>
</div>
</div>
</div>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>