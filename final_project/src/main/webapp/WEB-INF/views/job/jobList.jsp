<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script>
	$(document).ready(function() {
		$("#filterr").click(function() {
			alert("ㅎ");
		});
	});

</script>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- ---------------------------------------------------------------------------------------------------------------------- -->

		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">채용 공고</h1>
				<form method="post" action="${cp }/job/jobList"
					class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
						<input type="text" name="keyword"
							class="form-control bg-light border-0 small"
							placeholder="찾으시는 기업이 있나요?" aria-label="Search"
							value="${keyword }" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }">
				</form>
			</div>
			<!--			<a href="#" id="filterr">
				<span>직무:</span>
				<span>전체</span>
			</a>	 -->
			<input type="button" value="직무" id="filterr"> 
			<a href="#" id="filterr"> 
				<span>지역:</span> 
				<span>전체</span>
			</a> 
			<a href="#" id="filterr"> 
				<span>경력:</span> 
				<span>전체</span>
			</a>

		</div>
		<table border="1" width="1000px">
			<tr>
				<th>공고번호</th>
				<th>회사명</th>
				<th>공고제목</th>
				<th>채용시작일</th>
				<th>채용마감일</th>
				<th>조회수</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.j_num }</td>
					<td>${vo.j_company }</td>
					<td><a href="${cp}/job/detail?j_num=${vo.j_num}">${vo.j_subject }</a></td>
					<td>${vo.j_startdate}</td>
					<td>${vo.j_enddate }</td>
					<td>${vo.j_view }</td>
					<td><a href="${cp }/job/delete?j_num=${vo.j_num }">삭제</a></td>
					<td><a href="${cp }/job/update?j_num=${vo.j_num }">수정</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<!-- 페이징처리 -->
<div>
	<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
		<c:choose>
			<c:when test="${i==param.pageNum }">
				<a href="${cp }/job/jobList?pageNum=${i}&keyword=${keyword}"><span
					style="color: blue">${i }</span></a>
			</c:when>
			<c:otherwise>
				<a href="${cp }/job/jobList?pageNum=${i}&keyword=${keyword}"><span
					style="color: gray">${i }</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>