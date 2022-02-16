<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<div id="content">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">

				<div style="width: 300px; margin: 100px;">
					<div id="carousel-example-generic" class="carousel slide">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						</ol>
						<div class="carousel-inner" role="listbox">
							<div class="item active">
								<img
									src="https://tistory2.daumcdn.net/tistory/1041549/skin/images/nowonbuntistory.png"
									style="width: 100%;">
								<div class="carousel-caption" style="color: black;">aaaaaa</div>

							</div>
							<div class="item">
								<img src="https://www.nowonbun.com/img/nowonbuntistory1.png"
									style="width: 100%;">
								<div class="carousel-caption" style="color: black;">bbbbbbbbb</div>
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <!-- 왼쪽 화살표 --> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" role="button" data-slide="next">
							<!-- 오른쪽 화살표 --> <span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span>
						</a>
					</div>
				</div>

			</div>
			<div class="col-lg-6">
				<span>${dealvo.t_name}</span><br> <span>${dealvo.t_price}</span><br>
				<span>${membervo.m_phone}</span><br> <span>${dealvo.t_explanation}</span><br>
				<a
					href="${pageContext.request.contextPath }/deal/dealpurchase?t_num=${dealvo.t_num}&m_id=${dealvo.m_id}"
					id="check_processing">구매하기</a>
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

		$("#check_processing").text("상품준비중");
		$("#check_processing").click(function() {
			return false;
		})
	}
</script>