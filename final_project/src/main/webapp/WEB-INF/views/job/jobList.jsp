<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<script type="text/javascript">
	$( function() {
	    $("#tabs").tabs();
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
							class="form-control bg-white border-secondary small"
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
			<!-- 검색값이 있을경우 생기게끔ㅎ ㅐ야한다 -->
			<div class="result hidden">
				<span>'<span></span>' 검색 결과     </span><a class="reset">초기화</a>
			</div>
			<a class="" href="{cp}/job/jobList" data-toggle="modal"
						data-target="#searchfilter"> <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						검색 필터
			</a>
			<!-- --------------------------- -->
			<!-- Logout Modal-->
		    <div class="modal fade" id="searchfilter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
		        aria-hidden="true">
		        <div class="modal-dialog" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="exampleModalLabel">검색 필터</h5>
		                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">×</span>
		                    </button>
		                </div>
		                <div class="modal-body">
		                	<h6>직무</h6>
		                	<fieldset style="width:400px">
								<c:forEach items="${fn:split('영업·영업관리|전략·기획|마케팅·광고·홍보|회계·재무|인사·노무|유통·물류|IT·SW|연구개발·설계|생산·생산관리|건축·인테리어|토목·환경|의료·보건|교육|미디어|디자인|기타','|') }"
											var="duty">
									<label><input type="checkbox" name="jd_duty" value="${duty }" >${duty }</label>
								</c:forEach><br>
							</fieldset>
		                </div>
		                <div class="modal-body">
		                	<h6>지역</h6>
		                	<fieldset style="width:400px">
								<c:forEach items="${fn:split('서울|경기|광주|대구|대전|부산|세종|울산|인천|강원|경남|경북|전남|전북|충남|충북|제주|해외|기타','|') }"
											var="zone">
									<label><input type="checkbox" name="jd_zone" value="${zone }" >${zone }</label>
								</c:forEach><br>
							</fieldset>
		                </div>
		                <div class="modal-body">
		                	<h6>경력</h6>
		                	<fieldset style="width:400px">
								<c:forEach items="${fn:split('신입|경력','|') }" var="career">
									<label><input type="checkbox" name="jd_duty" value="${career }" >${career }</label>
								</c:forEach><br>
							</fieldset>
		                </div>
		                <div class="modal-footer">
		                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
		                    <a class="btn btn-primary" href="jobList?jd_duty=${jd_duty }&jd_zone=${jd_zone}&jd_career=${jd_career}">적용하기</a>
		                </div>
		            </div>
		        </div>
		    </div>

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