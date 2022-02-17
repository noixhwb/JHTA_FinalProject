<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

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
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">커뮤니티 랭킹</h6>
					</div>
					<div class="card-body">
						<c:forEach var="vo" items="${communitylist }" varStatus="status">
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="${cp}/resources/img/undraw_profile.svg"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 50px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">${vo.cu_name }</h5>
											<p class="card-text">${vo.cu_recommend }&nbsp;${vo.cu_category }</p>
											<p class="card-text">${vo.cu_intro }</p>
											<p class="card-text">
												<small class="text-muted">${vo.cu_notice }</small>
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
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">새로 모집하는 동아리</h6>
					</div>
					<div class="card-body">
						<c:forEach var="vo" items="${circlelist }" varStatus="status">
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="${cp}/resources/images/circle/${vo.ci_logofile }"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 50px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">${vo.ci_name }</h5>
											<p class="card-text">${vo.ci_recommend }&nbsp;${vo.ci_category }</p>
											<p class="card-text">${vo.ci_title }</p>
											<p class="card-text">
												<small class="text-muted">${vo.ci_startdate }</small>
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
				<%-- <div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">거래장터 최신 물품</h6>
					</div>
					<div class="card-body">
						<c:forEach var="vo" items="${deallist }" varStatus="status">
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="${cp}/resources/goodsimg/${dealimglist.get(status.index).GI_FILENAME}" 
										class="img-rounded"  style="max-width: 10px;">
										<img src="${cp}/resources/img/undraw_profile.svg"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 50px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">${vo.t_title }</h5>
											<p class="card-text">${vo.t_name }&nbsp;${vo.t_price }</p>
											<p class="card-text">${vo.t_explanation }</p>
											<p class="card-text">
												<small class="text-muted">${vo.t_regdate }</small>
											</p>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div> --%>
			</div>
			<!-- Content Column -->
			<div class="col-lg-6 mb-4">
				<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">취업정보 마감일 순</h6>
					</div>
					<div class="card-body">
						<c:forEach var="vo" items="${jobinfolist }" varStatus="status">
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row g-0">
									<div class="col-md-4">
										<img src="${cp}/resources/img/undraw_profile.svg"
											class="img-fluid rounded-start" alt="..."
											style="max-width: 50px;">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title">${vo.j_company }</h5>
											<p class="card-text">${vo.j_view }</p>
											<p class="card-text">${vo.j_subject }</p>
											<p class="card-text">
												<small class="text-muted">${vo.j_enddate }</small>
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