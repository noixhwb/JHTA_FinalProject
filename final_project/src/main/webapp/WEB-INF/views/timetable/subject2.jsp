<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath }" />
	<h1>강의평가</h1>

	<div>
		<h2>강의찾기</h2>
		<form action="${cp}/table/subjectList" method="get">
			<input type="text" name="keyword"> <input type="submit"
				value="검색">
		</form>
		<div id="subListBox">
			<c:if test="${!empty list }">
				<table border="1" width="500">
					<tr>
						<th>과목번호</th>
						<th>과목명</th>
						<th>교수명</th>
						<th>구분</th>
						<th>학점</th>
						<th>강의평가보기</th>
					</tr>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.s_num }</td>
							<td>${vo.s_name }</td>
							<td>${vo.s_prof }</td>
							<td>${vo.s_category }</td>
							<td>${vo.s_score }</td>
							<td><a onclick="rateClick(${vo.s_num });">강의평가</a></td>
						</tr>
					</c:forEach>
				</table>
				<div>
					<c:forEach var="i" begin="${pu.startPageNum }"
						end="${pu.endPageNum }">
						<c:choose>
							<c:when test="${i==param.pageNum }">
								<a href="${cp }/board/list?pageNum=${i}&keyword=${keyword}"><span
									style="color: blue">${i }</span></a>
							</c:when>
							<c:otherwise>
								<a href="${cp }/board/list?pageNum=${i}&keyword=${keyword}"><span
									style="color: gray">${i }</span></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</c:if>
		</div>
		<div id="rateListBox">
		</div>
	</div>

	<script type="text/javascript">
	
	
		function rateClick(s_num) {
				$.ajax({
					url:'${cp}/table/rateList',
					data:{"s_num":s_num},
            		type: 'GET',
					dataType:'json',
					success:function(data) {
						$(data.list).each(function(i,vo) {
							let m_num=vo.m_num;
							let sr_content=vo.sr_content;
							let sr_regdate=vo.sr_regdate;
							let sr_recommend=vo.sr_recommend;
							let html="<div class='ratebox' id='ratebox"+i+"'>" ;
							html += "별점:" + sr_recommend +"<br>" ;
							html += "내용:" + sr_content +"<br>" ;
							html += "작성자:" + m_num +"<br>" ;
							html += "작성일:" + sr_regdate +"<br>" ;
							$("#rateListBox").append(html);
						});
					}
				});
		}
						
						
						
		/* let startPage=data.startPageNum;
		let endPage=data.endPageNum;
		let pageCount=data.pageCount;
		let pageHTML="";
		if(startPage>5) {
			pageHTML +="<a href='javascript:list("+ (startPage-1) + ")'>[이전]</a>";
		}
		for(let i=startPage;i<=endPage;i++){
			if(i==pageNum){
				pageHTML +="<a href='javascript:list("+ i + ")'><span style='color:blue'>["+ i +"]</span></a>";
			}else{
				pageHTML +="<a href='javascript:list("+ i + ")'><span style='color:gray'>["+ i +"]</span></a>";
			}
		}
		if(endPage<pageCount) {
			pageHTML +="<a href='javascript:list("+ (endPage+1) + ")'>[다음]</a>";
		}
		$("#page").html(pageHTML); 
		}
		});
		});*/

		
	</script>
</body>
</html>