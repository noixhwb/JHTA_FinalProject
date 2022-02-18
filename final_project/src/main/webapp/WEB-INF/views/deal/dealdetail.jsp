<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div id="content">
	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">상품세부</h1>
		</div>




		<div>
			<div class="card shadow" style="">
				<div class="card-header py-3">
						<span>${dealvo.t_title }</span>
				</div>

				<div class="card-body">
					<div class="row">
						<div id="carouselExampleControls" class="carousel slide"
							style="width: 400px; height: 500px; margin-right: 50px;"
							data-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="img" items="${imglist}" varStatus="status">
									<c:choose>
										<c:when test="${status.index eq 0}">
											<div class="carousel-item active">
												<img class="d-block w-100"
													src="${pageContext.request.contextPath }/resources/goodsimg/${img.gi_filename}"
													style="height: 500px;">
											</div>
										</c:when>
										<c:otherwise>
											<div class="carousel-item">
												<img class="d-block w-100"
													src="${pageContext.request.contextPath }/resources/goodsimg/${img.gi_filename}"
													style="height: 500px;">
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleControls"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleControls"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
						<!-- 폼폼폼포모폼포모포 -->
						<div>
							<form action="${pageContext.request.contextPath }/deal/dealpurchase">
								<div class="form-group">
									<label for="exampleFormControlInput1">상품명</label> <input
										type="text" class="form-control" id="title" value="${dealvo.t_name }" readonly="readonly">
								</div>
								<div class="form-group">
									<label for="exampleFormControlInput1">상품가격</label> <input
										type="text" class="form-control" id="price" value="${dealvo.t_price }원" readonly="readonly">
								</div>

								<div class="form-group">
									<label for="exampleFormControlTextarea1">상품설명</label>
									<textarea class="form-control" id="exampleFormControlTextarea1" readonly="readonly"
										rows="3">${dealvo.t_explanation }</textarea>
								</div>
								<input type="hidden" name="t_num" value="${dealvo.t_num}">
								<span>판매자 ${membervo.m_email } ${membervo.m_phone }</span><br>
								<span>본인인증완료</span><br><br><br><br>
								<input type="submit" value="결제하기" id="sub">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp"%>
<script type="text/javascript">
	$(function() {
		// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
		$('#carousel-example-generic').carousel({
			// 슬리아딩 자동 순환 지연 시간
			// false면 자동 순환하지 않는다.
			interval : 1000,
			// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
			pause : "hover",
			// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
			wrap : true,
			// 키보드 이벤트 설정 여부(?)
			keyboard : true
		});
	});

	// 조건에 따라서 a태그 값을 변환을 주고 비활성화
	if ("${dealvo.t_processing}" != "판매중") {

		$("#sub").val("상품준비중");
		$("#sub").click(function() {
			return false;
		})
	}
</script>