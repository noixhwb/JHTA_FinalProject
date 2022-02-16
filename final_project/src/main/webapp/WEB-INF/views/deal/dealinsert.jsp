<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/views/header.jsp"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<div class="container">

	<div class="modal fade" id="defaultModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title">알림</h4>
				</div>
				<div class="modal-body">
					<p class="modal-contents"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!--// 모달창 -->
	<hr />

	<form class="form-horizontal" role="form" method="post"
		action="${pageContext.request.contextPath }/deal/dealinsert?${_csrf.parameterName }=${_csrf.token }"
		enctype="multipart/form-data">

		<div class="form-group" id="divTitle">
			<label class="col-lg-2 control-label">제목</label>
			<div class="col-lg-8">
				<input type="text" class="form-control" id="t_title" name="t_title"
					data-rule-required="true" placeholder="제목을 등록해주세요." maxlength="30">
			</div>
		</div>

		<div class="form-group" id="divId">
			<label class="col-lg-2 control-label">제품명</label>
			<div class="col-lg-8">
				<input type="text" class="form-control" id="t_name" name="t_name"
					data-rule-required="true" placeholder="제품명을 등록해주세요." maxlength="30">
			</div>
		</div>
		<div class="form-group" id="divPrice">
			<label class="col-lg-2 control-label">가격</label>
			<div class="col-lg-8">
				<input type="number" class="form-control" id="t_price"
					name="t_price" data-rule-required="true" placeholder="1000원 단위로 입력"
					maxlength="30">
			</div>
		</div>
		<div class="form-group" id="divExplanation">
			<label class="col-lg-2 control-label">상품설명</label>
			<div class="col-lg-8" id="memberInfo">
				<textarea class="form-control" rows="11" name="t_explanation"
					id="t_explanation" style="resize: none"></textarea>
			</div>
		</div>
		<div class="form-group" id="divFile">
			<label class="col-lg-2 control-label">이미지등록</label>
			<div class="col-lg-8">
				<input multiple="multiple" type="file" name="file" />
			</div>
		</div>
		<div class="form-group" id="divEmail">
			<label class="col-lg-2 control-label">이메일</label>
			<div class="col-lg-8">
				<input type="email" class="form-control" id="email" name="email"
					data-rule-required="true" placeholder="이메일" maxlength="40">
			</div>
		</div>

		<div class="form-group" id="divRphone">
			<label class="col-lg-2 control-label">휴대폰 번호</label>
			<div class="col-lg-8">
				<input type="tel" class="form-control" name="rphone" id="rphone"
					data-rule-required="true" placeholder="010-0000-0000"
					maxlength="13">
			</div>


		</div>
		<div class="form-group" id="check">
			<button type="button" class="btn btn-default" id="phoneVerification">인증번호발송</button>
			<div class="col-lg-8 has-error has-feedback">
				<input type="number" class="form-control" name="code1" id="code1"
					aria-describedby="inputError2Status">
			</div>
		</div>


		<div class="form-group">
			<label class="col-lg-2 control-label">이메일 수신여부</label>
			<div class="col-lg-8">
				<label class="radio-inline"> <input type="radio"
					id="emailReceiveYn" name="emailReceiveYn" value="Y" checked>
					동의합니다.
				</label> <label class="radio-inline"> <input type="radio"
					id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지
					않습니다.
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-2 control-label">SMS 수신여부</label>
			<div class="col-lg-8">
				<label class="radio-inline"> <input type="radio"
					id="smsReceiveYn" name="smsReceiveYn" value="Y" checked>
					동의합니다.
				</label> <label class="radio-inline"> <input type="radio"
					id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지 않습니다.
				</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-lg-2 control-label">개인정보취급방침</label>
			<div class="col-lg-8" id="memberInfo">
				<textarea class="form-control" rows="4" style="resize: none"
					readonly="readonly">개인정보의 항목 및 수집방법
                        
                        </textarea>
				<div class="radio">
					<label> <input type="radio" id="memberInfoYn"
						name="memberInfoYn" value="Y" checked> 동의합니다.
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" id="memberInfoYn"
						name="memberInfoYn" value="N"> 동의하지 않습니다.
					</label>
				</div>
			</div>
		</div>

		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="submit" class="btn btn-primary">등록</button>
			</div>
		</div>
	</form>
</div>

<script>
	var code="1234";
            $(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
            	
                $("#phoneVerification").click(function(){
                	if($("#smsReceiveYn:checked").val()!='Y'){
                		alert("SMS 수신여부를 동의해주세요");
                	}else{
                		
                	rphone = $("#rphone").val();
                	console.log(rphone);
                	$.ajax({
                		url:"${pageContext.request.contextPath}/deal/smssend",
                		data:{"rphone":rphone},
                		type: 'POST',
                		dataType:"json",
    					beforeSend : function(xhr) {
    						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    					},
                		
                		success:function(data){
                			code = data.code;
                		}
                	})
                	}
                });                
                //------- validation 검사
                $( "form" ).submit(function( event ) {
                    
                    var provision = $('#provision');
                    var memberInfo = $('#memberInfo');
                    var divId = $('#divId');
                    var divPassword = $('#divPassword');
                    var divPasswordCheck = $('#divPasswordCheck');
                    var divName = $('#divName');
                    var divNickname = $('#divNickname');
                    var divEmail = $('#divEmail');
                    var divPhoneNumber = $('#divPhoneNumber');
                    
                    //상품판매제목 검사
                    if($('#t_title').val()==""){
                        modalContents.text("제목을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        $('#t_title').focus();
                        return false;
                    }
                    

                    
                    //상품명 검사
                    if($('#t_name').val()==""){
                        modalContents.text("상품명을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        $('#t_name').focus();
                        return false;
                    }
                    
                    
                    //가격
                    if($('#t_price').val()==""){
                        modalContents.text("가격을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        $('#t_price').focus();
                        return false;
                    }
                    
                    //상품설명
                    if($('#t_explanation').val()==""){
                        modalContents.text("상품설명을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        $('#t_explanation').focus();
                        return false;
                    }
                    
                    //이메일
                    if($('#email').val()==""){
                        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        $('#email').focus();
                        return false;
                    }
                    
                    //휴대폰 번호
                    if($('#rphone').val()==""){
                        modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                        $('#rphone').focus();
                        return false;
                    }
                    
                    if($('#code1').val()==code){

                    }else{
                        modalContents.text("인증번호를 확인하여 주시기 바랍니다.");
                        modal.modal('show');
                        $('#code1').focus();
                        return false;
                    }
                    
                    
                    //개인정보취급방침
                    if($('#memberInfoYn:checked').val()=="N"){
                        modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
                        modal.modal('show');
                        $('#memberInfoYn').focus();
                        return false;
                    }
                    
                
                });
                
            });
</script>




<APM_DO_NOT_TOUCH> <script type="text/javascript">
(function(){
window.rLI=!!window.rLI;try{(function(){(function JI(){var l=!1;function L(l){for(var L=0;l--;)L+=s(document.documentElement,null);return L}function s(l,L){var _="vi";L=L||new S;return LI(l,function(l){l.setAttribute("data-"+_,L.z2());return s(l,L)},null)}function S(){this.JZ=1;this.Oz=0;this.ol=this.JZ;this.jo=null;this.z2=function(){this.jo=this.Oz+this.ol;if(!isFinite(this.jo))return this.reset(),this.z2();this.Oz=this.ol;this.ol=this.jo;this.jo=null;return this.ol};this.reset=function(){this.JZ++;this.Oz=0;this.ol=this.JZ}}var _=!1;
function II(l,L){var s=document.createElement(l);L=L||document.body;L.appendChild(s);s&&s.style&&(s.style.display="none")}function jI(L,s){s=s||L;var S="|";function II(l){l=l.split(S);var L=[];for(var s=0;s<l.length;++s){var _="",jI=l[s].split(",");for(var oI=0;oI<jI.length;++oI)_+=jI[oI][oI];L.push(_)}return L}var jI=0,LI="datalist,details,embed,figure,hrimg,strong,article,formaddress|audio,blockquote,area,source,input|canvas,form,link,tbase,option,details,article";LI.split(S);LI=II(LI);LI=new RegExp(LI.join(S),
"g");while(LI.exec(L))LI=new RegExp((""+new Date)[8],"g"),l&&(_=!0),++jI;return s(jI&&1)}function LI(l,L,s){(s=s||_)&&II("div",l);l=l.children;var S=0;for(var jI in l){s=l[jI];try{s instanceof HTMLElement&&(L(s),++S)}catch(LI){}}return S}jI(JI,L)})();var lI=10;
try{var OI,sI,_I=J(634)?1:0,iI=J(989)?0:1,lj=J(555)?1:0,Lj=J(939)?0:1,sj=J(390)?1:0,Sj=J(28)?1:0,_j=J(756)?1:0,ij=J(362)?1:0;for(var JJ=(J(813),0);JJ<sI;++JJ)_I+=(J(576),2),iI+=J(627)?2:1,lj+=(J(882),2),Lj+=(J(70),2),sj+=J(443)?2:1,Sj+=J(429)?2:1,_j+=(J(370),2),ij+=J(409)?3:2;OI=_I+iI+lj+Lj+sj+Sj+_j+ij;window.Ll===OI&&(window.Ll=++OI)}catch(LJ){window.Ll=OI}var oJ=!0;function O(I,l){I+=l;return I.toString(36)}
function OJ(I){var l=80;!I||document[z(l,198,185,195,185,178,185,188,185,196,201,163,196,177,196,181)]&&document[z(l,198,185,195,185,178,185,188,185,196,201,163,196,177,196,181)]!==O(68616527586,l)||(oJ=!1);return oJ}function z(I){var l=arguments.length,L=[];for(var s=1;s<l;++s)L.push(arguments[s]-I);return String.fromCharCode.apply(String,L)}function Z(I){var l=arguments.length,L=[],s=1;while(s<l)L[s-1]=arguments[s++]-I;return String.fromCharCode.apply(String,L)}function ZJ(){}
OJ(window[ZJ[O(1086844,lI)]]===ZJ);OJ(typeof ie9rgb4!==O(1242178186189,lI));OJ(RegExp("\x3c")[z(lI,126,111,125,126)](function(){return"\x3c"})&!RegExp(z(lI,130,61,110))[Z(lI,126,111,125,126)](function(){return"'x3'+'d';"}));
var sJ=window[z(lI,107,126,126,107,109,114,79,128,111,120,126)]||RegExp(Z(lI,119,121,108,115,134,107,120,110,124,121,115,110),O(8,lI))[O(1372195,lI)](window["\x6e\x61vi\x67a\x74\x6f\x72"]["\x75\x73e\x72A\x67\x65\x6et"]),_J=+new Date+(J(613)?6E5:775138),Il,Jl,ll,ol=window[Z(lI,125,111,126,94,115,119,111,121,127,126)],zl=sJ?J(796)?3E4:34228:J(467)?6E3:3232;
document[Z(lI,107,110,110,79,128,111,120,126,86,115,125,126,111,120,111,124)]&&document[Z(lI,107,110,110,79,128,111,120,126,86,115,125,126,111,120,111,124)](z(lI,128,115,125,115,108,115,118,115,126,131,109,114,107,120,113,111),function(I){var l=15;document[z(l,133,120,130,120,113,120,123,120,131,136,98,131,112,131,116)]&&(document[z(l,133,120,130,120,113,120,123,120,131,136,98,131,112,131,116)]===O(1058781968,l)&&I[Z(l,120,130,99,129,132,130,131,116,115)]?ll=!0:document[Z(l,133,120,130,120,113,120,
123,120,131,136,98,131,112,131,116)]===O(68616527651,l)&&(Il=+new Date,ll=!1,Zl()))});function Zl(){if(!document[z(99,212,216,200,213,220,182,200,207,200,198,215,210,213)])return!0;var I=+new Date;if(I>_J&&(J(199)?6E5:869246)>I-Il)return OJ(!1);var l=OJ(Jl&&!ll&&Il+zl<I);Il=I;Jl||(Jl=!0,ol(function(){Jl=!1},J(248)?1:0));return l}Zl();var Sl=[J(50)?17795081:11060927,J(628)?27611931586:2147483647,J(987)?1056642794:1558153217];
function _l(I){var l=59;I=typeof I===z(l,174,175,173,164,169,162)?I:I[Z(l,175,170,142,175,173,164,169,162)](J(691)?36:42);var L=window[I];if(!L||!L[Z(l,175,170,142,175,173,164,169,162)])return;var s=""+L;window[I]=function(I,l){Jl=!1;return L(I,l)};window[I][z(l,175,170,142,175,173,164,169,162)]=function(){return s}}for(var jL=(J(603),0);jL<Sl[O(1294399195,lI)];++jL)_l(Sl[jL]);OJ(!1!==window[Z(lI,124,86,83)]);window.zJ=window.zJ||{};window.zJ._Z="084778b125194000642f5d2b90b83d4add79f0624f58c309d522374109f0b6ecfa03bb2771d3b1da557912e8e0030a7ea57fed99c66eecf1cc33f8b8b5ddd0e7a0215326d5727778";
function JL(I){var l=+new Date,L;!document[z(98,211,215,199,212,219,181,199,206,199,197,214,209,212,163,206,206)]||l>_J&&(J(293)?6E5:894976)>l-Il?L=OJ(!1):(L=OJ(Jl&&!ll&&Il+zl<l),Il=l,Jl||(Jl=!0,ol(function(){Jl=!1},J(129)?1:0)));return!(arguments[I]^L)}function J(I){return 820>I}(function LL(l){return l?0:LL(l)*LL(l)})(!0);})();}catch(x){}finally{ie9rgb4=void(0);};function ie9rgb4(a,b){return a>>b>>0};

})();

</script> </APM_DO_NOT_TOUCH>
<%@ include file="/WEB-INF/views/footer.jsp"%>