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
			<div class="row">
				<div class="col-6 offset-3">
			<div class="card shadow mb-4 ">

				<div class="card-body">
					
					<nav style="--bs-breadcrumb-divider: '>'; background-color:primary;" aria-label="breadcrumb">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item"><a href="${ cp }/circle/CircleList">동아리</a></li>
					    <li>&nbsp;&nbsp;>&nbsp;&nbsp;</li>
					    <li class="breadcrumb-item active" aria-current="page">동아리 상세정보</li>
					  </ol>
					</nav>
					
					<!-- 1. 동아리 정보 -->
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col-sm-12">
								<div class="card-body">
									<h5 class="card-title"> ${ sel.ci_title }</h5>
									<p class="card-text">
									
										<div class="row g-0">
											<div class="col-md-6">
												<ul id="dot">
													<li>
														<img src="${ cp }/resources/images/circle/${ sel.ci_logofile }" 
															 style="max-width: 50px;">&nbsp;&nbsp;
														<h6 class="m-0 font-weight-bold text-dark" style="display:inline;"> ${ sel.ci_name }</h6>
													</li>
													<li>
														<span class="badge badge-pill badge-secondary">${ sel.ci_category }</span>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<i class="fa-solid fa-user"></i>
														${ selectedPerson } / ${ sel.ci_person }
													</li> <!-- 2번 -->
												</ul>
											</div>
											<div class="col-md-6">
												<ul id="dot">
													<li>
														&nbsp;<i class="fa-solid fa-calendar-days"></i>&nbsp;&nbsp;
														${ sel.ci_startdate } ~ ${ sel.ci_enddate }
													</li>
													<li>
														&nbsp;<i class="fa-solid fa-eye" style="color: cornflowerblue;"></i>&nbsp;&nbsp;
														${ sel.ci_view+viewnumber }
													</li> 

													<input type="hidden" value="${ nmaplike }" id="count">
													<li>
													<c:choose>
														<c:when test="${ nmaplike eq 0 }">
														
															<!-- 좋아요 버튼 -->
															<button type="button" value="좋아요등록 " id="btnLike" style="border:0; background-color: white">
																<i class="fa-solid fa-heart" id="heartt" style="color: gainsboro;"></i>
															</button>
															<input type="text" value="${ likePerson }"
																   id="likepersoncount"
															   	   style="border:0 solid black;"
														 	 	   readonly="readonly">
														</c:when>
														<c:otherwise>
															<!-- 좋아요 취소 버튼 -->
															<button type="button" value="좋아요취소" id="btnLike" style="border:0; background-color: white">
																<i class="fa-solid fa-heart" id="heartt" style="color: palevioletred;"></i>
															</button>
															<input type="text" value="${ likePerson }"
														   		   id="likepersoncount"
														      	   style="border:0 solid black;"
														   	 	   readonly="readonly">
														</c:otherwise>
													</c:choose>
													</li>
													<li><span id="heart"></span></li>


												</ul>
											</div>
										</div>
												
									</p>
								</div>
									
							</div>
						</div>
					</div> <!-- 1. 동아리 정보 끝 -->
						
						
					<!-- 2. 동아리 게시글 상세 (포스터+글내용) -->
					<div class="card mb-3">
						<div class="col-md-12">
							<div class="card-body">
								<!-- (1) 포스터 -->
								<div class="col-md-8 offset-md-2 b">
									<img src="${ cp }/resources/images/circle/${ sel.ci_imgfile }"
										 style="max-width: 100%">
								</div>
								
								<!-- (1) 포스터 끝 -->
								<br> <hr width="100%" color="#C0C0C0" noshade /> <br> <!-- 구분선 -->
								<!-- (2) 글내용 --> 
								${ sel.ci_content } <br>
								<!-- (2) 글내용 끝 --> 
							</div>
						</div>
					</div> <!-- 2. 동아리 게시글 상세 끝 -->
					
					<c:choose>	
					<c:when test="${ nmymap ne 0 }">
					</c:when>
					<c:when test="${ nmap eq 0 }">				
						<!-- 3. 동아리 신청하기 -->
						<div class="row g-0">
							<div class="col text-center">
								<button class="btn btn-secondary" data-target="#joinModal" data-toggle="modal">신청하기</button>
							</div>
						</div>
						<!-- 3. 동아리 신청하기 끝 -->
					</c:when>
					<c:otherwise>
						<!-- 4. 동아리 신청 취소하기 -->
						<div class="row g-0">
							<div class="col text-center">
								<button class="btn btn-secondary" data-target="#joinCancelModal" data-toggle="modal">신청취소하기</button>
							</div>
						</div>
						<!-- 4. 동아리 신청취소하기 끝 -->
					</c:otherwise>
					</c:choose>
				</div> <!-- 동아리 상세정보 카드 body 끝-->
			</div>
				</div>
			</div> <!-- 동아리 상세정보 카드 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝-->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝-->
<!-- End of Main Content -->
			
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

<!-- 신청하기 Modal-->
    <div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel" style="margin:auto; text-align:center;">이 동아리를 신청하시겠습니까?</h4>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="${ cp }/circle/MyCircleJoin?ci_num=${ sel.ci_num }">신청하기</a>
                </div>
            </div>
        </div>
    </div>
    
<!-- 신청 취소하기 Modal-->
    <div class="modal fade" id="joinCancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalLabel" style="margin:auto; text-align:center;">이 동아리를 신청 취소하시겠습니까?</h4>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="${ cp }/circle/MyCircleJoinCancel?ci_num=${ sel.ci_num }">신청취소하기</a>
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
				url:'${cp}/circle/LikeCircleInsert',
				data:{"ci_num":${ci_num},"m_num":${m_num}},
				dataType:'json',
				success:function(data){
					if(data.result == 'success'){
						count++;
						likepersoncount++;
						$('button[id=btnLike]').attr('value','좋아요취소');
						$('i[id=heartt]').attr('style','color: palevioletred');
						$('input[id=likepersoncount]').attr('value', likepersoncount);
					}else{
						alert('등록 실패!');
					}
				}
			});
		} else {
			$.ajax({
				url:'${cp}/circle/LikeCircleDelete',
				data:{"ci_num":${ci_num},"m_num":${m_num}},
				dataType:'json',
				success:function(data){
					count++;
					likepersoncount--;
					$('button[id=btnLike]').attr('value','좋아요등록');
					$('i[id=heartt]').attr('style','color: gainsboro');
					$('input[id=likepersoncount]').attr('value', likepersoncount);
				}
			});
		}
	});
});
</script>