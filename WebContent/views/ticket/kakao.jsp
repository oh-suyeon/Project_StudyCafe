<%@page import="daily.user.vo.UserVO"%>
<%@page import="daily.owner.vo.OwnerVO"%>
<%@page import="daily.admin.vo.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%

	//카페 지점
	String cafeNo = (String)request.getParameter("cafeNo");
	
	//상품 유형 ex)당일권,정기권
    String ticketType = (String)request.getParameter("ticketType");
	//상품 가격 ex)3000원,5000원,7000원
    String ticketPrice = (String)request.getParameter("ticketPrice");
	//쿠폰 종류 ex)사용안함, 마일리지, 쿠폰
    String saleType = (String)request.getParameter("saleType");
    //결제 유형 ex)카카오,카드,계좌이체
	String payType = (String)request.getParameter("payType");
   
    
    
    //티켓 번호
    String ticketNo = "";
    if(ticketPrice.equals("3000")){
    	ticketNo="1";
    }else if(ticketPrice.equals("5000")){
    	ticketNo="2";
    }else if(ticketPrice.equals("7000")){
    	ticketNo="3";
    }else if(ticketPrice.equals("50000")){
    	ticketNo="4";
    }else if(ticketPrice.equals("80000")){
    	ticketNo="5";
    }else if(ticketPrice.equals("160000")){
    	ticketNo="6";
    }
    
    
    //쿠폰 번호
    String couponNo = "";
	//할인 가격
    String salePrice = "";
	//마일리지
    String buyMileage = "";
	//쿠폰할인율
    String buyCouponAmount ="0";
	//실제 가격
	String buyRealAmount = "";
    //쿠폰관련 할인금액처리
    if(saleType.equals("NoUse")){
    	couponNo="1";//할인 없음
    	salePrice="0";
    	buyRealAmount=	Double.toString(Double.parseDouble(ticketPrice)-Double.parseDouble(salePrice));
    	buyCouponAmount="0";
    	buyMileage="0";
    }
    
    
    //환급 YN
    String BuyRefundYn = "N";
    //환급 사유
    String BuyRefundReason = "...";
    
%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카카오</title>
	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	<!-- 	Jquery -->
	<script  src="http://code.jquery.com/jquery-latest.	min.js"></script>
	<!-- iamport.payment.js -->
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
</head>
<body>
<script type="text/javascript">
$(function(){
IMP.init('imp19732306');
//	카카오 결제

IMP.request_pay({
    pg : 'kakao',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '스터디 카페 이용권 결제',
    amount : '<%=ticketPrice%>',
    buyer_email :'<%=userVO.getUserEmail() %>',
    buyer_name : '<%=userVO.getUserName() %>',
    buyer_tel : '<%=userVO.getUserHp() %>',
    buyer_addr : '<%=userVO.getUserAddr1() %>+<%=userVO.getUserAddr1() %>',
    buyer_postcode : '<%=userVO.getUserZip() %>'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + '<%=userVO.getUserId()%>';
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + '<%=ticketPrice%>';
        msg += '카드 승인번호 : ' + rsp.apply_num;
        console.log("성공");
      	//성공시 이동할 페이지
		
//       	var form = document.fm;
// 		form.submit();
      	var fm = document.getElementById("fm");
      	fm.method="post";
      	fm.action="<%=request.getContextPath()%>/ticketInsert.do";
      	fm.submit();

<%--         location.href="<%=request.getContextPath()%>/reviewList.do"; --%>

    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        console.log("실패");
        //실패시 이동할 페이지
        location.href="<%=request.getContextPath()%>/views/ticket/ticketBuyForm.jsp";
	return 
    }

    alert(msg);
    
});


});
</script>
<form action="<%=request.getContextPath()%>/ticketInsert.do" method="post" id="fm" name="fm">
	<input type="hidden" name="ticketNo"	 	value="<%=ticketNo %>" >
	<input type="hidden" name="cafeNo" 			value="<%=cafeNo %>" >
	<input type="hidden" name="userId" 			value="<%=userVO.getUserId()%>" >
	<input type="hidden" name="buyCode" 		value="<%=payType %>" >
	<input type="hidden" name="buyAmount" 		value= "<%=ticketPrice%>" >
	<input type="hidden" name="userCouponNo" 	value= "<%=couponNo %>" >
	<input type="hidden" name="buyCouponAmount" value= "<%=buyCouponAmount %>"  >
	<input type="hidden" name="buyMileage" 		value= "<%=buyMileage%>">
	<input type="hidden" name="buyRealAmount" 	value= "1000" >
	<input type="hidden" name="buyRefundYn" 	value="<%=BuyRefundYn %>" >
	<input type="hidden" name="buyRefundReason" value= "<%=BuyRefundReason %>" >
</form>

</body>
</html>