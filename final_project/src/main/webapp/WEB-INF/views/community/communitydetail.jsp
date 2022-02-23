<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 동아리 상세 보기 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
		<div id="content">

<!-- ---------------------------------------------------------------------------------------------------------------------- -->

<!-- Begin Page Content -->
		<div class="container-fluid">

<!-- Page Heading -->
			<!-- 
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800"> 동아리 상세보기 </h1>
					
			</div>
			 -->
			 
<!-- Approach -->
			<!-- 동아리 상세정보 카드 -->
			<div class="container">

<!-- Approach -->
				
				 <div class="card shadow mb-3" >
				
					 <div class="card-header py-2">
						 <div class="row g-0"> 
							
							<img class="rounded-circle" src="${ cp }/resources/comm/${ vo1.cu_coverimg }" style="width:70px; height:70px;">
							<div style="font-size: 20px; font-weight: 700;">${ vo1.cu_name }  <br> 
							<span style="font-size: 15px; font-weight: 200;"> ${ vo1.cu_intro }</span> &nbsp;&nbsp;  <span style="font-size: 12px; font-weight: 200;"> ${ vo1.cu_category }	</span> 
							<br> 	
							
							<input type="hidden" value="${ nmaplike }" id="count">
													
													<c:choose>
														<c:when test="${ nmaplike eq 0 }">
														
															<!-- 좋아요 버튼 -->
															<button type="button" value="좋아요등록 " id="btnLike" style="border:0; background-color: transparent;">
																<i class="fa-solid fa-star" id="heartt" style="color: gainsboro;"></i>
															</button>
															<input type="text" value="${ vo1.cu_recommend }	"
																   id="likepersoncount"
															   	   style="border:0 solid black; background-color:transparent; "
														 	 	   readonly="readonly" width="50px; " >
														</c:when>
														<c:otherwise>
															<!-- 좋아요 취소 버튼 -->
															<button type="button" value="좋아요취소" id="btnLike" style="border:0; background-color: transparent;">
																<i class="fa-solid fa-star" id="heartt" style="color: palevioletred;"></i>
															</button>
															<input type="text" value="${ vo1.cu_recommend }	"
														   		   id="likepersoncount"
														      	   style="border:0 solid black; background-color:transparent; "
														   	 	   readonly="readonly">
														</c:otherwise>
													</c:choose>
													
													<span id="heart"></span>
					
							
							
							 </div> 
						 
				</div>  
											
			
						<div>
								
								</div> 
								
								
					</div> 
					
					
				</div> <!-- n번 동아리 끝 --> 
				

			
			</div>
			<div class="container">

<!-- Approach -->
				
				 <div class="card shadow mb-3" >
				
					 <div class="card-header py-2">
						 <div class="row g-0"> 
							
					<span style="font-weight: 900;">공지</span>  ▶  ${ vo1.cu_notice }
				</div>  
					
					
						  
						
						
						
						<div>
								
								</div> 
								
								
					</div> 
					
					
				</div> <!-- n번 동아리 끝 --> 
				

			
			</div>
			
		</div>
		<div><br></div>
		 <!-- container-fluid (Main Content의 메인부분) 끝-->
<!-- /.container-fluid -->
			<div class="container">
			<table class="table table-hover">
				<thead>	
					<tr>
					
				<th>글번호</th>
				<th>제목</th>
				
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			</thead>
			
						<c:if test="${ list1.isEmpty() == true}">
						   
						</c:if>
						<c:if test="${ list1 != null}">
						<c:forEach var="vo" items="${ list1 }">
						<div class="text-center"  style="cursor: pointer;"onclick="location.href='${ cp }/community/communitydetail?cu_num=${ vo.cu_num }';" >
						<tr>
						
						<td>${vo.b_num }</td>
						<td><a href="${ cp }/board/boarddetail?b_num=${ vo.b_num }">${vo.b_title }</a></td>
						<td>${vo.b_regdate }</td>
						<td>${vo.b_recommend }</td>
						
						
						</tr>
						
						</div>
						
						</c:forEach>
						
						</c:if>
					
			</table>
				
	
						</div>
						<br>
						
		</div> <!-- Main Content 끝-->
<!-- End of Main Content -->
							
			<div class="container show-grid" style="margin: auto; text-align: center; margin-bottom: 100px; ">
				<a style="text-align: center;" href="${ cp }/board/boardinsertform?cu_num=${ vo1.cu_num }">게시글작성하기</a>
			</div>
			
	</div> <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	


<!-- Footer -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- End of Footer -->


	<!-- </div>  -->
<!-- End of Page Wrapper -->
		
<!-- ---------------------------------------------------------------------------------------------------------------------- -->
		
<!-- 스크롤 -->		
<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

<!-- 로그아웃 -->
<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		 aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">로그아웃하시려면 '로그아웃' 버튼을 눌러주세요.</div>
					
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
							data-dismiss="modal">취소
					</button>
					<a class="btn btn-primary" href="login.html">로그아웃</a>
				</div>
			</div>
		</div>
	</div>


    

  
    
<style>
	#dot{
		list-style:none;
   		padding-left:5px;
   	}
	$breadcrumb-divider: quote(">");
</style>   
<script>

//좋아요 누르기
$(function(){
	var count = parseInt($("#count").val());
	var btnLike = $("#btnLike").val();
	var likepersoncount = parseInt($("#likepersoncount").val());
	$("#btnLike").click(function(){
		if ((count+2)%2 == 0) {
			$.ajax({
				url:'${cp}/community/LikecommInsert',
				data:{"cu_num":${vo1.cu_num},"m_num":${vo.m_num}},
				dataType:'json',
				success:function(data){
					if(data.result == 'success'){
						count++;
						likepersoncount++;
						$('button[id=btnLike]').attr('value','좋아요취소');
						$('i[id=heartt]').attr('style','color: palevioletred');
						$('input[id=likepersoncount]').attr('value', likepersoncount);
						alert('즐겨찾기 등록');
					}else{
						alert('실패');
					}
				}
			});
		} else {
			$.ajax({
				url:'${cp}/community/LikecommDelete',
				data:{"cu_num":${vo1.cu_num},"m_num":${vo.m_num}},
				dataType:'json',
				success:function(data){
					count++;
					likepersoncount--;
					$('button[id=btnLike]').attr('value','좋아요등록');
					$('i[id=heartt]').attr('style','color: gainsboro');
					$('input[id=likepersoncount]').attr('value', likepersoncount);
					alert('즐겨찾기 삭제');
				}
			});
		}
	});
});
</script>