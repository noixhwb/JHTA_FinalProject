<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
#showDday {
	float: left;
	margin-right: 4px;
	padding: 0 8px;
	line-height: 20px;
	border-radius: 10px;
	color: #fff;
	font-size: 12px;
	font-weight: bold;
	background-color: #1dcdff;
}

.card_focus {
	cursor: pointer;
}
</style>

<!-- Main Content -->
<div id="content">

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Content Row -->
		<div class="row">
			<!-- Content Column -->
			<div class="col-lg-6 mb-4">
				<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3 card_focus" onclick="location.href='${ cp }/community/communityList';">
						<h6 class="m-0 font-weight-bold text-primary">커뮤니티 랭킹</h6>
					</div>
					<div class="card-body">
						<c:forEach var="vo" items="${communitylist }" varStatus="status">
								<div class="card mb-3 card_focus" style="max-width: 600px;"
								onclick="location.href='${ cp }/home';">
									<div class="row g-0">
										<div class="col-md-4">
											<img src="${cp }/resources/upload/001.jpg"
												class="img-fluid rounded-start" alt="..."
												style="max-width: 200px;">
										</div>
										<div class="col-md-8">
											<div class="card-body">
												<h5 class="card-title">${vo.cu_name }</h5>
												<p class="card-text">
													<i class="fa-solid fa-heart" id="heartt"
														style="color: palevioletred;"></i> ${vo.cu_recommend }&nbsp;ㅣ&nbsp;${vo.cu_category }
												</p>
												<p class="card-text">
													<small class="text-muted">${vo.cu_intro }</small>
												</p>
											</div>
										</div>
									</div>
								</div>
						</c:forEach>
					</div>
				</div>
			</div>


			<!-- Content Column -->
			<div class="col-lg-6 mb-4">
				<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3 card_focus" onclick="location.href='${ cp }/circle/CircleList';">
						<h6 class="m-0 font-weight-bold text-primary">새로 모집하는 동아리</h6>
					</div>
					<div class="card-body">
						<c:forEach var="vo" items="${circlelist }" varStatus="status">
							<div class="card mb-3 card_focus" style="max-width: 600px;"
							 onclick="location.href='${ cp }/circle/CircleDetail?ci_num=${ vo.ci_num }';">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="${cp}/resources/images/circle/${vo.ci_logofile }"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 200px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">${vo.ci_name }</h5>
											<p class="card-text">
												<i class="fa-solid fa-heart" id="heartt"
													style="color: palevioletred;"></i> ${vo.ci_recommend }&nbsp;ㅣ&nbsp;${vo.ci_category }
											</p>
											<p class="card-text">${vo.ci_title }</p>
											<p class="card-text">
												<small class="text-muted">${vo.ci_startdate } 모집시작</small>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Content Column -->
			<div class="col-lg-6 mb-4">
				<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3 card_focus" onclick="location.href='${ cp }/deal/deallist';">
						<h6 class="m-0 font-weight-bold text-primary">거래장터 최신 물품</h6>
					</div>
					<div class="card-body">
						<div class="card mb-3" style="max-width: 600px;">
							<div class="row g-0">
								<c:forEach var="vo" items="${deallist }" varStatus="status">
										<div class="col-md-6 card_focus" onclick="location.href='${cp}/deal/dealdetail?t_num=${vo.t_num}';">
											<div class="card-body">
												<img
													src="${cp}/resources/goodsimg/${dealimglist.get(status.index).gi_filename}"
													class="img-rounded" style="max-width: 200px;">
												<h5 class="card-title">${vo.t_title }</h5>
											</div>
										</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Content Column -->
			<div class="col-lg-6 mb-4">
				<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3 card_focus" onclick="location.href='${ cp }/job/jobList';">
						<h6 class="m-0 font-weight-bold text-primary">취업정보 마감일 순</h6>
					</div>
					<div class="card-body">
						<c:forEach var="vo" items="${jobinfolist }" varStatus="status">
							<div class="card mb-3 card_focus" style="max-width: 600px;" onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="${cp }/resources/upload/001.jpg"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 200px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">${vo.j_company }</h5>
											<p class="card-text">${vo.j_subject }</p>
											<p class="card-text">
												${vo.j_enddate } &nbsp;
												<!-- 현재날짜 -->
												<c:set var="today" value="<%=new java.util.Date()%>" />
												<c:set var="end" value="${vo.j_enddate}" />
												<!-- Date format 'yyyy/MM/dd' -->
												<c:set var="date">
													<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />
												</c:set>
												<c:set var="enddate">
													<fmt:formatDate value="${end}" pattern="yyyy-MM-dd" />
												</c:set>

												<!-- String >> Date 형 변환 -->
												<fmt:parseDate var="endPlanDate" value="${enddate }"
													pattern="yyyy-MM-dd" />

												<!-- 숫자로 변환 -->
												<fmt:parseNumber var="today"
													value="${today.time / (1000*60*60*24)}" integerOnly="true" />
												<fmt:parseNumber var="endTime"
													value="${endPlanDate.time / (1000*60*60*24)}"
													integerOnly="true" />
												<c:if test="${endTime eq today }">
													<span id="showDday">D -DAY</span>
												</c:if>
												<c:if test="${today gt endTime }">
													<span>마감</span>
												</c:if>
												<c:if test="${today lt endTime }">
													<span id="showDday">D -${endTime - today }</span>
												</c:if>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->


<%@ include file="/WEB-INF/views/footer.jsp"%>