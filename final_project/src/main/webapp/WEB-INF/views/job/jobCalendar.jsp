<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.jhta.finalproject.jobvo.JobVo"%>

<!-- jquery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- ful	lcalendar 언어 CDN -->
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

.chips {
	list-style: none;
	width: 13px;
	height: 9px;
	margin: 4px 2px 2px 0px;
	border: 1px solid #ddd;
}
</style>

<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">


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
			<div>
				<ul>
					<li style="background-color: #1cc88a" class="chips">시작</li>
					<li style="background-color: #e74a3b" class="chips">마감</li>
				</ul>
			</div>
			<!-- Approach -->

			<!-- calendar 태그 -->
			<div id='calendar' style="width: 75%;"></div>
			<div id="calendarModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h6 class="modal-title" id="modalTitle">클릭하면 날짜받아서 select하는법
								모르겠다.</h6>
							<button class="close" type="button" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div id="modalBody" class="modal-body" style="cursor: pointer;"
							onclick="location.href='${cp}/job/detail?j_num=${vo.j_num}';">
							<ul style="list-style: none; padding-left: 0;">
								<li>기업명 :</li>
								<li>공고제목 :</li>
								<li>디데이 :</li>
								<li>조회수 :</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// j_num, j_company, j_startdate, j_enddate, j_url
	document.addEventListener('DOMContentLoaded', function() {
	
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth',
		locale : 'ko', // 한국어 설정
		// 이벤트 클릭시 모달 생성
		eventClick:  function(info) {
	        $('#modalTitle').html(event.title);
	        $('#modalBody').html(event.description);
	        $('#eventUrl').attr('href',event.url);
	        $('#calendarModal').modal();
	    	// 이벤트 클릭시 해달이벤트 날짜 GET
            var eventObj = info.event;
	        if (eventObj.start) {
	        	var j_date = eventObj.start;// Tue Feb 01 2022 00:00:00 GMT+0900 (한국 표준시)
	        	console.log(j_date);
	        	}
	    	},
	    // 날짜 클릭시 모달
//	    dateClick: function () {
//		 	$("#calendarModal").modal();
//		},
			selectable : true,
			droppable : true,
			editable : true,
			events : [
				
    			<%List<JobVo> calendarList = (List<JobVo>) request.getAttribute("list");%>
            	<%if (calendarList != null) {%>
            	<%for (JobVo vo : calendarList) {%>
            	//시작날짜
            	{
	            	title : '<%=vo.getJ_company()%>',
	                start : '<%=vo.getJ_startdate()%>',
	                color : '#1cc88a'
	             },
	             //마감날짜
	             {
	             	title : '<%=vo.getJ_company()%>',
	                 start : '<%=vo.getJ_enddate()%>',
	                 color : '#e74a3b'
	              },
             
		<%}
	}%>
					],
					
					
				});
				calendar.render();
			});

		  
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>