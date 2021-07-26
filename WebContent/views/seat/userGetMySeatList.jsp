<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 로그인 확인 작업
	String loginId = (String)session.getAttribute("loginId");
	String loginName = (String)session.getAttribute("loginName");
	String loginType = (String)session.getAttribute("loginType");
// 	out.print("loginId : " + loginId + "<br />");
// 	out.print("loginName : " + loginName + "<br />");
// 	out.print("loginType : " + loginType + "<br />");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> DAILY | MY SEAT </title>

	<!-- 부트스트랩, jq, css 등 공통으로 사용하는 <head> 안의 링크들 -->
	<jsp:include page="../include/head.jsp"/>
	
	<script type="text/javascript">
		var loginId = "<%=loginId %>";
		var contextPath = "<%=request.getContextPath()%>";
	</script>
	<script src="../../js/seat/userGetMySeatList.js"></script>
	
	<!-- 바코드 생성 라이브러리 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../../js/common/jquery-barcode.js"></script>

</head>
<body>
	
	<!-- 네비-->
	<jsp:include page="../include/mainNav1.jsp"/>
	<!-- 상세 네비-->
	<jsp:include page="../include/mainNav2.jsp"/>
	
	
	
	<!-- 해당 페이지 내용 -->
	<div class="container divPadding marginBottom30">
	
		<div class="alignCenter marginBottom30">
			<span class="textUnderline fontSize2">발권/결제 내역</span>
		</div>
		
		<!-- 게시글 목록 출력 -->	
		<div class="divPadding alignCenter marginBottom30">
			<table class="table table-hover cursorPointer text-center">
				<thead class="text-center">
					<tr>
						<th class="text-center">좌석 번호</th>
						<th class="text-center">예약 시작 시간</th>
						<th class="text-center">예약 종료 시간</th>
						<th class="text-center">입실 시간</th>
						<th class="text-center">퇴실 시간</th>
						<th class="text-center">이용 인원</th>
					</tr>
				</thead>
				<tbody id="tb" class="fontWeight300">
				</tbody>
			</table>
		</div>
		
    </div>
    
    
    
    <!-- 풋터 -->
	<jsp:include page="../include/footer.jsp"/>
	
	
	
	<!-- Modal 시작-->
	<div class="modal fade" id="modalTicket" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">결제 정보</h4>
				</div>

				<div class="modal-body text-center">
				
					<table class="table table-bordered text-center" id="modalTb">
						<thead>
							<tr>
								<th class="text-center">구매 번호</th>
								<th class="text-center">이용권 유형</th>
								<th class="text-center">지점</th>
								<th class="text-center">구매일</th>
								<th class="text-center">결제수단</th>
								<th class="text-center">결제 금액</th>
<!-- 								<th class="text-center">쿠폰 적용</th> -->
<!-- 								<th class="text-center">마일리지 적용</th> -->
<!-- 								<th class="text-center">실 결제 금액</th> -->
								<th class="text-center">환불 여부</th>
								<th class="text-center">환불 사유</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					
					<!-- buyTicketNo가 담겨있다 -->
					<h5>입퇴실 QR 코드</h5>
					<div id="bcTarget" style="margin-top:5px; margin-left:375px;" class="text-center"></div>
					
					<div>
						<form id="fm" action="#">
							<input type="hidden" id="refundDate">
							<input class="form-control form-inline " id="refundReason" name="buyRefundReason" placeholder="환불 사유">
							<button id="refundBtn" class="btn btn-warning marginBottom30" onclick="getRefund();" name="buyRefundYn" value="Y">결제 취소</button>
						</form>
					</div>
					
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
					
				</div>

			</div>
		</div>
	</div>
	<!-- Modal 끝-->
	
</body>
</html>