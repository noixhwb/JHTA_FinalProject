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
	
	width: 13px;
	height: 9px;
	margin: 4px 2px 2px 0px;
	border: 1px solid #ddd;
	display: inline-block;
}
#chip{
	position:absolute;
	margin-top:30px;
	margin-left:250px;
	z-index: 999;
}
</style>

<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
	<div id="content">
		

		<div class="row">
			<div class="col-8 offset-2">

		<!-- ---------------------------------------------------------------------------------------------------------------------- -->
		<!-- Begin Page Content -->
				<div class="container-fluid">
		
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">채용 달력</h1>
					</div>
					<div id="chip">
						<ul style="list-style: none">
							<li ><div style="background-color: #1cc88a" class="chips"></div>시작</li>
							<li ><div style="background-color: #e74a3b" class="chips"></div>마감</li>
						</ul>
					</div>
					<!-- Approach -->
		
					<!-- calendar 태그 -->
					<div class="card mb-3" style="width: 100%; text-align: center;">
						<div class="col-md-12">
							<div class="card-body">
								<div id='calendar' style="width: 85%; display: inline-block;"></div>
							</div>	
						</div>		
					</div>
					<!-- 이벤트 클릭 시 나오는 모달 창 -->
					<div id="calendarModal" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h6 class="modal-title" id="modalTitle"></h6>
									<button class="close" type="button" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div id="modalBody" class="modal-body" style=" cursor: pointer;" >
									<ul style="list-style: none; padding-left: 0;">
									</ul>
								</div>
							</div>
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
		// 이벤트 클릭시 기능
		eventClick:  function(info) {
			// 모달생성
	        $('#modalTitle').html(event.title);
	        $('#modalBody').html(event.description);
	        $('#eventUrl').attr('href',event.url);
	        $('#calendarModal').modal();
	        
	        var eventObj = info.event; 			// 이벤트 클릭시 해당이벤트 날짜 GET
            var StringJ_num = eventObj.id;		// string형태의 j_num GET
            var j_numm = parseInt(StringJ_num); // string j_num -> int로 형변환 잘찍히는중
            
            
	        if (eventObj.start) {
	        	var j_date = eventObj.start;// Tue Feb 01 2022 00:00:00 GMT+0900 (한국 표준시)
	        	
	        	// Date format
	        	const offset = j_date.getTimezoneOffset()
	        	j_date = new Date(j_date.getTime() - (offset*60*1000))
				
	        	// console.log(getEventDate); // yyyy-mm-dd
	        	var getEventDate = j_date.toISOString().split('T')[0];
	        	
	        	let xhr=new XMLHttpRequest();
	    		xhr.onreadystatechange=function(){
	    			if(xhr.readyState==4 && xhr.status==200){
	    				let data=xhr.responseText;
	    				let json=JSON.parse(data);
	    				let head=getEventDate;
	    				let detail=json.j_company+ "<br>" + json.j_subject;
						let title=document.getElementById("modalTitle");
						let body=document.getElementById("modalBody");
						title.innerHTML=head;
						body.innerHTML=detail;
						
						$("#modalBody").click(function() {
							location.href="${cp}/job/detail?j_num=" + json.j_num; })

	    			}
	    		}
	    		xhr.open('get','${cp}/job/eventSelect?j_num=' + j_numm ,true);
	    		xhr.send();
		
	        	}
	    	},
			selectable : true,
			droppable : true,
			editable : false,	// 드래그 수정
			events : [			// DB 채용공고 받아오기
    			<%List<JobVo> calendarList = (List<JobVo>) request.getAttribute("list");%>
            	<%if (calendarList != null) {%>
            	<%for (JobVo vo : calendarList) {%>
            	//시작날짜
            	{
            		id : '<%=vo.getJ_num()%>',
	            	title : '<%=vo.getJ_company()%>',
	                start : '<%=vo.getJ_startdate()%>',
	                color : '#1cc88a'
	            },
	             //마감날짜
	            {
	            	id : '<%=vo.getJ_num()%>',
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