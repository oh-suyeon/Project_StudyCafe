<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% // 로그인 세션 확인
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
		 
		 
// 		상품유형 
		 $('input[type="checkbox"][name="productDateType"]').click(function(){
		  if($(this).prop('checked')){
		     $('input[type="checkbox"][name="productDateType"]').prop('checked',false);
		     $(this).prop('checked',true);
		    }
		   });
//	 	시간 유형 
		 $('input[type="checkbox"][name="productTimeType"]').click(function(){
		  if($(this).prop('checked')){
		     $('input[type="checkbox"][name="productTimeType"]').prop('checked',false);
		     $(this).prop('checked',true);
		    }
		   });

// 		쿠폰&마일리지 
		 $('input[type="checkbox"][name="saleType"]').click(function(){
		  if($(this).prop('checked')){
		     $('input[type="checkbox"][name="saleType"]').prop('checked',false);
		     $(this).prop('checked',true);
		    }
		   });
// 		지불 수단 
		 $('input[type="checkbox"][name="payType"]').click(function(){
		  if($(this).prop('checked')){
		     $('input[type="checkbox"][name="payType"]').prop('checked',false);
		     $(this).prop('checked',true);
		    }
		   });
		
		
	});
	



	
	
	
	



	
	
	
	// 	취소버튼 클릭시
	function newPage()  {
		  window.location.href = 'views/main/main.jsp'
		}
	</script>
</head>
<body>
<!-- 네비-->
<jsp:include page="../include/mainNav1.jsp"/>
<!-- 상세 네비-->
<jsp:include page="../include/mainNav2.jsp"/>


	<h1 style="text-align: center;">상품결제</h1>
	
	<form method="post" action="<%=request.getContextPath() %>/views/ticket/kakao.jsp">
	
	<!-- 상품 유형 -->
	<div class="row">
	  <div class="col-md-3"></div>	
	  <div class="col-md-6" style="background: #CCFFFF; border: 2px solid; margin-top: 20px; height: 80px; border-radius: 8px;">
		  	<div>
		  		 <p>상품유형</p>
				 <label><input type='checkbox' name='productDateType' value="01" checked="checked"/>당일권</label><!--oneDay -->
				 <label><input type='checkbox' name='productDateType' value='02' />정기권</label><!--regularDay -->
		  	</div>
			
	  </div>
	  <div class="col-md-3"></div>
	</div>
	
	<!-- 가격 유형 -->
		
	<div class="row">
	  <div class="col-md-3"></div>	
	  <div class="col-md-6" style="background: #CCFFFF; border: 2px solid; margin-top: 20px; height: 80px; border-radius: 8px;">
		  	<div>
		  		 <p>상품선택</p>
				 <label><input type='checkbox' name='productTimeType' value='1000' checked="checked"/>1시간/1000원</label>
				 <label><input type='checkbox' name='productTimeType' value='2000' />2시간/3000원</label>
				 <label><input type='checkbox' name='productTimeType' value='5000' />4시간/5000원</label>
				 <label><input type='checkbox' name='productTimeType' value='7000' />6시간/7000원</label>
				 <label><input type='checkbox' name='productTimeType' value='70000' />2주/70000원</label>
				 <label><input type='checkbox' name='productTimeType' value='11000' />4주/110000원</label>
				 <label><input type='checkbox' name='productTimeType' value='7000' />6시간/7000원</label>
		  	</div>
			
	  </div>
	  <div class="col-md-3"></div>
	</div>
	<!-- 마일리지 & 쿠폰  -->
	<div class="row">
	  <div class="col-md-3"></div>	
	  <div class="col-md-6" style="background: #CCFFFF; border: 2px solid; margin-top: 20px; height: 100px; border-radius: 8px;">
		  	<div>
		  		 <p>마일리지 & 쿠폰 </p>
				 <input type='checkbox' name='saleType' value='null' checked="checked"/>사용안함
				 <input type='checkbox' name='saleType' value='mileage'/>마일리
				 <input type='checkbox' name='saleType' value='coupon'/>쿠폰
				 <br>
				 <input type="text" name="code" placeholder="쿠폰/마일리지 번호를 입력해주세요." style="width: 250px;"/><button onclick="check">사용</button>
		  	</div>
			
	  </div>
	  <div class="col-md-3"></div>
	</div>
	
	<!-- 결제 수단 -->
	<div class="row">
	  <div class="col-md-3"></div>	
	  <div class="col-md-6" style="background: #CCFFFF; border: 2px solid; margin-top: 20px; height: 80px; border-radius: 8px;">
		  	
		  	<div>
		  		 <p>결제수단</p>
				 <input type='checkbox' name='payType' value='kakao' checked="checked"/>📱카카오
				 <input type='checkbox' name='payType' value='card' />💳신용카드
				 <input type='checkbox' name='payType' value='money' />💰계좌이체
		  	</div>
			
	  </div>
	  <div class="col-md-3"></div>
	</div>
	
	
	<div class="row">
	  <div class="col-md-4"></div>	
	  <div class="col-md-4" style="margin-top: 20px; height: 80px; text-align: center;">
		  	<div style="display: inline-block; width: 50%;">
		  	
		  		<!-- 결제 -->
		  		<button  class="btn btn-primary" type="submit" >결제하기</button>
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