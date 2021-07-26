<%@page import="daily.ticket.vo.ChoiceTicketInfoVO"%>
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
	
	String cafeSeatNo = (String)request.getAttribute("cafeSeatNo");
	String ticketType = (String)request.getAttribute("ticketType");
	String ticketPrice = (String)request.getAttribute("ticketPrice");
	
	String contextPath = request.getContextPath();
	
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
		 
		
		$.ajax({
			url : "<%=contextPath %>/choiceTicketInfo.do"
			,type: "post"
			,data : {
				ticketType : "<%=ticketType %>"
				,ticketPrice : "<%=ticketPrice %>"
			}
			,dataType : "json"
			,success : function(data){
				
				 //상품유형 value 설정
				 $("#ticketType").val(data.ticketType);
				 //span태그 상품유형 이름 출력
				 $("#ticketTypeName").text( data.ticketTypeTime);
				 
				 //상품 가격 value 설정
				 $("#ticketPrice").val(data.ticketPrice);
				 //상품가격 및 시간 출력
				 var ticketTimePrice = data.ticketTime + " / " + data.ticketPrice + "원";
				 $("#ticketTimePrice").text(ticketTimePrice);
// 				 console.log(ticketTimePrice);
				 
			}
			,error : function(xhr){
				alert("오류");
				console.log(xhr);
			}
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
		  history.go(-1);
		}
	</script>
</head>
<body>
	
	<!-- 네비-->
	<jsp:include page="../include/cafeNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/cafeNav2.jsp"/>

	<h1 style="text-align: center;">상품결제</h1>
	
	<form id="fmPay">
		<input type="hidden" value="<%=cafeNo %>" name="cafeNo">
		
		<!-- 상품 유형 -->
		<div class="row">
		  <div class="col-xs-3"></div>	
		  <div class="col-xs-6 text-center" style="border: 2px solid; margin-top: 20px; line-height: 50px; border-radius: 8px;">
		  		<h3>상품유형</h3>
			  	<div id="divTicketType">
<!-- 					 <input type='radio' name='ticketType' id="typeOneDay" value="02" checked="checked"/> -->
<!-- 					 	<label for="typeOneDay">당일권</label>oneDay -->
					 <input type='hidden' name='ticketType' id="ticketType"/>
						 <label id="ticketTypeName"></label>
			  	</div>
		  </div>
		  <div class="col-xs-3"></div>
		</div>
		
		<!-- 가격 유형 -->
			
		<div class="row">
		  <div class="col-xs-3"></div>	
		  <div class="col-xs-6 text-center" style="border: 2px solid; margin-top: 20px; line-height: 50px; border-radius: 8px;">
			  	<h3>상품선택</h3>
			  	<div id="divTicketPrice">
<!-- 					 <input type='radio' name='ticketPrice' id='ticketTime2' value='3000' checked='checked'/> -->
<!-- 						 <label for="ticketTime2">2시간/3,000원</label><br> -->
					 <input type='hidden' name='ticketPrice' id='ticketPrice'/>
					 	<label id="ticketTimePrice"></label>
			  	</div>
				
		  </div>
		  <div class="col-xs-3"></div>
		</div>
		
		<!-- 마일리지 & 쿠폰  -->
		<div class="row">
		  <div class="col-xs-3"></div>	
		  <div class="col-xs-6 text-center" style="border: 2px solid; margin-top: 20px; line-height: 50px; border-radius: 8px;">
		  		<h3>마일리지 & 쿠폰 </h3>
			  	<div>
					 <input type='radio' name='saleType' id="saleNo" value='NoUse' checked="checked"/>
						 <label for="saleNo">사용안함&nbsp;&nbsp;</label>
					 <input type='radio' name='saleType' id="saleMileage" value='mileage'/>
					 	<label for="saleMileage">마일리지&nbsp;&nbsp;</label>
					 <input type='radio' name='saleType' id="saleCoupon" value='coupon'/>
					 	<label for="saleCoupon">쿠폰&nbsp;&nbsp;</label>
					 <br>
					 <input class="form-control" type="text" name="code" placeholder="쿠폰/마일리지 번호를 입력해주세요." style="width: 250px; display:inline-block;"/>
					 <button class="btn" onclick="check">사용</button>
			  	</div> 
				
		  </div>
		  <div class="col-md-3"></div>
		</div>
		
		<!-- 결제 수단 -->
		<div class="row">
		  <div class="col-xs-3"></div>	
		  <div class="col-xs-6 text-center" style="border: 2px solid; margin-top: 20px; line-height: 50px; border-radius: 8px;">
			  	
			  	<div>
			  		 <h3>결제수단</h3>
					 <input type='radio' name='payType' id="payKakao" value='kakao' checked="checked"/>
					 	 <label for="payKakao">📱카카오&nbsp;&nbsp;</label>
					 <input type='radio' name='payType' id="payCard" value='card' />
					 	 <label for="payCard">💳신용카드&nbsp;&nbsp;</label>
					 <input type='radio' name='payType' id="payBank" value='money' />
					 	 <label for="payBank">💰계좌이체&nbsp;&nbsp;</label>
			  	</div>
				
		  </div>
		  <div class="col-xs-3"></div>
		</div>
		
		
		<div class="row">
		  <div class="col-xs-4"></div>	
		  <div class="col-xs-4" style="margin-top: 20px; height: 80px; text-align: center;">
			  	<div style="display: inline-block; width: 50%;">
			  	
			  		<!-- 결제 -->
			  		<button  class="btn btn-primary" type="button" onclick="payment()">결제하기</button>
					<!-- 취소 메인홈으로가기 -->
					<button  class="btn btn-default" type="button" onclick="newPage()">취소</button>
			  	</div>
				
		  </div>
		  <div class="col-xs-4"></div>
		</div>
	</form>
	<!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>