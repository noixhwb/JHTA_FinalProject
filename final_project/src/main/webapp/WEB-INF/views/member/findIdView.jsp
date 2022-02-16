<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	 <div class="findid1">
	<h2 style="color: #4e73df ">회원아이디 찾기</h2><br>
	 	<input type="text" id="memail" name="m_email"  placeholder="이메일입력" style="width: 200pt; height:25pt; border-left: none; border-right: none; border-top: none;  font-size: 17px; border-color: #4e73df "><br><br>
		<input type="submit" value="찾기" onclick="findidchk()" style="width: 205pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;"> <br><br>
		<span id="mailchk" style="font-size: 15px;"></span>
		
		<br><br>
			<a style="font-size: 14px;" href="${cp }/home">홈으로</a> &nbsp
			<a style="font-size: 14px;" href="${cp }/login">로그인</a> &nbsp
		 <a style="font-size: 14px;" href="${cp }/member/findpwd">비밀번호찾기</a>

	</div>

  </body>
  <script type="text/javascript">
	/* 
	function findidchk(){
		let memail=document.getElementById("memail").value;
		if(memail=='') return;
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let json=JSON.parse(data);
				let span=document.getElementById("mailchk");
				if(json.using==true){
					span.innerHTML= " " + "사용중인 아이디입니다." ;
					span.style.color = "red";
					
				}else{
					span.innerHTML= " " + "사용가능한 아이디 입니다.";
					span.style.color = "green";
				}
			}
		}
		xhr.open('get','/finalproject/member/isId?memail=' + memail,true);
		xhr.send();
	} */
	function findidchk(){
		let memail=document.getElementById("memail").value;
		if(memail=='') return;
		let xhr=new XMLHttpRequest();
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				let data=xhr.responseText;
				let json=JSON.parse(data);
				let span=document.getElementById("mailchk");
				if(json.using==true){
					span.innerHTML= " " + "회원님의아이디는 : " + json.m_id  + " " +"입니다";
					span.style.color = "green";
					
				}else{
					span.innerHTML= " " + "등록되지않은 이메일입니다";
					span.style.color = "red";
				}
			}
		}
		xhr.open('get','/finalproject/member/isId?memail=' + memail,true);
		xhr.send();
	}
</script>
</html>