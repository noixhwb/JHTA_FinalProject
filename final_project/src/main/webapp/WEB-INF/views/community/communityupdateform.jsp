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
			<div class="container" style="height: 700px; position: relative;top: 200px;">

<!-- Approach -->
				
				 <div class="card shadow mb-3"  style="text-align: center;">
				
					 <div class="card-header py-2">
						 <div class="row g-0"> 
						 <div style="position: relative; left: 400px;">
							<form method="post" action="${cp }/community/update" >
		
			<input type="hidden" name="cu_num" value="${ vo1.cu_num }" style="width: 200pt; height:22pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df ">
		
			<label>커뮤니티소개글</label><br><br><input type="text" name="cu_intro" value="${ vo1.cu_intro }" style="width: 200pt; height:30pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br><br>
		
			<label>커뮤니티공지</label><br><br><input type="text" name="cu_notice" value="${ vo1.cu_notice }" style="width: 200pt; height:30pt; border-left: none; border-right: none; border-top: none;  font-size: 14px; border-color: #4e73df "><br><br><br>
			
								<input type="submit" value="수정" style="width: 150pt; height:30pt; cursor: pointer; background-color: #4e73df; font-size: 17px;border-radius: 1px; border: 1px solid white; border-radius: 0.7rem; color: white;"> 
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">	
					
			</form>
						 	</div>	
				</div>  
					
					
						  
						
						
						
						<div>
								
								</div> 
								
								
					</div> 
					
					
				</div> <!-- n번 동아리 끝 --> 
				

			
			</div>
	
		</div>
		<div><br></div>
		<div>
	
		</div>
		 <!-- container-fluid (Main Content의 메인부분) 끝-->
<!-- /.c
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
						$('input[id=btnLike]').attr('value','좋아요취소');
						$('input[id=likepersoncount]').attr('value', likepersoncount);
						alert('등록 성공!');
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
					$('input[id=btnLike]').attr('value','좋아요등록');
					$('input[id=likepersoncount]').attr('value', likepersoncount);
					alert('삭제 성공!');
				}
			});
		}
	});
});
</script>