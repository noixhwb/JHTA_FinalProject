<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 동아리 상세 보기 -->
<!-- Header -->
<%@ include file="/WEB-INF/views/header.jsp" %>
<!-- End of Header -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- ---------------------------------------------------------------------------------------------------------------------- -->

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
					
					
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item">${vo.b_title }</li>
					    <li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
					    <li class="breadcrumb-item active" aria-current="page">${vo.b_regdate }</li>
					  </ol>
					<i class="fa-solid fa-eye" style="color: cornflowerblue;"></i>
														${vo.b_recommend}
					
					<!-- 1. 동아리 정보 -->
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col-sm-12">
								<div class="card-body">
									<h5 class="card-title"> </h5>
								
										<img  style="width: 200px; height: 200px;"  src="${ cp }/resources/comm/${vo1.i_filename }" ><br><br>
									
									
										
										<div class="row g-0">
											
											${vo.b_content }
										
														
													
										</div>
												
								
								</div>
									
							</div>
						</div>
					</div> <!-- 1. 동아리 정보 끝 -->
						
						
					<!-- 2. 동아리 게시글 상세 (포스터+글내용) -->
					
					
					
				</div> <!-- 동아리 상세정보 카드 body 끝-->
			</div>
				</div>
			</div> <!-- 동아리 상세정보 카드 끝 -->

		</div> <!-- container-fluid (Main Content의 메인부분) 끝-->
<!-- /.container-fluid -->
			
		</div> <!-- Main Content 끝-->
<!-- End of Main Content -->
			
	</div> <!-- ContentWrapper 끝 -->
<div class="container">
			<table class="table table-striped">
				<thead>	
					<tr>
				<!-- 	
				<th>글번호</th>
				<th>글쓴이</th>
				<th>내용</th>
				<th>작성일</th> -->
				
			</tr>
			</thead>
			
						<c:if test="${ list1.isEmpty() == true}">
						   
						</c:if>
						<c:if test="${ list1 != null}">
						<c:forEach var="vo" items="${ list1 }">
						
					
						
						<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">
             <div class="commentInfo'+value.cno+'">
             <input type="hidden" name ="b_num" value="${vo.b_num}"> <input type="hidden"  name ="co_num" value="${vo.co_num}">
            <span style="font-weight: 900;">익명</span> <br><span>${vo.co_content}    </span>             <div style="position: relative; left: 1000px;">${vo.co_regdate}</div>
              <div class="commentContent'+value.cno+'"> 
              
               <div><a href="${cp }/board/removeComments?co_num=${vo.co_num}&b_num=${vo.b_num}" >삭제</a></div>
   </div></div>
						
						
						
				</div>
				
						
						</c:forEach>
						
						</c:if>
					
			</table>
				
	
						</div>

						
			<div class="container">
			
			
						<div class="container">
	<div class="container">	
	  <label for="content">comment</label>
   	<form action="${ cp }/comments/commentsinsert?${_csrf.parameterName }=${_csrf.token }"
   	 method="post">
   	 <div class="input-group">
   	 
		<textarea name="co_content"  class="form-control" cols="50" rows="2"></textarea>
		<input type="hidden" name="m_num" value="${vo.m_num}">
		<input type="hidden" name="b_num" value="${vo.b_num}">
		<input type="submit" class="btn btn-default"  value="댓글 달기"><font style="color: red;">${warning}</font>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
		     </div>
	</form>
	</div>



<script type="text/javascript">
function reload() {
	
	Location.reload();
	
}

</script>
	
	

<!-- <div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div> -->
					
		
				
	
						</div>
						<br>
					
		</div> <!-- Main Content 끝-->
<!-- End of Main Content -->
			
	 <!-- ContentWrapper 끝 -->
<!-- End of Content Wrapper -->	
<!-- <script type="text/javascript">
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/addComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}

 -->

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
	

   