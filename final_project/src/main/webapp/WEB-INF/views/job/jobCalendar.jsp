<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>
/* body 스타일 */
html, body {
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
</style>

<%@ include file="/WEB-INF/views/header.jsp"%>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">

		<!-- Topbar -->
		<nav
			class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
			<h4>3조대학교 캠퍼스픽</h4>


			<!-- Sidebar Toggle (Topbar) -->
			<button id="sidebarToggleTop"
				class="btn btn-link d-md-none rounded-circle mr-3">
				<i class="fa fa-bars"></i>
			</button>

			<!-- Topbar Search -->
			<!-- 
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text" class="form-control bg-light border-0 small"
					   placeholder="Search for..." aria-label="Search"
				       aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>
	 -->

			<!-- Topbar Navbar -->
			<ul class="navbar-nav ml-auto">

				<div class="topbar-divider d-none d-sm-block"></div>

				<!-- Nav Item - User Information -->
				<li class="nav-item dropdown no-arrow"><a
					class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span
						class="mr-2 d-none d-lg-inline text-gray-600 small">홍길동님</span> <img
						class="img-profile rounded-circle"
						src="${ pageContext.request.contextPath }/resources/img/undraw_profile.svg">
				</a> <!-- Dropdown - User Information -->
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="#"> <i
							class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
						</a> <a class="dropdown-item" href="#"> <i
							class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 수정
						</a> <a class="dropdown-item" href="#"> <i
							class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 활동기록
						</a>

						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#logoutModal"> <i
							class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
							로그아웃
						</a>
					</div></li>

			</ul>

		</nav>
		<!-- End of Topbar -->

		<!-- ---------------------------------------------------------------------------------------------------------------------- -->
		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">채용 달력</h1>
			</div>
			<!-- Approach -->

			<!-- calendar 태그 -->
			<div id='calendar' style="width: 80%;"></div>
		</div>
	</div>
</div>
<script>
	// j_num, j_company, j_startdate, j_enddate, j_url
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth',
			expandRows : true,
			navLinks : true,
			dayMaxEvents : true,
			locale : 'ko',
			eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
				console.log(obj);
			},
			eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
				console.log(obj);
			},
			eventRemove : function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
				console.log(obj);
			},
			events: [
			    {
			      title  : 'event1',
			      start  : '2010-01-01'
			    },
			    {
			      title  : 'event2',
			      start  : '2010-01-05',
			      end    : '2010-01-07'
			    },
			    {
			      title  : 'event3',
			      start  : '2010-01-09T12:30:00',
			      allDay : false // will make the time show
			    }
			  ]
		});
		calendar.render();
	});
	$.ajax({
		url: '/job/cal',
		type: 'POST',
		success: function(res){
			var list = res;
			console.log(list);
			
			
 			var calendarEl = document.getElementById('calendar');
			
			var events = list.map(function(item) {
				return {
					title : item.reservationTitle,
					start : item.reservationDate + "T" + item.reservationTime
				}
			});
			
			var calendar = new FullCalendar.Calendar(calendarEl, {
				events : events,
				eventTimeFormat: { // like '14:30:00'
				    hour: '2-digit',
				    minute: '2-digit',
				    hour12: false
				  }
			});
			calendar.render();
		},
	});
		  
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>