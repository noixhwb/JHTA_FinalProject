<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
</head>
<body>
<h1>시간표</h1>
<table border="1">
	<tr>
		<th>시간</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
	</tr>
	<tr>
		<td>09시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>10시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>11시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>12시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>13시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>14시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>15시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>16시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>17시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>18시</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
<div>
	<h1>강의정보</h1>
	<input type="text" id="keyword">
	<input type="button" value="검색" id="btn1">
	<div id="searchResult"></div>
</div>
<script type="text/javascript">
	$(function() {
		$("#btn1").click(function() {
			$.ajax({
				url:'/table/subject?'+$("#keyword").value(),
				method:'post',
				dataType:'json',
				success:function(data) {
					if(data.list!=null) {
						for()
						let m="회원아이디:"+data.id+"<br>"+
								"이름:"+data.name+"<br>"+
								"나이:"+data.age+"<br>";
								$("#searchResult").html(m);
					}
				}
			});
		});
	});
</script>
</body>
</html>