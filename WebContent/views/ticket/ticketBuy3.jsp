<%@page import="daily.cafe.vo.CafeRegionNameVO"%>
<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% // 로그인 세션 확인
	CafeRegionNameVO cafeVO = (CafeRegionNameVO)request.getAttribute("cafeVO");

	AdminVO adminVO = (AdminVO)session.getAttribute("adminVO")==null?null:(AdminVO)session.getAttribute("adminVO");
	OwnerVO ownerVO = (OwnerVO)session.getAttribute("ownerVO")==null?null:(OwnerVO)session.getAttribute("ownerVO");
	UserVO userVO = (UserVO)session.getAttribute("userVO")==null?null:(UserVO)session.getAttribute("userVO");
	String loginId = "";
	String loginName = "";
	if(adminVO!=null){
		loginId = adminVO.getAdminId();
		loginName = adminVO.getAdminName();
	}else if(ownerVO!=null){
		loginId = ownerVO.getOwnerId(); 
		loginName = ownerVO.getOwnerName();
	}else if(userVO!=null) {
		loginId = userVO.getUserId();
		loginName = userVO.getUserName();
	}
	
	
	String cafeNo = (String)request.getAttribute("cafeNo");
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>🎫이용권구매🎫</title>
	<style type="text/css">
	*{margin: 0px;padding: 0px;}	
	
	</style>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
<!-- 	Jquery -->
	<script  src="http://code.jquery.com/jquery-latest.	min.js"></script>
	<!-- iamport.payment.js -->
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
	
	<script type="text/javascript">

	
	
	
	$(document).ready(function() {
		 
		 
// // 		상품유형 
// 		 $('input[type="checkbox"][name="productDateType"]').click(function(){
// 		  if($(this).prop('checked')){
// 		     $('input[type="checkbox"][name="productDateType"]').prop('checked',false);
// 		     $(this).prop('checked',true);
// 		    }
// 		   });
// //	 	시간 유형 
// 		 $('input[type="checkbox"][name="productTimeType"]').click(function(){
// 		  if($(this).prop('checked')){
// 		     $('input[type="checkbox"][name="productTimeType"]').prop('checked',false);
// 		     $(this).prop('checked',true);
// 		    }
// 		   });

// // 		쿠폰&마일리지 
// 		 $('input[type="checkbox"][name="saleType"]').click(function(){
// 		  if($(this).prop('checked')){
// 		     $('input[type="checkbox"][name="saleType"]').prop('checked',false);
// 		     $(this).prop('checked',true);
// 		    }
// 		   });
// // 		지불 수단 
// 		 $('input[type="checkbox"][name="payType"]').click(function(){
// 		  if($(this).prop('checked')){
// 		     $('input[type="checkbox"][name="payType"]').prop('checked',false);
// 		     $(this).prop('checked',true);
// 		    }
// 		   });
		
		
		
		
// 		var ticketType = $("input[name='ticketType']:checked").val();
// 		console.log(ticketType);
		
		$("input[name='ticketType']").on("click", function(event){
			
			var ticketType = $(event.target).val();
			
			$("#divTicketPrice").empty();
			
			var strHtml = "";
			if(ticketType == 02){
				strHtml += "<input type='radio' name='ticketPrice' id='ticketTime2' value='3000' checked='checked'/>"
						+ "<label for='ticketTime2'>2시간/3,000원</label><br>"
						+ "<input type='radio' name='ticketPrice' id='ticketTime4' value='5000'/>" 
					 	+ "<label for='ticketTime4'>4시간/5,000원</label><br>" 
					 	+ "<input type='radio' name='ticketPrice' id='ticketTime6' value='7000'/>"
					 	+ "<label for='ticketTime6'>6시간/7,000원</label>"; 
			}else if(ticketType ==03){
				strHtml += "<input type='radio' name='ticketPrice' id='ticketWeek1' value='50000' checked='checked'/>"
					 	+ "<label for='ticketWeek1'>1주/50000원</label><br>"
				 		+ "<input type='radio' name='ticketPrice' id='ticketWeek2' value='80000' />"
					 	+ "<label for='ticketWeek2'>2주/80,000원</label><br>"
				 		+ "<input type='radio' name='ticketPrice' id='ticketWeek4' value='160000' />"
					 	+ "<label for='ticketWeek4'>4주/160,000원</label>";
			}
			
			$("#divTicketPrice").html(strHtml);
		});
		
		
	});
	
	
	function payment(){
		var fm = document.getElementById("fmPay");
		fm.method = "post";
		fm.action = "<%=request.getContextPath() %>/views/ticket/kakao.jsp";
		fm.submit();
	}
	
	
	// 	취소버튼 클릭시
	function newPage()  {
		  window.location.href = 'https://www.naver.com'
		}
	</script>
</head>
<body>
<!-- 네비-->
<jsp:include page="../include/mainNav1.jsp"/>
<!-- 상세 네비-->
<jsp:include page="../include/mainNav2.jsp"/>


	<h1 style="text-align: center;">상품결제</h1>
	
	<form id="fmPay">
<!-- 			<!-- 지점 --> 
<!-- 		<div class="row"> -->
<!-- 		  <div class="col-md-3"></div>	 -->
<!-- 		  <div class="col-md-6" style="background: beige; border: 2px solid; margin-top: 20px; height: 80px; border-radius: 8px;"> -->
<!-- 		  		<p>지점</p><br> -->
<!-- 			  	<div id="divCafeNo"> -->
					 
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo1" value="1" checked="checked"><label for="CafeNo1">중구청점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo2" value="2" ><label for="CafeNo2" >서대전점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo3" value="3" ><label for="CafeNo3" >동숭동점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo4" value="4" ><label for="CafeNo4" >장충점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo5" value="5" ><label for="CafeNo5" >신당점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo6" value="6" ><label for="CafeNo6" >문화점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo7" value="7" ><label for="CafeNo7" >용문점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo8" value="8" ><label for="CafeNo8" >선화점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo12" value="12" ><label for="CafeNo12" >대전시청점</label> -->
<!-- 					 <input type="radio" name="CafeNo" id="CafeNo13" value="13" ><label for="CafeNo13" >삼성동점</label> -->
					 
<!-- 			  	</div> -->
<!-- 		  </div> -->
<!-- 		  <div class="col-md-3"></div> -->
<!-- 		</div> -->
		
		<input type="hidden" value="<%=cafeNo %>" name="cafeNo">
	
		<!-- 상품 유형 -->
		<div class="row">
		  <div class="col-md-3"></div>	
		  <div class="col-md-6" style="background: beige; border: 2px solid; margin-top: 20px; height: 80px; border-radius: 8px;">
		  		<p>상품유형</p>
			  	<div id="divTicketType">
					 <input type='radio' name='ticketType' id="typeOneDay" value="02" checked="checked"/>
					 	<label for="typeOneDay">당일권</label><!--oneDay -->
					 <input type='radio' name='ticketType' id="typeRegular" value='03' />
						 <label for="typeRegular">정기권</label><!--regularDay -->
			  	</div>
		  </div>
		  <div class="col-md-3"></div>
		</div>
		
		<!-- 가격 유형 -->
			
		<div class="row">
		  <div class="col-md-3"></div>	
		  <div class="col-md-6" style="background: beige; border: 2px solid; margin-top: 20px; height: 110px; border-radius: 8px;">
			  	<p>상품선택</p>
			  	<div id="divTicketPrice">
					 <input type='radio' name='ticketPrice' id='ticketTime2' value='3000' checked='checked'/>
						 <label for="ticketTime2">2시간/3,000원</label><br>
					 <input type='radio' name='ticketPrice' id='ticketTime4' value='5000'/>
					 	<label for="ticketTime4">4시간/5,000원</label><br>
					 <input type='radio' name='ticketPrice' id='ticketTime6' value='7000'/>
					 	<label for="ticketTime6">6시간/7,000원</label>
			  	</div>
	<!-- 		  	<div> -->
	<!-- 				 <input type='radio' name='ticketPrice' id="ticketWeek1" value='50000' checked='checked'/> -->
	<!-- 					 <label for="ticketWeek1">1주/50000원</label> -->
	<!-- 				 <input type='radio' name='ticketPrice' id="ticketWeek2" value='80000' /> -->
	<!-- 					 <label for="ticketWeek2">2주/80,000원</label> -->
	<!-- 				 <input type='radio' name='ticketPrice' id="ticketWeek4" value='160000' /> -->
	<!-- 					 <label for="ticketWeek4">4주/160,000원</label> -->
	<!-- 		  	</div> -->
				
		  </div>
		  <div class="col-md-3"></div>
		</div>
		
		<!-- 마일리지 & 쿠폰  -->
		<div class="row">
		  <div class="col-md-3"></div>	
		  <div class="col-md-6" style="background: beige; border: 2px solid; margin-top: 20px; height: 100px; border-radius: 8px;">
		  		<p>마일리지 & 쿠폰 </p>
			  	<div>
					 <input type='radio' name='saleType' id="saleNo" value='NoUse' checked="checked"/>
						 <label for="saleNo">사용안함</label>
					 <input type='radio' name='saleType' id="saleMileage" value='mileage'/>
					 	<label for="saleMileage">마일리지</label>
					 <input type='radio' name='saleType' id="saleCoupon" value='coupon'/>
					 	<label for="saleCoupon">쿠폰</label>
					 <br>
					 <input type="text" name="code" placeholder="쿠폰/마일리지 번호를 입력해주세요." style="width: 250px;"/><button onclick="check">사용</button>
			  	</div>
				
		  </div>
		  <div class="col-md-3"></div>
		</div>
		
		<!-- 결제 수단 -->
		<div class="row">
		  <div class="col-md-3"></div>	
		  <div class="col-md-6" style="background: beige; border: 2px solid; margin-top: 20px; height: 80px; border-radius: 8px;">
			  	
			  	<div>
			  		 <p>결제수단</p>
					 <input type='radio' name='payType' id="payKakao" value='kakao' checked="checked"/>
					 	 <label for="payKakao">📱카카오</label>
					 <input type='radio' name='payType' id="payCard" value='card' />
					 	 <label for="payCard">💳신용카드</label>
					 <input type='radio' name='payType' id="payBank" value='money' />
					 	 <label for="payBank">💰계좌이체</label>
			  	</div>
				
		  </div>
		  <div class="col-md-3"></div>
		</div>
		
		
		<div class="row">
		  <div class="col-md-4"></div>	
		  <div class="col-md-4" style="margin-top: 20px; height: 80px; text-align: center;">
			  	<div style="display: inline-block; width: 50%;">
			  	
			  		<!-- 결제 -->
			  		<button  class="btn btn-primary" type="button" onclick="payment()">결제하기</button>
					<!-- 취소 메인홈으로가기 -->
					<button  class="btn btn-default" type="button" onclick="newPage()">취소</button>
			  	</div>
				
		  </div>
		  <div class="col-md-4"></div>
		</div>
	</form>
	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>